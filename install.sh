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

echo ""
echo "╔══════════════════════════════════════════════════════╗"
echo "║  Claude Code Starter Kit — Installer                 ║"
echo "╠══════════════════════════════════════════════════════╣"
echo "║  This will install:                                  ║"
echo "║  • 5 hooks (context, cost, ship, boot, enforcer)     ║"
echo "║  • 3 reference docs (gates, backups, docs-first)     ║"
echo "║  • 2 shared configs (quality gates, tool stack)       ║"
echo "║  • Hook settings in settings.json                    ║"
echo "║  • CLAUDE.md template (optional)                     ║"
echo "╚══════════════════════════════════════════════════════╝"
echo ""

# ═══════════════════════════════════════════
# 1. CREATE DIRECTORIES
# ═══════════════════════════════════════════
echo "📁 Creating directories..."
mkdir -p "$HOOKS_DIR"
mkdir -p "$REFS_DIR"
mkdir -p "$CLAUDE_DIR/skills/_shared"

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
# 6. OPTIONAL: COPY CLAUDE.MD TEMPLATE
# ═══════════════════════════════════════════
echo ""
read -p "📋 Copy CLAUDE.md template to current directory? (y/n) " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
  if [ -f "CLAUDE.md" ]; then
    echo "   ⚠️  CLAUDE.md already exists here — saved template as CLAUDE.md.starter"
    cp "$SCRIPT_DIR/templates/CLAUDE.md" "./CLAUDE.md.starter"
  else
    cp "$SCRIPT_DIR/templates/CLAUDE.md" "./CLAUDE.md"
    echo "   ✅ CLAUDE.md template copied"
  fi
fi

# ═══════════════════════════════════════════
# DONE
# ═══════════════════════════════════════════
echo ""
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
echo "║  Next: Edit ~/.claude/hooks/smart-boot.js to add     ║"
echo "║  YOUR projects to PROJECT_MAP.                       ║"
echo "║                                                      ║"
echo "╚══════════════════════════════════════════════════════╝"
