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
// PROJECT DETECTION — Auto + Manual
// ═══════════════════════════════════════════
// Add your own projects here for custom context:
const PROJECT_MAP = [
  // {
  //   pattern: /my-project/i,
  //   name: 'My Project',
  //   context: 'Main SaaS app — React frontend, Node backend.'
  // }
];

// Auto-detect project type from files in the directory
function autoDetectProject(cwd) {
  const checks = [
    { file: 'package.json', name: 'Node.js', context: 'JavaScript/TypeScript project' },
    { file: 'Gemfile', name: 'Ruby', context: 'Ruby project (Rails/gems)' },
    { file: 'requirements.txt', name: 'Python', context: 'Python project' },
    { file: 'pyproject.toml', name: 'Python', context: 'Python project (modern)' },
    { file: 'Cargo.toml', name: 'Rust', context: 'Rust project' },
    { file: 'go.mod', name: 'Go', context: 'Go project' },
    { file: 'CLAUDE.md', name: 'Claude-enabled', context: 'Has CLAUDE.md project instructions' }
  ];
  for (const check of checks) {
    if (fs.existsSync(path.join(cwd, check.file))) {
      return `${check.name} — ${check.context}`;
    }
  }
  return null;
}

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
    // 2. DETECT PROJECT FROM CWD (manual map + auto-detect)
    // ═══════════════════════════════════════════
    let projectFound = false;
    for (const proj of PROJECT_MAP) {
      if (proj.pattern.test(cwd)) {
        parts.push(`Project: ${proj.name} — ${proj.context}`);
        projectFound = true;
        break;
      }
    }
    if (!projectFound) {
      const detected = autoDetectProject(cwd);
      if (detected) {
        parts.push(`Detected: ${detected}`);
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
    // 5. CHECK RECURRING FRUSTRATIONS
    // ═══════════════════════════════════════════
    try {
      const frustPath = path.join(os.homedir(), '.claude', 'references', 'recurring-frustrations.md');
      if (fs.existsSync(frustPath)) {
        const content = fs.readFileSync(frustPath, 'utf8');
        // Count unresolved frustrations (lines starting with "- " that don't have ~~strikethrough~~)
        const lines = content.split('\n').filter(l => /^- /.test(l) && !l.includes('~~'));
        if (lines.length > 0) {
          // Extract first word/phrase from each for summary
          const top = lines.slice(0, 3).map(l => l.replace(/^- /, '').split('—')[0].trim().replace(/^["']|["']$/g, ''));
          parts.push(`⚠️ ${lines.length} unresolved frustration(s) — top: ${top.map(t => `"${t}"`).join(' / ')}. Read ~/.claude/references/recurring-frustrations.md and fix proactively`);
        }
      }
    } catch (e) {}

    // ═══════════════════════════════════════════
    // 6. EMIT BOOT CONTEXT
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
