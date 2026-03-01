#!/usr/bin/env node
// Session End Enforcer v5 — PostToolUse hook
//
// v5: VERIFY, DON'T TRUST. Checks files EXIST on disk, not just tool calls.
// Tracks: supermemory, session-log, session state, git, notion, MEMORY.md, content ideas
//
// KEY CHANGES from v4:
// - FILE VERIFICATION: checks disk, not just tool-call tracking
// - Session state: verifies /tmp/claude-session-state.md exists + is fresh
// - Git: verifies working tree is clean (committed)
// - Session log: verifies today's log exists in session-logs/
// - MEMORY.md: verifies file was recently modified
// - Every 15 tool calls (not 10) to reduce noise but INCREASE impact
//
// Built: Feb 26, 2026 (v3). v4: Feb 28. v5: Feb 28 (file verification)

const fs = require('fs');
const os = require('os');
const path = require('path');

let input = '';
process.stdin.setEncoding('utf8');
process.stdin.on('data', chunk => input += chunk);
process.stdin.on('end', () => {
  try {
    const data = JSON.parse(input);
    const toolName = data.tool_name || '';
    const toolInput = JSON.stringify(data.tool_input || {}).toLowerCase();
    const sessionId = data.session_id || 'unknown';
    const trackPath = path.join(os.tmpdir(), `claude-backup-track-${sessionId}.json`);

    // Load or init tracking
    let track = {
      builds: 0, toolCalls: 0, supermemory: false, stateFile: false,
      sessionLog: false, gitCommit: false, gitPush: false, notion: false,
      memoryMd: false, contentIdeas: false, lastNagAt: 0,
      verificationShown: false
    };
    try { track = JSON.parse(fs.readFileSync(trackPath, 'utf8')); } catch(e) {}

    track.toolCalls = (track.toolCalls || 0) + 1;

    // --- TRACK what's been done ---

    // Track builds (Write/Edit to skill files, hooks, scripts, bots, clone-factory, CLAUDE.md)
    if ((toolName === 'Write' || toolName === 'Edit') &&
        (toolInput.includes('.claude/skills') || toolInput.includes('.claude/hooks') ||
         toolInput.includes('.claude/scripts') || toolInput.includes('clone-factory') ||
         toolInput.includes('.claude/bots') || toolInput.includes('claude.md') ||
         toolInput.includes('.claude/references'))) {
      track.builds = (track.builds || 0) + 1;
      track.lastBuildTime = Date.now();
    }

    // Also track builds for general code files (not just .claude/)
    if ((toolName === 'Write' || toolName === 'Edit') &&
        (toolInput.includes('.py') || toolInput.includes('.js') || toolInput.includes('.ts') ||
         toolInput.includes('.sh') || toolInput.includes('.yaml') || toolInput.includes('.json')) &&
        !toolInput.includes('node_modules') && !toolInput.includes('.git/')) {
      track.builds = (track.builds || 0) + 1;
      track.lastBuildTime = Date.now();
    }

    // Track supermemory save
    if (toolName.includes('supermemory') && toolName.includes('memory')) {
      track.supermemory = true;
      track.supermemoryTime = Date.now();
    }

    // Track session state write (both old /tmp/ path and new ~/.claude/state/ path)
    if (toolName === 'Write' && (toolInput.includes('session-state') || toolInput.includes('.claude/state'))) {
      track.stateFile = true;
    }

    // Track session log write
    if (toolName === 'Write' && toolInput.includes('session-logs/')) {
      track.sessionLog = true;
      track.sessionLogTime = Date.now();
    }

    // Track git commit
    if (toolName === 'Bash' && toolInput.includes('git commit')) {
      track.gitCommit = true;
      track.gitCommitTime = Date.now();
    }

    // Track git push
    if (toolName === 'Bash' && toolInput.includes('git push')) {
      track.gitPush = true;
    }

    // Track Notion push
    if (toolName.includes('notion') || (toolName === 'Bash' && toolInput.includes('notion-push'))) {
      track.notion = true;
    }

    // Track MEMORY.md update
    if ((toolName === 'Write' || toolName === 'Edit') && toolInput.includes('memory.md')) {
      track.memoryMd = true;
    }

    // Track content ideas capture
    if (toolInput.includes('content-ideas') || toolInput.includes('content ideas') ||
        toolInput.includes('dace2176-bdfe-4a8f-a054-2886f8a9612e')) {
      track.contentIdeas = true;
    }

    // Save tracking
    fs.writeFileSync(trackPath, JSON.stringify(track));

    // --- ENFORCEMENT LOGIC ---

    // Only enforce if something was built this session
    if (!track.builds || track.builds < 1) { process.exit(0); return; }

    // Check context remaining from survival hook bridge file
    let contextLow = false;
    try {
      const metricsPath = path.join(os.tmpdir(), `claude-ctx-${sessionId}.json`);
      if (fs.existsSync(metricsPath)) {
        const metrics = JSON.parse(fs.readFileSync(metricsPath, 'utf8'));
        if (metrics.remaining_percentage && metrics.remaining_percentage <= 35) {
          contextLow = true;
        }
      }
    } catch(e) {}

    // Two enforcement modes:
    // MODE 1: Regular check — every 15 tool calls, show what's missing
    // MODE 2: End-of-session — context low OR all builds done, show FULL verification table

    const sinceLastNag = track.toolCalls - (track.lastNagAt || 0);

    // MODE 2: Context is low and we haven't shown verification table yet
    if (contextLow && !track.verificationShown) {
      track.lastNagAt = track.toolCalls;
      track.verificationShown = true;
      fs.writeFileSync(trackPath, JSON.stringify(track));

      const table = buildVerificationTable(track);
      emit(
        `🔴 SESSION ENDING — Context low. MANDATORY backup sequence NOW.\n\n` +
        `You MUST complete ALL missing items below BEFORE doing anything else.\n` +
        `After completing, show Luis this verification table:\n\n` +
        table +
        `\n\nThis is NOT optional. Do it NOW. Luis should NEVER have to ask.`
      );
      return;
    }

    // MODE 1: Regular periodic check
    if (sinceLastNag < 15) { process.exit(0); return; }

    track.lastNagAt = track.toolCalls;
    fs.writeFileSync(trackPath, JSON.stringify(track));

    // v5: Build missing list using DISK VERIFICATION, not just booleans
    const verified = verifyFilesOnDisk(track);
    const missing = [];
    if (!verified.stateFile) missing.push('SESSION STATE — write /tmp/claude-session-state.md (not found or stale)');
    if (!verified.sessionLog) missing.push('SESSION LOG — Write ~/Desktop/_Code/session-logs/YYYY-MM-DD-topic.md');
    if (!track.contentIdeas) missing.push('CONTENT IDEAS — add build insights to DB dace2176-bdfe-4a8f-a054-2886f8a9612e');
    if (!track.supermemory) missing.push('SUPERMEMORY — save key decisions and what was built/learned');
    if (!verified.gitClean) missing.push('GIT COMMIT — uncommitted changes detected on disk');
    if (track.gitCommit && !track.gitPush) missing.push('GIT PUSH — committed but NOT pushed');
    if (!verified.memoryMd) missing.push('MEMORY.md — not updated this session');

    if (missing.length > 0) {
      emit(
        `🔴 ENFORCER v4 — ${track.builds} file(s) built | ${track.toolCalls} tool calls.\n` +
        `MANDATORY BACKUP ITEMS (do these WITHOUT Luis asking):\n` +
        missing.map(m => `  ❌ ${m}`).join('\n') +
        `\n\nSession log FIRST, then supermemory, then git. Luis should NEVER have to ask.`
      );
    }

  } catch (e) {
    process.exit(0);
  }
});

function buildVerificationTable(track) {
  const date = new Date().toISOString().split('T')[0];
  const yes = '✅';
  const no = '❌';

  // v5: VERIFY files on disk, not just tool-call booleans
  const verified = verifyFilesOnDisk(track);

  return `BACKUP VERIFICATION — ${date} (v5 — file-verified)\n` +
    `━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n` +
    `ALWAYS (every session with builds):\n` +
    `| Session State (disk) | ${verified.stateFile ? yes : no}  |\n` +
    `| Session Log (disk)   | ${verified.sessionLog ? yes : no}  |\n` +
    `| Supermemory (API)    | ${track.supermemory ? yes : no}  |\n` +
    `| Content Ideas (API)  | ${track.contentIdeas ? yes : no}  |\n` +
    `\n` +
    `IF CODE CHANGED:\n` +
    `| Git Clean (disk)     | ${verified.gitClean ? yes : no}  |\n` +
    `| Git Push (tracked)   | ${track.gitPush ? yes : no}  |\n` +
    `| MEMORY.md (disk)     | ${verified.memoryMd ? yes : no}  |\n` +
    `| Notion (API)         | ${track.notion ? yes : no}  |\n` +
    `━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n`;
}

function verifyFilesOnDisk(track) {
  const { execSync } = require('child_process');
  const result = {
    stateFile: false,
    sessionLog: false,
    gitClean: false,
    memoryMd: false
  };

  // Check session state file exists AND is recent (< 2 hours)
  // Check both new persistent path and legacy /tmp/ path
  try {
    const statePath = path.join(os.homedir(), '.claude', 'state', 'session-state.md');
    const legacyPath = '/tmp/claude-session-state.md';
    const checkPath = fs.existsSync(statePath) ? statePath : legacyPath;
    if (fs.existsSync(checkPath)) {
      const stat = fs.statSync(checkPath);
      const ageMin = (Date.now() - stat.mtimeMs) / (1000 * 60);
      result.stateFile = ageMin < 120; // must be < 2 hours old
    }
  } catch (e) {}

  // Check session log for today exists
  try {
    const today = new Date().toISOString().split('T')[0];
    const logDir = path.join(os.homedir(), 'Desktop', '_Code', 'session-logs');
    if (fs.existsSync(logDir)) {
      const files = fs.readdirSync(logDir);
      result.sessionLog = files.some(f => f.startsWith(today));
    }
  } catch (e) {}

  // Check git working tree is clean (no uncommitted changes)
  try {
    const status = execSync('git status --porcelain 2>/dev/null', {
      timeout: 3000,
      encoding: 'utf8'
    }).trim();
    result.gitClean = status.length === 0;
  } catch (e) {
    // Not a git repo or git not available — skip
    result.gitClean = true;
  }

  // Check MEMORY.md was modified today
  try {
    const memPath = path.join(os.homedir(), '.claude', 'projects');
    // Find any MEMORY.md modified in last 4 hours
    const found = execSync(
      `find "${memPath}" -name "MEMORY.md" -mmin -240 2>/dev/null | head -1`,
      { timeout: 3000, encoding: 'utf8' }
    ).trim();
    result.memoryMd = found.length > 0;
  } catch (e) {}

  return result;
}

function emit(message) {
  process.stdout.write(JSON.stringify({
    hookSpecificOutput: {
      hookEventName: "PostToolUse",
      additionalContext: message
    }
  }));
}
