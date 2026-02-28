#!/usr/bin/env node
// Smart Boot v2 — SessionStart hook
//
// Auto-detects what you're working on and preloads relevant context.
//
// Checks:
// 1. Session state file → continuation from last session
// 2. Working directory → project detection
// 3. Git branch → feature context
// 4. Recent files → active work detection
//
// CUSTOMIZE: Edit PROJECT_MAP below to match YOUR projects/clients.

const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');

const STATE_FILE = '/tmp/claude-session-state.md';

// ═══════════════════════════════════════════
// CUSTOMIZE THIS — Add your own projects
// ═══════════════════════════════════════════
const PROJECT_MAP = [
  // Example entries — replace with your own:
  // {
  //   pattern: /my-project/i,
  //   name: 'My Project',
  //   context: 'Main SaaS app — React frontend, Node backend.'
  // },
  // {
  //   pattern: /client-name/i,
  //   name: 'Client Name',
  //   context: 'Client project — WordPress site redesign.'
  // }
];

let input = '';
process.stdin.setEncoding('utf8');
process.stdin.on('data', chunk => input += chunk);
process.stdin.on('end', () => {
  try {
    const data = JSON.parse(input);
    const cwd = data.cwd || process.cwd();
    const parts = [];

    // ═══════════════════════════════════════════
    // 1. CHECK SESSION STATE FILE (continuation)
    // ═══════════════════════════════════════════
    if (fs.existsSync(STATE_FILE)) {
      const stat = fs.statSync(STATE_FILE);
      const ageHours = (Date.now() - stat.mtimeMs) / (1000 * 60 * 60);
      if (ageHours < 4) {
        const content = fs.readFileSync(STATE_FILE, 'utf8');
        const taskLine = content.split('\n').find(l => l.startsWith('## Task:'));
        if (taskLine) {
          parts.push(`Previous session (${Math.round(ageHours * 60)}min ago): ${taskLine.replace('## Task:', '').trim()}`);
        }
      }
    }

    // ═══════════════════════════════════════════
    // 2. DETECT PROJECT FROM CWD
    // ═══════════════════════════════════════════
    for (const proj of PROJECT_MAP) {
      if (proj.pattern.test(cwd)) {
        parts.push(`Project: ${proj.name} — ${proj.context}`);
        break;
      }
    }

    // ═══════════════════════════════════════════
    // 3. CHECK GIT BRANCH
    // ═══════════════════════════════════════════
    try {
      const branch = execSync('git branch --show-current 2>/dev/null', {
        cwd,
        timeout: 3000,
        encoding: 'utf8'
      }).trim();

      if (branch && branch !== 'main' && branch !== 'master') {
        parts.push(`Git branch: ${branch}`);
      }
    } catch (e) {}

    // ═══════════════════════════════════════════
    // 4. CHECK RECENT FILE ACTIVITY
    // ═══════════════════════════════════════════
    try {
      const recentFiles = execSync(
        `find "${cwd}" -maxdepth 3 -type f -mmin -120 -not -path '*/node_modules/*' -not -path '*/.git/*' -not -name '.*' 2>/dev/null | head -10`,
        { timeout: 5000, encoding: 'utf8' }
      ).trim();

      if (recentFiles) {
        const files = recentFiles.split('\n').filter(f => f);
        if (files.length > 0) {
          parts.push(`${files.length} file(s) modified in last 2h in ${path.basename(cwd)}/`);
        }
      }
    } catch (e) {}

    // ═══════════════════════════════════════════
    // 5. EMIT BOOT CONTEXT
    // ═══════════════════════════════════════════
    if (parts.length > 0) {
      emit(`🚀 SMART BOOT — ${parts.join(' | ')}`);
    }

  } catch (e) {
    process.exit(0);
  }
});

function emit(message) {
  process.stdout.write(JSON.stringify({
    hookSpecificOutput: {
      hookEventName: "SessionStart",
      additionalContext: message
    }
  }));
}
