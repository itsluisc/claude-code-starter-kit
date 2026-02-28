#!/usr/bin/env node
// Cost Guardian — PostToolUse hook
//
// Monitors Claude Code weekly usage and warns before hitting limits.
// Reads from the GSD statusline metrics (same bridge as context-survival).
//
// Weekly limit resets Thursday 9:59 PM.
// Thresholds: 50% → info, 70% → warning, 85% → critical.
//
// Also tracks Task agent spawns (expensive operations) and warns
// if spawning too many Opus agents.

const fs = require('fs');
const path = require('path');
const os = require('os');

// Weekly usage thresholds (percentage of weekly limit)
const INFO_THRESHOLD = 50;
const WARNING_THRESHOLD = 70;
const CRITICAL_THRESHOLD = 85;

// Agent spawn tracking
const MAX_OPUS_AGENTS_PER_SESSION = 5;
const DEBOUNCE_CALLS = 30; // Min tool calls between warnings at same level

let input = '';
process.stdin.setEncoding('utf8');
process.stdin.on('data', chunk => input += chunk);
process.stdin.on('end', () => {
  try {
    const data = JSON.parse(input);
    const sessionId = data.session_id;
    if (!sessionId) { process.exit(0); return; }

    // Load tracking state
    const trackPath = path.join(os.tmpdir(), `claude-cost-${sessionId}.json`);
    let track = {
      lastLevel: null,
      callsSinceWarn: 0,
      opusAgentCount: 0,
      totalAgentCount: 0,
      weeklyWarned: false
    };
    if (fs.existsSync(trackPath)) {
      try { track = JSON.parse(fs.readFileSync(trackPath, 'utf8')); } catch (e) {}
    }

    track.callsSinceWarn = (track.callsSinceWarn || 0) + 1;

    // ═══════════════════════════════════════════
    // TRACK AGENT SPAWNS
    // ═══════════════════════════════════════════
    if (data.tool_name === 'Task') {
      track.totalAgentCount = (track.totalAgentCount || 0) + 1;

      // Check if it's an opus agent
      const toolInput = data.tool_input;
      if (toolInput && typeof toolInput === 'object' && toolInput.model === 'opus') {
        track.opusAgentCount = (track.opusAgentCount || 0) + 1;

        if (track.opusAgentCount >= MAX_OPUS_AGENTS_PER_SESSION) {
          fs.writeFileSync(trackPath, JSON.stringify(track));
          emit(
            `💰 COST GUARDIAN: ${track.opusAgentCount} Opus agents spawned this session. ` +
            `Opus agents are EXPENSIVE — switch to Sonnet for bulk work, Haiku for simple lookups. ` +
            `Reserve Opus for critical decisions only.`
          );
          return;
        }
      }
    }

    // ═══════════════════════════════════════════
    // CHECK WEEKLY USAGE (from statusline metrics)
    // ═══════════════════════════════════════════
    const metricsPath = path.join(os.tmpdir(), `claude-ctx-${sessionId}.json`);
    if (!fs.existsSync(metricsPath)) {
      fs.writeFileSync(trackPath, JSON.stringify(track));
      process.exit(0);
      return;
    }

    let metrics;
    try {
      metrics = JSON.parse(fs.readFileSync(metricsPath, 'utf8'));
    } catch (e) {
      fs.writeFileSync(trackPath, JSON.stringify(track));
      process.exit(0);
      return;
    }

    // Weekly usage percentage (if available from statusline)
    const weeklyPct = metrics.weekly_used_pct;
    if (weeklyPct === undefined) {
      fs.writeFileSync(trackPath, JSON.stringify(track));
      process.exit(0);
      return;
    }

    // Determine level
    let currentLevel = null;
    if (weeklyPct >= CRITICAL_THRESHOLD) currentLevel = 'critical';
    else if (weeklyPct >= WARNING_THRESHOLD) currentLevel = 'warning';
    else if (weeklyPct >= INFO_THRESHOLD) currentLevel = 'info';

    if (!currentLevel) {
      fs.writeFileSync(trackPath, JSON.stringify(track));
      process.exit(0);
      return;
    }

    // Debounce
    const escalated = (
      (currentLevel === 'critical' && track.lastLevel !== 'critical') ||
      (currentLevel === 'warning' && track.lastLevel !== 'warning' && track.lastLevel !== 'critical')
    );

    if (!escalated && track.callsSinceWarn < DEBOUNCE_CALLS) {
      fs.writeFileSync(trackPath, JSON.stringify(track));
      process.exit(0);
      return;
    }

    // Fire warning
    track.callsSinceWarn = 0;
    track.lastLevel = currentLevel;
    fs.writeFileSync(trackPath, JSON.stringify(track));

    // Calculate reset time (next Thursday 9:59 PM)
    const now = new Date();
    const dayOfWeek = now.getDay(); // 0=Sun, 4=Thu
    let daysUntilThursday = (4 - dayOfWeek + 7) % 7;
    if (daysUntilThursday === 0 && now.getHours() >= 22) daysUntilThursday = 7;
    const resetStr = daysUntilThursday === 0 ? 'today' :
                     daysUntilThursday === 1 ? 'tomorrow' :
                     `in ${daysUntilThursday} days`;

    if (currentLevel === 'critical') {
      emit(
        `🔴 COST GUARDIAN: Weekly usage at ${weeklyPct}%. ` +
        `CRITICAL — approaching weekly limit. Resets ${resetStr} (Thu 9:59 PM). ` +
        `Switch to Sonnet for ALL agent tasks. Minimize tool calls. ` +
        `Finish current work and avoid spawning new agents.`
      );
    } else if (currentLevel === 'warning') {
      emit(
        `⚠️ COST GUARDIAN: Weekly usage at ${weeklyPct}%. ` +
        `Resets ${resetStr} (Thu 9:59 PM). ` +
        `Use Sonnet for bulk work, reserve Opus for decisions. ` +
        `Batch operations where possible.`
      );
    } else {
      emit(
        `💰 COST GUARDIAN: Weekly usage at ${weeklyPct}%. ` +
        `Halfway through weekly limit. Resets ${resetStr}. ` +
        `Agents spawned this session: ${track.totalAgentCount} (${track.opusAgentCount} Opus).`
      );
    }

  } catch (e) {
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
