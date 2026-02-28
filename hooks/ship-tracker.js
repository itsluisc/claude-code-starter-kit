#!/usr/bin/env node
// Ship Tracker — PostToolUse hook
//
// Tracks what was actually SHIPPED per session to power the BE DANGEROUS ratio.
// Categorizes output as "dangerous" (visible to humans) vs "system" (internal).
//
// Dangerous = content filmed/posted, Notion entries pushed, files delivered,
//             commits pushed, emails sent, PRs created
// System = skills built, hooks written, pipelines configured, refactors,
//          internal tool improvements
//
// At session end, provides the ratio for the BE DANGEROUS protocol.
// Also detects 60+ min of system-only work and interrupts with the dangerous question.

const fs = require('fs');
const path = require('path');
const os = require('os');

const SESSION_WARN_MINUTES = 60; // Warn after 60 min of system-only work
const REPORT_INTERVAL = 50; // Report stats every N tool calls

// Classification rules
const DANGEROUS_SIGNALS = [
  // Notion pushes (visible output)
  { pattern: /notion-push\.py\s+create/i, label: 'Notion entry created' },
  { pattern: /notion.*API-post-page/i, label: 'Notion page created' },
  // Git pushes
  { pattern: /git\s+push/i, label: 'Code pushed' },
  { pattern: /gh\s+pr\s+create/i, label: 'PR created' },
  // Email
  { pattern: /send_email|gmail.*send/i, label: 'Email sent' },
  // File delivery (Clone Factory output)
  { pattern: /Clone-Factory.*\.(mp4|mov|png|jpg)/i, label: 'Media delivered' },
  // Content creation
  { pattern: /render-clone|ffmpeg.*output.*\.(mp4|mov)/i, label: 'Video rendered' },
  { pattern: /elevenlabs|heygen/i, label: 'Clone content generated' },
  // Posting
  { pattern: /post.*content|publish|schedule/i, label: 'Content posted/scheduled' }
];

const SYSTEM_SIGNALS = [
  { pattern: /\.claude\/skills/i, label: 'Skill work' },
  { pattern: /\.claude\/hooks/i, label: 'Hook work' },
  { pattern: /\.claude\/scripts/i, label: 'Script work' },
  { pattern: /settings\.json/i, label: 'Config work' },
  { pattern: /CLAUDE\.md|MEMORY\.md/i, label: 'Documentation' },
  { pattern: /refactor|cleanup|reorganize/i, label: 'Refactoring' },
  { pattern: /\.claude\/references/i, label: 'Reference updates' }
];

let input = '';
process.stdin.setEncoding('utf8');
process.stdin.on('data', chunk => input += chunk);
process.stdin.on('end', () => {
  try {
    const data = JSON.parse(input);
    const sessionId = data.session_id;
    if (!sessionId) { process.exit(0); return; }

    // Load tracking state
    const trackPath = path.join(os.tmpdir(), `claude-ship-${sessionId}.json`);
    let track = {
      dangerous: [],
      system: [],
      callCount: 0,
      sessionStart: null,
      lastDangerousAt: 0,
      lastReportAt: 0,
      hasWarnedDangerous: false
    };
    if (fs.existsSync(trackPath)) {
      try { track = JSON.parse(fs.readFileSync(trackPath, 'utf8')); } catch (e) {}
    }

    if (!track.sessionStart) track.sessionStart = Date.now();
    track.callCount = (track.callCount || 0) + 1;

    // Build signal text from tool input/output
    const signals = [];
    if (data.tool_name) signals.push(data.tool_name);
    if (data.tool_input) {
      const inputStr = typeof data.tool_input === 'string'
        ? data.tool_input
        : JSON.stringify(data.tool_input);
      signals.push(inputStr.substring(0, 1000));
    }
    const signalText = signals.join(' ');

    // Classify
    let classified = false;
    for (const sig of DANGEROUS_SIGNALS) {
      if (sig.pattern.test(signalText)) {
        // Deduplicate
        if (!track.dangerous.includes(sig.label)) {
          track.dangerous.push(sig.label);
        }
        track.lastDangerousAt = track.callCount;
        classified = true;
        break;
      }
    }

    if (!classified) {
      for (const sig of SYSTEM_SIGNALS) {
        if (sig.pattern.test(signalText)) {
          if (!track.system.includes(sig.label)) {
            track.system.push(sig.label);
          }
          classified = true;
          break;
        }
      }
    }

    // Save state
    fs.writeFileSync(trackPath, JSON.stringify(track));

    // ═══════════════════════════════════════════
    // CHECK: 60+ min of system-only work?
    // ═══════════════════════════════════════════
    const sessionMinutes = (Date.now() - track.sessionStart) / (1000 * 60);
    const callsSinceDangerous = track.callCount - track.lastDangerousAt;

    if (sessionMinutes >= SESSION_WARN_MINUTES &&
        track.dangerous.length === 0 &&
        track.system.length > 0 &&
        !track.hasWarnedDangerous) {

      track.hasWarnedDangerous = true;
      fs.writeFileSync(trackPath, JSON.stringify(track));

      emit(
        `🔥 BE DANGEROUS CHECK: ${Math.round(sessionMinutes)} min into session. ` +
        `System output: ${track.system.join(', ')}. ` +
        `Dangerous output: ZERO. ` +
        `This is comfortable. What's the dangerous move? ` +
        `Is there something Luis should FILM, SHIP, or PUBLISH from what we've built?`
      );
      return;
    }

    // ═══════════════════════════════════════════
    // PERIODIC REPORT (every N tool calls)
    // ═══════════════════════════════════════════
    if (track.callCount > 0 &&
        track.callCount % REPORT_INTERVAL === 0 &&
        (track.dangerous.length > 0 || track.system.length > 0)) {

      const dCount = track.dangerous.length;
      const sCount = track.system.length;
      const ratio = dCount > 0 ? `${dCount}:${sCount}` : `0:${sCount}`;

      // Only emit if there's meaningful data
      if (dCount + sCount >= 3) {
        emit(
          `📊 SHIP TRACKER: Dangerous:System ratio = ${ratio}. ` +
          `Shipped: ${track.dangerous.length > 0 ? track.dangerous.join(', ') : 'nothing yet'}. ` +
          `Built: ${track.system.length > 0 ? track.system.join(', ') : 'nothing tracked'}.`
        );
      }
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
