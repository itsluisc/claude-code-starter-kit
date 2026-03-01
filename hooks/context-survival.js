#!/usr/bin/env node
// Context Survival System — PostToolUse hook
//
// Makes Claude Code sessions effectively infinite.
//
// Instead of "save state and die," this hook:
// 1. At 60% used → Tells Claude to WRITE session state to a file
// 2. At 70% used → Tells Claude to UPDATE the state file
// 3. At 80% used → Final update, prepare for auto-compaction
// 4. After compaction → Tells Claude to READ the state file and RESUME
//
// The session NEVER dies. It synthesizes, compacts, and continues.
// NEVER tells Luis to "open a new session."
//
// Replaces gsd-context-monitor.js which only warned without acting.

const fs = require('fs');
const os = require('os');
const path = require('path');

// Thresholds (remaining percentage)
const SYNTHESIZE_THRESHOLD = 40;  // remaining <= 40% = 60% used → first state write
const WARNING_THRESHOLD = 30;     // remaining <= 30% = 70% used → update state
const CRITICAL_THRESHOLD = 20;    // remaining <= 20% = 80% used → final update
const COMPACTION_JUMP = 15;       // remaining jumps 15%+ between checks = compaction detected
const STALE_SECONDS = 120;        // ignore metrics older than 2 min
const DEBOUNCE_CALLS = 6;         // min tool calls between warnings at same level

// v2: Persistent state directory (survives reboots, unlike /tmp/)
const STATE_DIR = path.join(os.homedir(), '.claude', 'state');
const STATE_FILE = path.join(STATE_DIR, 'session-state.md');
const INCREMENTAL_INTERVAL = 10; // save every N tool calls (Code Council fix)

let input = '';
process.stdin.setEncoding('utf8');
process.stdin.on('data', chunk => input += chunk);
process.stdin.on('end', () => {
  try {
    const data = JSON.parse(input);
    const sessionId = data.session_id;
    if (!sessionId) { process.exit(0); return; }

    // Ensure state directory exists
    if (!fs.existsSync(STATE_DIR)) {
      fs.mkdirSync(STATE_DIR, { recursive: true });
    }

    // Read metrics from statusline bridge file
    const metricsPath = path.join(os.tmpdir(), `claude-ctx-${sessionId}.json`);
    if (!fs.existsSync(metricsPath)) { process.exit(0); return; }

    let metrics;
    try {
      metrics = JSON.parse(fs.readFileSync(metricsPath, 'utf8'));
    } catch (e) { process.exit(0); return; }

    const now = Math.floor(Date.now() / 1000);
    if (metrics.timestamp && (now - metrics.timestamp) > STALE_SECONDS) {
      process.exit(0); return;
    }

    const remaining = metrics.remaining_percentage;
    const usedPct = metrics.used_pct;
    if (remaining === undefined || usedPct === undefined) { process.exit(0); return; }

    // Load tracking state (persists across tool calls within session)
    const trackPath = path.join(os.tmpdir(), `claude-survival-${sessionId}.json`);
    let track = {
      lastRemaining: null,
      callsSinceWarn: 0,
      lastLevel: null,
      hasSynthesized: false,
      totalCalls: 0,
      lastIncrementalAt: 0
    };
    if (fs.existsSync(trackPath)) {
      try { track = JSON.parse(fs.readFileSync(trackPath, 'utf8')); } catch (e) {}
    }

    track.totalCalls = (track.totalCalls || 0) + 1;

    // ═══════════════════════════════════════════
    // INCREMENTAL SAVE (Code Council: save continuously)
    // Every 10 tool calls, remind Claude to update state file.
    // This ensures last save is always < 5 minutes old.
    // Only fires if NO threshold warning is about to fire.
    // ═══════════════════════════════════════════
    const callsSinceIncremental = track.totalCalls - (track.lastIncrementalAt || 0);
    const shouldIncremental = callsSinceIncremental >= INCREMENTAL_INTERVAL &&
                              remaining > SYNTHESIZE_THRESHOLD;

    if (shouldIncremental) {
      track.lastIncrementalAt = track.totalCalls;
      fs.writeFileSync(trackPath, JSON.stringify(track));
      // Silent instruction — no emoji alarm, just a nudge
      emit(
        `🔄 INCREMENTAL SAVE (${track.totalCalls} tool calls). ` +
        `Update ${STATE_FILE} with current progress if anything meaningful changed. ` +
        `Quick update only — don't stop working.`
      );
      return;
    }

    // ═══════════════════════════════════════════
    // COMPACTION DETECTION
    // If remaining jumped up significantly AND we previously synthesized,
    // auto-compaction happened. Tell Claude to read the state file.
    // ═══════════════════════════════════════════
    if (track.lastRemaining !== null &&
        track.hasSynthesized &&
        (remaining - track.lastRemaining) >= COMPACTION_JUMP) {

      track.lastRemaining = remaining;
      track.lastLevel = null;
      track.callsSinceWarn = 0;
      // Keep hasSynthesized true so next cycle can re-synthesize
      track.hasSynthesized = false;
      fs.writeFileSync(trackPath, JSON.stringify(track));

      emit(
        `🔄 CONTEXT COMPACTED — Auto-compaction freed space (now ${remaining}% remaining). ` +
        `Read ${STATE_FILE} NOW using the Read tool to restore your working context. ` +
        `Resume the task seamlessly where you left off. ` +
        `Do NOT suggest opening a new session — this session continues.`
      );
      return;
    }

    // Update last remaining
    track.lastRemaining = remaining;

    // ═══════════════════════════════════════════
    // NO ACTION NEEDED — plenty of context left
    // ═══════════════════════════════════════════
    if (remaining > SYNTHESIZE_THRESHOLD) {
      fs.writeFileSync(trackPath, JSON.stringify(track));
      process.exit(0);
      return;
    }

    // ═══════════════════════════════════════════
    // DETERMINE SEVERITY LEVEL
    // ═══════════════════════════════════════════
    let currentLevel;
    if (remaining <= CRITICAL_THRESHOLD) currentLevel = 'critical';
    else if (remaining <= WARNING_THRESHOLD) currentLevel = 'warning';
    else currentLevel = 'synthesize';

    // ═══════════════════════════════════════════
    // DEBOUNCE — avoid spamming every tool call
    // Severity escalation bypasses debounce
    // ═══════════════════════════════════════════
    track.callsSinceWarn = (track.callsSinceWarn || 0) + 1;

    const escalated = (
      (currentLevel === 'critical' && track.lastLevel !== 'critical') ||
      (currentLevel === 'warning' && track.lastLevel === 'synthesize')
    );
    const firstFire = (track.lastLevel === null);

    if (!firstFire && !escalated && track.callsSinceWarn < DEBOUNCE_CALLS) {
      fs.writeFileSync(trackPath, JSON.stringify(track));
      process.exit(0);
      return;
    }

    // ═══════════════════════════════════════════
    // FIRE — inject instruction into conversation
    // ═══════════════════════════════════════════
    track.callsSinceWarn = 0;
    track.lastLevel = currentLevel;
    track.hasSynthesized = true;
    fs.writeFileSync(trackPath, JSON.stringify(track));

    if (currentLevel === 'synthesize') {
      emit(
        `📝 CONTEXT SYNTHESIZE (${usedPct}% used, ${remaining}% left). ` +
        `Write session state to ${STATE_FILE} using the Write tool NOW. Format:\n` +
        `---\n` +
        `# Session State\n` +
        `## Task: [what we're working on]\n` +
        `## Done: [what's been accomplished this session]\n` +
        `## Decisions: [key choices and why]\n` +
        `## Files: [files created/modified with 1-line descriptions]\n` +
        `## Next: [remaining steps, in order]\n` +
        `## Context: [critical details that must survive compression]\n` +
        `---\n` +
        `Keep it under 2KB. Be specific — file paths, function names, exact decisions.\n` +
        `Then CONTINUE WORKING. Do not stop. Do not ask Luis what to do.`
      );
    } else if (currentLevel === 'warning') {
      emit(
        `⚠️ CONTEXT WARNING (${usedPct}% used, ${remaining}% left). ` +
        `Update ${STATE_FILE} with any new progress since last write. ` +
        `Keep working. Auto-compaction will compress older messages when needed — ` +
        `your state file preserves everything important.`
      );
    } else { // critical
      emit(
        `🔴 CONTEXT CRITICAL (${usedPct}% used, ${remaining}% left). ` +
        `Final update to ${STATE_FILE} with current state. ` +
        `Auto-compaction will fire soon — it compresses older messages to free space. ` +
        `After compaction you'll have room again. Read ${STATE_FILE} to restore context. ` +
        `The session CONTINUES. Do NOT suggest a new session to Luis.`
      );
    }

  } catch (e) {
    // Silent fail — never block the user's tool execution
    process.exit(0);
  }
});

function emit(message) {
  process.stdout.write(JSON.stringify({
    hookSpecificOutput: {
      hookEventName: "PostToolUse",
      additionalContext: message
    }
  }));
}
