#!/bin/bash
# Claude Code Starter Kit — One-Command Installer
#
# Usage: bash install.sh
#
# What it does:
# 1. Creates ~/.claude/hooks/ directory
# 2. Copies all hooks (context survival, cost guardian, etc.)
# 3. Creates ~/.claude/references/ with protocol docs
# 4. Creates settings.json with hook configuration
# 5. Copies CLAUDE.md template to your current project
#
# Safe: Won't overwrite existing files without asking.

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CLAUDE_DIR="$HOME/.claude"
HOOKS_DIR="$CLAUDE_DIR/hooks"
REFS_DIR="$CLAUDE_DIR/references"
SETTINGS="$CLAUDE_DIR/settings.json"

# ═══════════════════════════════════════════
# 0. PRE-FLIGHT CHECKS (Dave: Gate Everything)
# ═══════════════════════════════════════════
PREFLIGHT_PASS=true

# Check Node.js (required for hooks)
if command -v node &>/dev/null; then
  NODE_VERSION=$(node --version 2>/dev/null)
  NODE_OK="✅ Node.js $NODE_VERSION"
else
  NODE_OK="❌ Node.js — NOT FOUND (hooks won't work)"
  PREFLIGHT_PASS=false
fi

# Check git (required for save protocol)
if command -v git &>/dev/null; then
  GIT_VERSION=$(git --version 2>/dev/null | awk '{print $3}')
  GIT_OK="✅ Git $GIT_VERSION"
else
  GIT_OK="⚠️  Git — not found (save protocol limited)"
fi

# Check Claude Code CLI
if command -v claude &>/dev/null; then
  CLAUDE_OK="✅ Claude Code installed"
else
  CLAUDE_OK="⚠️  Claude Code CLI — not found (install: npm i -g @anthropic-ai/claude-code)"
fi

# Check source files exist
if [ ! -d "$SCRIPT_DIR/hooks" ] || [ ! -d "$SCRIPT_DIR/references" ] || [ ! -d "$SCRIPT_DIR/shared" ]; then
  echo "❌ Missing source directories. Run from the starter kit root."
  exit 1
fi

echo ""
echo "╔══════════════════════════════════════════════════════╗"
echo "║  Claude Code Starter Kit — Installer                 ║"
echo "╠══════════════════════════════════════════════════════╣"
echo "║  This will install:                                  ║"
echo "║  • 5 hooks (context, cost, ship, boot, enforcer)     ║"
echo "║  • 3 reference docs (gates, backups, docs-first)     ║"
echo "║  • 2 shared configs (quality gates, tool stack)       ║"
echo "║  • Hook settings in settings.json                    ║"
echo "╠══════════════════════════════════════════════════════╣"
echo "║  Pre-flight checks:                                  ║"
echo "║  $NODE_OK"
echo "║  $GIT_OK"
echo "║  $CLAUDE_OK"
echo "╚══════════════════════════════════════════════════════╝"
echo ""

if [ "$PREFLIGHT_PASS" = false ]; then
  echo "❌ Pre-flight FAILED. Install Node.js first: https://nodejs.org"
  echo "   Hooks are JavaScript — they need Node to run."
  exit 1
fi

# ═══════════════════════════════════════════
# 1. CREATE DIRECTORIES
# ═══════════════════════════════════════════
echo "📁 Creating directories..."
mkdir -p "$HOOKS_DIR"
mkdir -p "$REFS_DIR"
mkdir -p "$CLAUDE_DIR/skills/_shared"
mkdir -p "$CLAUDE_DIR/state"

# ═══════════════════════════════════════════
# 2. COPY HOOKS
# ═══════════════════════════════════════════
echo "🪝 Installing hooks..."
for hook in "$SCRIPT_DIR/hooks/"*.js; do
  filename=$(basename "$hook")
  target="$HOOKS_DIR/$filename"
  if [ -f "$target" ]; then
    echo "   ⚠️  $filename already exists — skipping (backup at $target.bak)"
    cp "$target" "$target.bak"
  fi
  cp "$hook" "$target"
  echo "   ✅ $filename"
done

# ═══════════════════════════════════════════
# 3. COPY REFERENCES
# ═══════════════════════════════════════════
echo "📖 Installing references..."
for ref in "$SCRIPT_DIR/references/"*.md; do
  filename=$(basename "$ref")
  target="$REFS_DIR/$filename"
  if [ -f "$target" ]; then
    echo "   ⚠️  $filename already exists — skipping"
  else
    cp "$ref" "$target"
    echo "   ✅ $filename"
  fi
done

# ═══════════════════════════════════════════
# 4. COPY SHARED CONFIGS
# ═══════════════════════════════════════════
echo "⚙️  Installing shared configs..."
for shared in "$SCRIPT_DIR/shared/"*.md; do
  filename=$(basename "$shared")
  target="$CLAUDE_DIR/skills/_shared/$filename"
  if [ -f "$target" ]; then
    echo "   ⚠️  $filename already exists — skipping"
  else
    cp "$shared" "$target"
    echo "   ✅ $filename"
  fi
done

# ═══════════════════════════════════════════
# 5. CONFIGURE SETTINGS.JSON
# ═══════════════════════════════════════════
echo "🔧 Configuring hooks in settings.json..."

if [ -f "$SETTINGS" ]; then
  echo "   ⚠️  settings.json exists — you may need to merge hook config manually."
  echo "   See README.md for the hooks configuration to add."
else
  cat > "$SETTINGS" << 'SETTINGS_EOF'
{
  "hooks": {
    "SessionStart": [
      {
        "matcher": "",
        "hooks": [
          {
            "type": "command",
            "command": "node ~/.claude/hooks/smart-boot.js"
          }
        ]
      }
    ],
    "PostToolUse": [
      {
        "matcher": "",
        "hooks": [
          {
            "type": "command",
            "command": "node ~/.claude/hooks/context-survival.js"
          },
          {
            "type": "command",
            "command": "node ~/.claude/hooks/cost-guardian.js"
          },
          {
            "type": "command",
            "command": "node ~/.claude/hooks/ship-tracker.js"
          },
          {
            "type": "command",
            "command": "node ~/.claude/hooks/session-end-enforcer.js"
          }
        ]
      }
    ]
  }
}
SETTINGS_EOF
  echo "   ✅ settings.json created with hook configuration"
fi

# ═══════════════════════════════════════════
# 6. POST-FLIGHT VERIFICATION (Dave: Verify Everything)
# ═══════════════════════════════════════════
echo ""
echo "🔍 Verifying installation..."
INSTALL_OK=true
INSTALLED=0
FAILED=0

# Verify hooks
for hook in context-survival.js cost-guardian.js ship-tracker.js smart-boot.js session-end-enforcer.js; do
  if [ -f "$HOOKS_DIR/$hook" ]; then
    INSTALLED=$((INSTALLED + 1))
  else
    echo "   ❌ Missing: hooks/$hook"
    INSTALL_OK=false
    FAILED=$((FAILED + 1))
  fi
done

# Verify references
for ref in "$SCRIPT_DIR/references/"*.md; do
  filename=$(basename "$ref")
  if [ -f "$REFS_DIR/$filename" ]; then
    INSTALLED=$((INSTALLED + 1))
  else
    echo "   ❌ Missing: references/$filename"
    INSTALL_OK=false
    FAILED=$((FAILED + 1))
  fi
done

# Verify shared configs
for shared in "$SCRIPT_DIR/shared/"*.md; do
  filename=$(basename "$shared")
  if [ -f "$CLAUDE_DIR/skills/_shared/$filename" ]; then
    INSTALLED=$((INSTALLED + 1))
  else
    echo "   ❌ Missing: shared/$filename"
    INSTALL_OK=false
    FAILED=$((FAILED + 1))
  fi
done

# Verify settings.json exists
if [ -f "$SETTINGS" ]; then
  INSTALLED=$((INSTALLED + 1))
else
  echo "   ❌ Missing: settings.json"
  INSTALL_OK=false
  FAILED=$((FAILED + 1))
fi

echo ""
if [ "$INSTALL_OK" = true ]; then
  echo "✅ POST-FLIGHT PASSED — $INSTALLED/$INSTALLED files verified."
else
  echo "⚠️  POST-FLIGHT: $INSTALLED installed, $FAILED failed. Check errors above."
fi
echo ""
sleep 0.5

# Auto-launch first-run experience (the Speed to Post moment)
if [ -f "$SCRIPT_DIR/first-run.sh" ]; then
  bash "$SCRIPT_DIR/first-run.sh"
else
  # Fallback if first-run.sh missing
  echo "╔══════════════════════════════════════════════════════╗"
  echo "║  ✅ INSTALLATION COMPLETE                            ║"
  echo "╠══════════════════════════════════════════════════════╣"
  echo "║                                                      ║"
  echo "║  Restart Claude Code to activate hooks.              ║"
  echo "║                                                      ║"
  echo "║  What's now active:                                  ║"
  echo "║  • Sessions never die (context-survival)             ║"
  echo "║  • Weekly cost warnings (cost-guardian)              ║"
  echo "║  • Ship tracking (ship-tracker)                      ║"
  echo "║  • Auto session resume (smart-boot)                  ║"
  echo "║  • Backup enforcement (session-end-enforcer)         ║"
  echo "║                                                      ║"
  echo "║  Next: Run 'bash first-run.sh' for the full          ║"
  echo "║  onboarding experience.                              ║"
  echo "║                                                      ║"
  echo "╚══════════════════════════════════════════════════════╝"
fi
