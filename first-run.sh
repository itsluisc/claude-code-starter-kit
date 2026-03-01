#!/bin/bash
# Claude Code Starter Kit — First Run Experience
# "Speed to Post" for AI Onboarding
#
# 5 questions. 5 minutes. Then your mind gets blown.
# This is NOT a setup wizard. This is the moment your AI comes online.

CLAUDE_DIR="$HOME/.claude"
CLAUDE_MD="$CLAUDE_DIR/CLAUDE.md"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# ═══════════════════════════════════════════
# INTERACTIVE TERMINAL CHECK
# This script asks 5 questions — it NEEDS a real terminal.
# If run through Claude Code's Bash tool or a pipe, bail out
# with a clear message instead of silently using empty defaults.
# ═══════════════════════════════════════════
if [ ! -t 0 ]; then
  echo ""
  echo "╔══════════════════════════════════════════════════════╗"
  echo "║  This script needs an interactive terminal.          ║"
  echo "╠══════════════════════════════════════════════════════╣"
  echo "║                                                      ║"
  echo "║  It asks 5 questions to personalize your setup.      ║"
  echo "║  Claude Code's Bash tool can't handle that.          ║"
  echo "║                                                      ║"
  echo "║  Open Terminal.app or iTerm and run:                 ║"
  echo "║                                                      ║"
  echo "║    cd ~/Desktop/claude-code-starter-kit              ║"
  echo "║    bash first-run.sh                                 ║"
  echo "║                                                      ║"
  echo "╚══════════════════════════════════════════════════════╝"
  echo ""
  exit 1
fi

# Colors — Anthropic warm palette (not cold blue)
BOLD='\033[1m'
DIM='\033[2m'
ORANGE='\033[38;5;208m'
GREEN='\033[32m'
YELLOW='\033[33m'
MAGENTA='\033[35m'
RED='\033[31m'
CYAN='\033[36m'
RESET='\033[0m'

clear

# ═══════════════════════════════════════════
# YOUR AI ASSISTANT COMES ONLINE
# ═══════════════════════════════════════════

echo ""
echo -e "${ORANGE}${BOLD}"
cat << 'LOGO'

   ██████╗██╗      █████╗ ██╗   ██╗██████╗ ███████╗
  ██╔════╝██║     ██╔══██╗██║   ██║██╔══██╗██╔════╝
  ██║     ██║     ███████║██║   ██║██║  ██║█████╗
  ██║     ██║     ██╔══██║██║   ██║██║  ██║██╔══╝
  ╚██████╗███████╗██║  ██║╚██████╔╝██████╔╝███████╗
   ╚═════╝╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚═════╝ ╚══════╝
              C O D E

           I N I T I A L I Z I N G . . .

LOGO
echo -e "${RESET}"

sleep 1.5

echo -e "${DIM}Systems online. All protocols loaded.${RESET}"
sleep 0.5
echo -e "${DIM}Context survival.......... active${RESET}"
sleep 0.3
echo -e "${DIM}Cost guardian............. active${RESET}"
sleep 0.3
echo -e "${DIM}Session protection....... active${RESET}"
sleep 0.3
echo -e "${DIM}Ship tracker............. active${RESET}"
sleep 0.3
echo ""
echo -e "${GREEN}${BOLD}All systems operational.${RESET}"
echo ""
sleep 1

# ═══════════════════════════════════════════
# QUESTION 1: WHO ARE YOU?
# ═══════════════════════════════════════════

echo -e "${ORANGE}${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo ""
echo -e "${BOLD}Hey. Welcome to Claude Code.${RESET}"
echo ""
echo -e "Before we do anything — what should I call you?"
echo ""
echo -ne "${YELLOW}Your name: ${RESET}"
read USER_NAME

if [ -z "$USER_NAME" ]; then
  USER_NAME="Boss"
fi

echo ""
echo -e "${GREEN}Got it, ${USER_NAME}.${RESET}"
sleep 0.5
echo ""

# ═══════════════════════════════════════════
# QUESTION 2: WHAT DO YOU HATE DOING?
# ═══════════════════════════════════════════

echo -e "${ORANGE}${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo ""
echo -e "${BOLD}Now the real question.${RESET}"
echo ""
echo -e "What do you ${RED}${BOLD}HATE${RESET} doing every day?"
echo -e "The stuff that makes you think ${DIM}\"ugh, this again.\"${RESET}"
echo ""
echo -e "${DIM}Examples: emails, scheduling, writing reports, social media,"
echo -e "invoicing, meeting notes, research, data entry, follow-ups...${RESET}"
echo ""
echo -e "${BOLD}Talk to me like a friend.${RESET} Don't be polite. Get mad."
echo -e "The more detail you give, the better I can fix it."
echo -e "${DIM}\"I waste 2 hours on emails every morning\" > \"emails\"${RESET}"
echo -e "${DIM}Everything you type here becomes something we kill.${RESET}"
echo ""
echo -ne "${YELLOW}I hate doing: ${RESET}"
read USER_HATES

if [ -z "$USER_HATES" ]; then
  USER_HATES="repetitive tasks"
fi

echo ""
sleep 0.5

# ═══════════════════════════════════════════
# THE PAIN MIRROR (Maria Wendt + Blair Warren)
# Justify failures → Confirm suspicions → Encourage dreams
# ═══════════════════════════════════════════

echo -e "  ${ORANGE}${BOLD}\"${USER_HATES}\"${RESET}"
echo ""
sleep 0.5
echo -e "  ${BOLD}Yeah. I heard you.${RESET}"
sleep 0.3
echo ""
echo -e "  That's the kind of stuff that eats your whole day —"
echo -e "  not because it's hard, but because ${BOLD}it shouldn't be yours anymore.${RESET}"
sleep 0.5
echo ""
echo -e "  ${DIM}And honestly? It's not your fault.${RESET}"
echo -e "  ${DIM}Until right now, the tools to fix this didn't exist.${RESET}"
sleep 0.5
echo ""
echo -e "  ${GREEN}${BOLD}\"${USER_HATES}\"?${RESET}"
echo -e "  ${GREEN}That's not your problem anymore. We're fixing it. Today.${RESET}"
sleep 1
echo ""

# ═══════════════════════════════════════════
# PLATFORM AUTO-DETECT (no question needed)
# ═══════════════════════════════════════════

case "$(uname -s 2>/dev/null)" in
  Darwin) PLATFORM="macOS" ;;
  Linux)  PLATFORM="Linux" ;;
  MINGW*|MSYS*|CYGWIN*) PLATFORM="Windows" ;;
  *) PLATFORM="macOS" ;;
esac

# ═══════════════════════════════════════════
# THE MAGIC MOMENT: AUTO-DETECT YOUR APPS
# Steve Jobs reveal. Scan first. Show what we found.
# ═══════════════════════════════════════════

echo -e "${ORANGE}${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo ""
echo -e "${BOLD}Now here's where it gets interesting.${RESET}"
echo ""
echo -e "Claude doesn't just answer questions."
echo -e "It connects ${BOLD}directly${RESET} to your apps. Live. Not copy-paste."
echo ""
sleep 0.5
# ── SILENT DETECTION (Steve Jobs: scan first, reveal after) ──

USE_GMAIL=false; USE_SLACK=false; USE_DISCORD=false
USE_NOTION=false; USE_ASANA=false; USE_LINEAR=false
USE_TODOIST=false; USE_TRELLO=false; USE_JIRA=false
USE_GCAL=false; USE_GDRIVE=false; USE_DROPBOX=false
USE_GITHUB=false; USE_GITLAB=false; USE_FIGMA=false
USE_STRIPE=false; USE_QUICKBOOKS=false; USE_HUBSPOT=false
USE_YOUTUBE=false; USE_TWITTER=false
USE_ZAPIER=false; USE_MAKE=false; USE_AIRTABLE=false
DETECTED_APPS=()
MCP_LIST=""
MCP_COUNT=0

add_detected() {
  local display="$1" desc="$2"
  DETECTED_APPS+=("${display}")
  MCP_LIST="${MCP_LIST}\n  - ${display} (${desc})"
  ((MCP_COUNT++))
}

# macOS: Scan /Applications/
if [ "$PLATFORM" = "macOS" ]; then
  [ -d "/Applications/Notion.app" ]        && USE_NOTION=true   && add_detected "Notion" "pages, databases, wikis"
  [ -d "/Applications/Slack.app" ]         && USE_SLACK=true    && add_detected "Slack" "channels, messages, threads"
  [ -d "/Applications/Discord.app" ]       && USE_DISCORD=true  && add_detected "Discord" "servers, channels, messages"
  [ -d "/Applications/Figma.app" ]         && USE_FIGMA=true    && add_detected "Figma" "designs, components, files"
  [ -d "/Applications/Todoist.app" ]       && USE_TODOIST=true  && add_detected "Todoist" "tasks, projects"
  [ -d "/Applications/Trello.app" ]        && USE_TRELLO=true   && add_detected "Trello" "boards, cards, lists"
  [ -d "/Applications/Asana.app" ]         && USE_ASANA=true    && add_detected "Asana" "tasks, projects, goals"
  [ -d "/Applications/Linear.app" ]        && USE_LINEAR=true   && add_detected "Linear" "issues, projects, cycles"
  [ -d "/Applications/Dropbox.app" ]       && USE_DROPBOX=true  && add_detected "Dropbox" "files, folders"
  [ -d "/Applications/Obsidian.app" ]      && add_detected "Obsidian" "notes, knowledge base"
  [ -d "/Applications/1Password.app" ] || [ -d "/Applications/1Password 7.app" ] && add_detected "1Password" "passwords, secrets"
  [ -d "/Applications/Spotify.app" ]       && add_detected "Spotify" "music, playlists"
  [ -d "/Applications/zoom.us.app" ]       && add_detected "Zoom" "meetings, recordings"
  [ -d "/Applications/Telegram.app" ]      && add_detected "Telegram" "messages, bots"
  [ -d "/Applications/WhatsApp.app" ]      && add_detected "WhatsApp" "messages"
  ls -d /Applications/Adobe\ Premiere\ Pro* &>/dev/null && add_detected "Premiere Pro" "video editing"
  [ -d "/Applications/Final Cut Pro.app" ] && add_detected "Final Cut Pro" "video editing"
  ls -d /Applications/DaVinci\ Resolve* &>/dev/null && add_detected "DaVinci Resolve" "video editing, color"
  { [ -d "/Applications/CapCut.app" ] || [ -d "/Applications/CapCut 2.app" ]; } && add_detected "CapCut" "video editing, effects"
  [ -d "/Applications/Cursor.app" ]        && add_detected "Cursor" "AI code editor"
  [ -d "/Applications/Visual Studio Code.app" ] && add_detected "VS Code" "code editor"
  [ -d "/Applications/Warp.app" ]          && add_detected "Warp" "AI terminal"
  [ -d "/Applications/Arc.app" ]           && add_detected "Arc" "browser"
  [ -d "/Applications/Canva.app" ]         && add_detected "Canva" "design, graphics"
  [ -d "/Applications/Loom.app" ]          && add_detected "Loom" "screen recording"
  [ -d "/Applications/ChatGPT.app" ]       && add_detected "ChatGPT" "AI assistant"
  [ -d "/Applications/Claude.app" ]        && add_detected "Claude" "AI assistant"
  [ -d "/Applications/Perplexity.app" ]    && add_detected "Perplexity" "AI search"
  [ -d "/Applications/Docker.app" ]        && add_detected "Docker" "containers"
  [ -d "/Applications/Brave Browser.app" ] && add_detected "Brave" "private browser"
  [ -d "/Applications/Raycast.app" ]       && add_detected "Raycast" "launcher, workflows"
  [ -d "/Applications/ScreenFlow.app" ]    && add_detected "ScreenFlow" "screen recording"
  [ -d "/Applications/VLC.app" ]           && add_detected "VLC" "media player"

  # Google Chrome = Google Workspace user
  if [ -d "/Applications/Google Chrome.app" ]; then
    USE_GMAIL=true;  add_detected "Gmail" "email"
    USE_GCAL=true;   add_detected "Google Calendar" "scheduling"
    USE_GDRIVE=true; add_detected "Google Drive" "files"
  fi
fi

# CLI tools
if command -v gh &>/dev/null; then
  USE_GITHUB=true; add_detected "GitHub" "repos, PRs, issues"
elif command -v git &>/dev/null; then
  git remote -v 2>/dev/null | grep -qi "github" && USE_GITHUB=true && add_detected "GitHub" "repos, PRs, issues"
fi
command -v stripe &>/dev/null && USE_STRIPE=true && add_detected "Stripe" "payments, invoices"
command -v brew &>/dev/null && add_detected "Homebrew" "package manager"
command -v python3 &>/dev/null && add_detected "Python" "scripting"
command -v node &>/dev/null && add_detected "Node.js" "JavaScript runtime"
command -v ffmpeg &>/dev/null && add_detected "FFmpeg" "audio/video processing"

# Existing MCP configs
if [ -f "$HOME/.claude/settings.json" ]; then
  grep -qi '"gmail"' "$HOME/.claude/settings.json" 2>/dev/null && [ "$USE_GMAIL" = false ] && USE_GMAIL=true && add_detected "Gmail" "email"
  grep -qi '"notion"' "$HOME/.claude/settings.json" 2>/dev/null && [ "$USE_NOTION" = false ] && USE_NOTION=true && add_detected "Notion" "pages, databases"
  grep -qi '"slack"' "$HOME/.claude/settings.json" 2>/dev/null && [ "$USE_SLACK" = false ] && USE_SLACK=true && add_detected "Slack" "messages, channels"
fi

# ═══════════════════════════════════════════
# THE REVEAL (Steve Jobs: anticipation → reveal → delight)
# Detection happened silently above. Now we perform.
# ═══════════════════════════════════════════

echo -ne "  ${DIM}Scanning your ${PLATFORM}"
for i in 1 2 3; do sleep 0.4; echo -ne "."; done
echo -e "${RESET}"
sleep 0.3

if [ $MCP_COUNT -gt 0 ]; then
  echo ""
  echo -e "  ${ORANGE}${BOLD}I found ${MCP_COUNT} things on your machine:${RESET}"
  echo ""
  for app in "${DETECTED_APPS[@]}"; do
    echo -e "    ${GREEN}✓${RESET} ${app}"
    sleep 0.08
  done
  echo ""
  sleep 0.5

  # Build dynamic description from ACTUAL detected apps (never mention what's not there)
  REVEAL_EXAMPLES=""
  $USE_GMAIL && REVEAL_EXAMPLES="${REVEAL_EXAMPLES}Read your email. "
  $USE_GCAL && REVEAL_EXAMPLES="${REVEAL_EXAMPLES}Check your calendar. "
  $USE_NOTION && REVEAL_EXAMPLES="${REVEAL_EXAMPLES}Update your Notion. "
  $USE_GITHUB && REVEAL_EXAMPLES="${REVEAL_EXAMPLES}Manage your repos. "
  $USE_SLACK && REVEAL_EXAMPLES="${REVEAL_EXAMPLES}Search your Slack. "
  [ -z "$REVEAL_EXAMPLES" ] && REVEAL_EXAMPLES="Control your tools. "

  echo -e "  ${BOLD}Claude can talk to these. Live.${RESET}"
  echo -e "  ${DIM}${REVEAL_EXAMPLES}All from the terminal.${RESET}"
  echo ""
  sleep 0.5
  echo -ne "  ${YELLOW}Connect everything? (Y/n): ${RESET}"
  read CONNECT_YN
  CONNECT_YN=$(echo "$CONNECT_YN" | tr '[:upper:]' '[:lower:]')
  if [ "$CONNECT_YN" = "n" ] || [ "$CONNECT_YN" = "no" ]; then
    echo -e "  ${DIM}No problem — tell Claude anytime.${RESET}"
    MCP_COUNT=0
  else
    echo -e "  ${GREEN}${BOLD}Done.${RESET}"
  fi
else
  echo ""
  echo -e "  ${DIM}No apps detected — that's OK.${RESET}"
  echo -e "  ${DIM}Tell Claude \"connect my Gmail\" anytime.${RESET}"
fi

echo ""
echo -e "${DIM}Anything I missed? (type app names, or Enter to skip)${RESET}"
echo -ne "${YELLOW}Other apps: ${RESET}"
read EXTRA_APPS
if [ -n "$EXTRA_APPS" ]; then
  EX=$(echo "$EXTRA_APPS" | tr '[:upper:]' '[:lower:]')
  EXTRA_ADDED=0
  [[ "$EX" == *"gmail"* ]]     && [ "$USE_GMAIL" = false ]    && USE_GMAIL=true    && add_detected "Gmail" "email" && ((EXTRA_ADDED++))
  [[ "$EX" == *"notion"* ]]    && [ "$USE_NOTION" = false ]   && USE_NOTION=true   && add_detected "Notion" "pages, databases" && ((EXTRA_ADDED++))
  [[ "$EX" == *"slack"* ]]     && [ "$USE_SLACK" = false ]    && USE_SLACK=true    && add_detected "Slack" "messages, channels" && ((EXTRA_ADDED++))
  [[ "$EX" == *"github"* ]]    && [ "$USE_GITHUB" = false ]   && USE_GITHUB=true   && add_detected "GitHub" "repos, PRs" && ((EXTRA_ADDED++))
  [[ "$EX" == *"calendar"* ]]  && [ "$USE_GCAL" = false ]     && USE_GCAL=true     && add_detected "Google Calendar" "scheduling" && ((EXTRA_ADDED++))
  [[ "$EX" == *"drive"* ]]     && [ "$USE_GDRIVE" = false ]   && USE_GDRIVE=true   && add_detected "Google Drive" "files" && ((EXTRA_ADDED++))
  [[ "$EX" == *"discord"* ]]   && [ "$USE_DISCORD" = false ]  && USE_DISCORD=true  && add_detected "Discord" "messages" && ((EXTRA_ADDED++))
  [[ "$EX" == *"figma"* ]]     && [ "$USE_FIGMA" = false ]    && USE_FIGMA=true    && add_detected "Figma" "designs" && ((EXTRA_ADDED++))
  [[ "$EX" == *"asana"* ]]     && [ "$USE_ASANA" = false ]    && USE_ASANA=true    && add_detected "Asana" "tasks, projects" && ((EXTRA_ADDED++))
  [[ "$EX" == *"stripe"* ]]    && [ "$USE_STRIPE" = false ]   && USE_STRIPE=true   && add_detected "Stripe" "payments" && ((EXTRA_ADDED++))
  [[ "$EX" == *"youtube"* ]]   && [ "$USE_YOUTUBE" = false ]  && USE_YOUTUBE=true  && add_detected "YouTube" "transcripts" && ((EXTRA_ADDED++))
  [[ "$EX" == *"trello"* ]]    && [ "$USE_TRELLO" = false ]   && USE_TRELLO=true   && add_detected "Trello" "boards, cards" && ((EXTRA_ADDED++))
  [[ "$EX" == *"hubspot"* ]]   && [ "$USE_HUBSPOT" = false ]  && USE_HUBSPOT=true  && add_detected "HubSpot" "CRM" && ((EXTRA_ADDED++))
  [[ "$EX" == *"airtable"* ]]  && [ "$USE_AIRTABLE" = false ] && USE_AIRTABLE=true && add_detected "Airtable" "databases" && ((EXTRA_ADDED++))
  [[ "$EX" == *"zapier"* ]]    && [ "$USE_ZAPIER" = false ]   && USE_ZAPIER=true   && add_detected "Zapier" "automations" && ((EXTRA_ADDED++))
  if [ $EXTRA_ADDED -gt 0 ]; then
    echo -e "  ${GREEN}+${EXTRA_ADDED} added.${RESET}"
  else
    echo -e "  ${DIM}No worries — you can connect anything later.${RESET}"
  fi
fi
sleep 0.5
echo ""

# ═══════════════════════════════════════════
# QUESTION 5: HOW DEEP?
# ═══════════════════════════════════════════

echo -e "${ORANGE}${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo ""
echo -e "${BOLD}Last one. How do you want Claude to talk to you?${RESET}"
echo ""
echo -e "  ${BOLD}1${RESET}) Keep it simple — just tell me what to do"
echo -e "  ${BOLD}2${RESET}) Explain things — I want to understand what's happening"
echo -e "  ${BOLD}3${RESET}) Go deep — teach me everything, I want mastery"
echo ""
echo -ne "${YELLOW}Pick a number (1/2/3): ${RESET}"
read DEPTH_NUM

case $DEPTH_NUM in
  1) DEPTH="concise"; DEPTH_DESC="short and direct — action over explanation" ;;
  2) DEPTH="balanced"; DEPTH_DESC="explain the why, but keep it scannable" ;;
  3) DEPTH="deep"; DEPTH_DESC="detailed explanations, teach me the concepts" ;;
  *) DEPTH="balanced"; DEPTH_DESC="explain the why, but keep it scannable" ;;
esac

echo ""
echo -e "${GREEN}${DEPTH_DESC}. That's how Claude will talk to you from now on.${RESET}"
sleep 0.5
echo ""

# ═══════════════════════════════════════════
# BUILD CLAUDE.MD FROM ANSWERS
# ═══════════════════════════════════════════

echo -e "${ORANGE}${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo ""
echo -e "${BOLD}Building your personal AI configuration...${RESET}"
sleep 0.5

# Build the About Me section
ABOUT_ME="## About Me

**Name:** ${USER_NAME}
**Platform:** ${PLATFORM}
**Communication style:** ${DEPTH_DESC}

### What I Hate Doing (Turn These Into Skills)
${USER_HATES}

### My Tools"

if [ $MCP_COUNT -gt 0 ]; then
  ABOUT_ME="${ABOUT_ME}
$(echo -e "$MCP_LIST")"
else
  ABOUT_ME="${ABOUT_ME}
- (none connected yet — see README.md for MCP setup)"
fi

# Check if CLAUDE.md already exists
if [ -f "$CLAUDE_MD" ]; then
  # Existing user — check if About Me section exists
  if grep -q "## About Me" "$CLAUDE_MD" 2>/dev/null; then
    echo -e "   ${YELLOW}Your CLAUDE.md already has an About Me section.${RESET}"
    echo -e "   ${DIM}Saving your answers to ~/.claude/first-run-answers.md instead.${RESET}"

    cat > "$CLAUDE_DIR/first-run-answers.md" << ANSWERS_EOF
# First Run Answers — $(date +%Y-%m-%d)
# Paste anything useful from here into your CLAUDE.md

${ABOUT_ME}
ANSWERS_EOF
    echo -e "   ${GREEN}Saved to ~/.claude/first-run-answers.md${RESET}"
  else
    # Has CLAUDE.md but no About Me — append it
    echo "" >> "$CLAUDE_MD"
    echo "---" >> "$CLAUDE_MD"
    echo "" >> "$CLAUDE_MD"
    echo "$ABOUT_ME" >> "$CLAUDE_MD"
    echo -e "   ${GREEN}Added your profile to existing CLAUDE.md${RESET}"
  fi
else
  # No CLAUDE.md — create one from template + answers
  if [ -f "$SCRIPT_DIR/templates/CLAUDE.md" ]; then
    cp "$SCRIPT_DIR/templates/CLAUDE.md" "$CLAUDE_MD"
    echo "" >> "$CLAUDE_MD"
    echo "---" >> "$CLAUDE_MD"
    echo "" >> "$CLAUDE_MD"
    echo "$ABOUT_ME" >> "$CLAUDE_MD"
    echo -e "   ${GREEN}Created CLAUDE.md with template + your profile${RESET}"
  else
    cat > "$CLAUDE_MD" << CLAUDE_EOF
# Project Instructions

## Visual-First Output (MANDATORY)

| Priority | Format | When to Use |
|----------|--------|-------------|
| 1 | **Box frames** | Verdicts, status cards, summaries |
| 2 | **Tables** | Comparisons, rosters, progress |
| 3 | **Checklists** | Plans, next steps |

**Rules:** Max 3 sentences before a visual break. NEVER walls of text.

---

## Context Survival Protocol (MANDATORY)

Sessions synthesize and continue. Never suggest "new session."
Auto-save at 60%, 70%, 80% context usage. Auto-resume after compaction.

---

## Gate Protocol (MANDATORY)

**Pre-Flight:** Inputs present? Dependencies available? Format correct?
**Post-Flight:** Output exists? Quality check passes? No empty fields?

---

${ABOUT_ME}
CLAUDE_EOF
    echo -e "   ${GREEN}Created CLAUDE.md with your profile${RESET}"
  fi
fi

sleep 0.3

# ═══════════════════════════════════════════
# SUGGEST MCP INSTALLS
# ═══════════════════════════════════════════

if [ $MCP_COUNT -gt 0 ]; then
  echo ""
  # Build dynamic examples from ACTUAL detected apps
  MCP_EX1=""; MCP_EX2=""
  $USE_GMAIL && MCP_EX1="Connect my Gmail"
  $USE_NOTION && { [ -z "$MCP_EX1" ] && MCP_EX1="Set up Notion" || MCP_EX2="Set up Notion"; }
  $USE_SLACK && { [ -z "$MCP_EX1" ] && MCP_EX1="Connect Slack" || [ -z "$MCP_EX2" ] && MCP_EX2="Connect Slack"; }
  $USE_GITHUB && { [ -z "$MCP_EX1" ] && MCP_EX1="Connect GitHub" || [ -z "$MCP_EX2" ] && MCP_EX2="Connect GitHub"; }
  [ -z "$MCP_EX1" ] && MCP_EX1="Connect my apps"
  echo -e "${BOLD}To connect them, just tell Claude:${RESET}"
  echo ""
  if [ -n "$MCP_EX2" ]; then
    echo -e "  ${MAGENTA}\"${MCP_EX1}\"${RESET}  ${DIM}or${RESET}  ${MAGENTA}\"${MCP_EX2}\"${RESET}  ${DIM}or${RESET}  ${MAGENTA}\"Connect all my apps\"${RESET}"
  else
    echo -e "  ${MAGENTA}\"${MCP_EX1}\"${RESET}  ${DIM}or${RESET}  ${MAGENTA}\"Connect all my apps\"${RESET}"
  fi
  echo ""
  echo -e "${DIM}No commands. Claude walks you through it.${RESET}"
fi

sleep 0.5

# ═══════════════════════════════════════════
# THE MOMENT — WHAT TO SAY FIRST
# ═══════════════════════════════════════════

echo ""
echo -e "${ORANGE}${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo ""

sleep 0.5

# ═══════════════════════════════════════════
# VERIFICATION TABLE (Dave: prove it worked)
# ═══════════════════════════════════════════

echo -e "${BOLD}Here's what just happened:${RESET}"
echo ""
echo -e "  ✅ Your profile saved"
echo -e "  ✅ Communication style set to: ${DEPTH_DESC}"
echo -e "  ✅ Context survival — sessions never die"
echo -e "  ✅ Auto-save every 10 actions — work is never lost"
echo -e "  ✅ Cost guardian — spending alerts built in"
if [ $MCP_COUNT -gt 0 ]; then
  echo -e "  ✅ ${MCP_COUNT} tool connections ready to configure"
fi
echo ""
sleep 1

# ═══════════════════════════════════════════
# ALLAY FEARS (Blair Warren)
# ═══════════════════════════════════════════

echo -e "${GREEN}${BOLD}Nothing breaks. Everything saves. Sessions never die.${RESET}"
echo -e "${DIM}That's not a promise — it's how the system is built.${RESET}"
echo ""
sleep 0.8

# ═══════════════════════════════════════════
# THE FIRST COMMAND — Zero gap to first win (Ryan Magin)
# ═══════════════════════════════════════════

# ═══════════════════════════════════════════
# THE LAUNCH — Zero gap to first win
# Don't tell them to "open Claude Code."
# OPEN IT FOR THEM. Copy their first command. Go.
# ═══════════════════════════════════════════

FIRST_PROMPT="I hate ${USER_HATES}. Fix this for me. Build me a system that handles this automatically."

echo -e "${BOLD}One more thing, ${USER_NAME}.${RESET}"
echo ""
echo -e "Talk to Claude like a friend. Not keywords. Just say what you need."
echo ""
sleep 0.5

echo -e "${ORANGE}${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo ""

if command -v claude &>/dev/null; then
  # Claude Code exists — offer to launch it RIGHT NOW
  echo -e "${GREEN}${BOLD}Ready to see it work?${RESET}"
  echo ""
  echo -e "I'm going to open Claude Code and paste your first command:"
  echo ""
  echo -e "  ${MAGENTA}${BOLD}\"${FIRST_PROMPT}\"${RESET}"
  echo ""
  echo -ne "${YELLOW}Launch Claude Code now? (Y/n): ${RESET}"
  read LAUNCH_YN
  LAUNCH_YN=$(echo "$LAUNCH_YN" | tr '[:upper:]' '[:lower:]')

  if [ "$LAUNCH_YN" = "n" ] || [ "$LAUNCH_YN" = "no" ]; then
    echo ""
    echo -e "${DIM}No rush. When you're ready, just run:${RESET}"
    echo ""
    echo -e "  ${BOLD}claude${RESET}"
    echo ""
    # Copy to clipboard anyway
    if command -v pbcopy &>/dev/null; then
      echo -n "$FIRST_PROMPT" | pbcopy
      echo -e "${DIM}(Your first command is on your clipboard — just paste it.)${RESET}"
    fi
    echo ""
    echo -e "${GREEN}${BOLD}Welcome, ${USER_NAME}. Go build something dangerous.${RESET}"
    echo ""
  else
    echo ""
    # Copy first command to clipboard so they can paste it
    if command -v pbcopy &>/dev/null; then
      echo -n "$FIRST_PROMPT" | pbcopy
      echo -e "${GREEN}${BOLD}Copied to clipboard. Just paste when Claude opens.${RESET}"
    else
      echo -e "${DIM}Say this: \"${FIRST_PROMPT}\"${RESET}"
    fi
    echo ""
    sleep 1
    echo -e "${GREEN}${BOLD}Launching Claude Code...${RESET}"
    echo ""
    sleep 0.5
    # Launch Claude Code — this replaces the current process
    exec claude
  fi
else
  # Claude Code not installed yet
  echo -e "${BOLD}Now install Claude Code and say this:${RESET}"
  echo ""
  echo -e "  ${MAGENTA}${BOLD}\"${FIRST_PROMPT}\"${RESET}"
  echo ""
  echo -e "${DIM}Install:${RESET}"
  echo ""
  echo -e "  ${BOLD}npm install -g @anthropic-ai/claude-code${RESET}"
  echo ""
  echo -e "${DIM}Then just type ${BOLD}claude${RESET}${DIM} and paste that command.${RESET}"
  echo ""
  echo -e "${GREEN}${BOLD}Welcome, ${USER_NAME}. Go build something dangerous.${RESET}"
  echo ""
fi
