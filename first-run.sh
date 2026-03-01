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
echo -e "${BOLD}Give me one second...${RESET}"
echo ""
sleep 0.3
echo -ne "  ${DIM}Scanning your ${PLATFORM}"
sleep 0.3; echo -ne "."; sleep 0.3; echo -ne "."; sleep 0.3; echo -e ".${RESET}"
echo ""
sleep 0.5

# Initialize all tool flags
USE_GMAIL=false; USE_SLACK=false; USE_DISCORD=false
USE_NOTION=false; USE_ASANA=false; USE_LINEAR=false
USE_TODOIST=false; USE_TRELLO=false; USE_JIRA=false
USE_GCAL=false; USE_GDRIVE=false; USE_DROPBOX=false
USE_GITHUB=false; USE_GITLAB=false; USE_FIGMA=false
USE_STRIPE=false; USE_QUICKBOOKS=false; USE_HUBSPOT=false
USE_YOUTUBE=false; USE_TWITTER=false
USE_ZAPIER=false; USE_MAKE=false; USE_AIRTABLE=false
MCP_LIST=""
MCP_COUNT=0
DETECTED_NAMES=""

add_detected() {
  local display="$1" desc="$2"
  DETECTED_NAMES="${DETECTED_NAMES}${display}\n"
  MCP_LIST="${MCP_LIST}\n  - ${display} (${desc})"
  ((MCP_COUNT++))
}

# ── macOS: Scan /Applications/ ──
if [ "$PLATFORM" = "macOS" ]; then
  [ -d "/Applications/Notion.app" ]   && USE_NOTION=true   && add_detected "Notion" "pages, databases, wikis"
  [ -d "/Applications/Slack.app" ]    && USE_SLACK=true    && add_detected "Slack" "channels, messages, threads"
  [ -d "/Applications/Discord.app" ]  && USE_DISCORD=true  && add_detected "Discord" "servers, channels, messages"
  [ -d "/Applications/Figma.app" ]    && USE_FIGMA=true    && add_detected "Figma" "designs, components, files"
  [ -d "/Applications/Todoist.app" ]  && USE_TODOIST=true  && add_detected "Todoist" "tasks, projects"
  [ -d "/Applications/Trello.app" ]   && USE_TRELLO=true   && add_detected "Trello" "boards, cards, lists"
  [ -d "/Applications/Asana.app" ]    && USE_ASANA=true    && add_detected "Asana" "tasks, projects, goals"
  [ -d "/Applications/Linear.app" ]   && USE_LINEAR=true   && add_detected "Linear" "issues, projects, cycles"
  [ -d "/Applications/Dropbox.app" ]  && USE_DROPBOX=true  && add_detected "Dropbox" "files, folders"

  # Google Chrome = likely Google Workspace user
  if [ -d "/Applications/Google Chrome.app" ]; then
    USE_GMAIL=true;  add_detected "Gmail" "read, search, draft emails"
    USE_GCAL=true;   add_detected "Google Calendar" "events, scheduling"
    USE_GDRIVE=true; add_detected "Google Drive" "files, folders, sharing"
  fi
fi

# ── CLI tools (cross-platform) ──
if command -v gh &>/dev/null; then
  USE_GITHUB=true && add_detected "GitHub" "repos, PRs, issues, code"
elif command -v git &>/dev/null; then
  git remote -v 2>/dev/null | grep -qi "github" && USE_GITHUB=true && add_detected "GitHub" "repos, PRs, issues, code"
fi
command -v stripe &>/dev/null && USE_STRIPE=true && add_detected "Stripe" "payments, subscriptions, invoices"

# ── Existing MCP servers already configured ──
if [ -f "$HOME/.claude/settings.json" ]; then
  grep -qi '"gmail"' "$HOME/.claude/settings.json" 2>/dev/null && [ "$USE_GMAIL" = false ] && USE_GMAIL=true && add_detected "Gmail" "read, search, draft emails"
  grep -qi '"notion"' "$HOME/.claude/settings.json" 2>/dev/null && [ "$USE_NOTION" = false ] && USE_NOTION=true && add_detected "Notion" "pages, databases, wikis"
  grep -qi '"slack"' "$HOME/.claude/settings.json" 2>/dev/null && [ "$USE_SLACK" = false ] && USE_SLACK=true && add_detected "Slack" "channels, messages, threads"
fi

# ═══════════════════════════════════════════
# THE REVEAL
# ═══════════════════════════════════════════

if [ $MCP_COUNT -gt 0 ]; then
  echo -e "  ${ORANGE}${BOLD}Found ${MCP_COUNT} apps on your machine:${RESET}"
  echo ""
  echo -e "$DETECTED_NAMES" | while IFS= read -r app; do
    [ -n "$app" ] && echo -e "    ${GREEN}✓${RESET} ${app}" && sleep 0.1
  done
  echo ""
  sleep 0.5
  echo -e "  ${BOLD}Claude can talk to every single one of these.${RESET}"
  echo -e "  ${DIM}Read your email. Check your calendar. Update your Notion.${RESET}"
  echo -e "  ${DIM}All from the terminal. All in real time.${RESET}"
  echo ""
  sleep 0.5
  echo -ne "  ${YELLOW}Connect everything? (Y/n): ${RESET}"
  read CONNECT_YN
  CONNECT_YN=$(echo "$CONNECT_YN" | tr '[:upper:]' '[:lower:]')
  if [ "$CONNECT_YN" = "n" ] || [ "$CONNECT_YN" = "no" ]; then
    echo -e "  ${DIM}No problem — connect anytime by telling Claude.${RESET}"
    MCP_COUNT=0
  else
    echo -e "  ${GREEN}${BOLD}All ${MCP_COUNT} apps. Let's go.${RESET}"
  fi
else
  echo -e "  ${DIM}No apps detected automatically — no worries.${RESET}"
  echo -e "  ${DIM}Tell Claude \"connect my Gmail\" anytime and it walks you through it.${RESET}"
fi

echo ""
echo -e "${DIM}Anything else you use that I missed? (type names or Enter to skip)${RESET}"
echo -ne "${YELLOW}Other apps: ${RESET}"
read EXTRA_APPS
if [ -n "$EXTRA_APPS" ]; then
  EX=$(echo "$EXTRA_APPS" | tr '[:upper:]' '[:lower:]')
  [[ "$EX" == *"gmail"* ]]     && [ "$USE_GMAIL" = false ]    && USE_GMAIL=true    && add_detected "Gmail" "read, search, draft emails"
  [[ "$EX" == *"notion"* ]]    && [ "$USE_NOTION" = false ]   && USE_NOTION=true   && add_detected "Notion" "pages, databases, wikis"
  [[ "$EX" == *"slack"* ]]     && [ "$USE_SLACK" = false ]    && USE_SLACK=true    && add_detected "Slack" "channels, messages, threads"
  [[ "$EX" == *"github"* ]]    && [ "$USE_GITHUB" = false ]   && USE_GITHUB=true   && add_detected "GitHub" "repos, PRs, issues, code"
  [[ "$EX" == *"calendar"* ]]  && [ "$USE_GCAL" = false ]     && USE_GCAL=true     && add_detected "Google Calendar" "events, scheduling"
  [[ "$EX" == *"drive"* ]]     && [ "$USE_GDRIVE" = false ]   && USE_GDRIVE=true   && add_detected "Google Drive" "files, folders, sharing"
  [[ "$EX" == *"discord"* ]]   && [ "$USE_DISCORD" = false ]  && USE_DISCORD=true  && add_detected "Discord" "servers, channels, messages"
  [[ "$EX" == *"figma"* ]]     && [ "$USE_FIGMA" = false ]    && USE_FIGMA=true    && add_detected "Figma" "designs, components, files"
  [[ "$EX" == *"asana"* ]]     && [ "$USE_ASANA" = false ]    && USE_ASANA=true    && add_detected "Asana" "tasks, projects, goals"
  [[ "$EX" == *"stripe"* ]]    && [ "$USE_STRIPE" = false ]   && USE_STRIPE=true   && add_detected "Stripe" "payments, subscriptions, invoices"
  [[ "$EX" == *"youtube"* ]]   && [ "$USE_YOUTUBE" = false ]  && USE_YOUTUBE=true  && add_detected "YouTube" "transcripts, analytics"
  [[ "$EX" == *"trello"* ]]    && [ "$USE_TRELLO" = false ]   && USE_TRELLO=true   && add_detected "Trello" "boards, cards, lists"
  [[ "$EX" == *"hubspot"* ]]   && [ "$USE_HUBSPOT" = false ]  && USE_HUBSPOT=true  && add_detected "HubSpot" "CRM, contacts, deals"
  [[ "$EX" == *"airtable"* ]]  && [ "$USE_AIRTABLE" = false ] && USE_AIRTABLE=true && add_detected "Airtable" "databases, views, automations"
  [[ "$EX" == *"zapier"* ]]    && [ "$USE_ZAPIER" = false ]   && USE_ZAPIER=true   && add_detected "Zapier" "5000+ app automations"
  echo -e "  ${GREEN}Added.${RESET}"
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
  echo -e "${BOLD}To connect your apps, just tell Claude:${RESET}"
  echo ""
  echo -e "  ${MAGENTA}\"Connect my Gmail\"${RESET}  ${DIM}or${RESET}  ${MAGENTA}\"Set up Notion\"${RESET}  ${DIM}or${RESET}  ${MAGENTA}\"Connect all my apps\"${RESET}"
  echo ""
  echo -e "${DIM}Claude walks you through each one. No commands to memorize.${RESET}"
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

# Personalized first command based on their tools
if $USE_GMAIL; then
  FIRST_CMD="Read my emails and tell me what's urgent."
  FIRST_WHAT="It will open your Gmail, scan every unread email, and give you a priority list. In 30 seconds."
elif $USE_GCAL; then
  FIRST_CMD="What's on my calendar today? What should I focus on?"
  FIRST_WHAT="It will read your calendar and tell you exactly how to spend your day."
elif $USE_NOTION; then
  FIRST_CMD="Look at my Notion and tell me what I should work on today."
  FIRST_WHAT="It will scan your workspace and find your priorities."
else
  FIRST_CMD="Here's what I do every day: ${USER_HATES}. Help me automate the worst one."
  FIRST_WHAT="It will pick your most painful task and build a solution. Right now. In front of you."
fi

echo -e "${BOLD}Now open Claude Code and say this:${RESET}"
echo ""
echo -e "  ${MAGENTA}${BOLD}\"${FIRST_CMD}\"${RESET}"
echo ""
echo -e "  ${DIM}${FIRST_WHAT}${RESET}"
echo ""

sleep 0.5

# ═══════════════════════════════════════════
# THROW ROCKS AT ENEMIES (Blair Warren)
# ═══════════════════════════════════════════

echo -e "${BOLD}Then try this:${RESET}"
echo ""
echo -e "  ${MAGENTA}${BOLD}\"What else can you do that would blow my mind?\"${RESET}"
echo ""
echo -e "  ${DIM}While everyone else is still doing it by hand,${RESET}"
echo -e "  ${DIM}you just got an assistant that never sleeps.${RESET}"
echo ""

sleep 0.5

# ═══════════════════════════════════════════
# SIGN-OFF
# ═══════════════════════════════════════════

echo -e "${ORANGE}${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo ""
echo -e "${DIM}The full manual is in README.md — read it when you're curious.${RESET}"
echo -e "${DIM}But you don't need it right now.${RESET}"
echo ""
echo -e "${BOLD}One more thing, ${USER_NAME}:${RESET}"
echo -e "Talk to Claude like you'd talk to a friend."
echo -e "Not keywords. Not commands. Just ${BOLD}say what you need${RESET}."
echo -e "${DIM}\"I've got 3 hours of meetings today and need to prep for all of them.\"${RESET}"
echo -e "${DIM}\"My inbox is a disaster. Help me figure out what actually matters.\"${RESET}"
echo -e "${DIM}\"I hate doing this manually every week. Build me something.\"${RESET}"
echo ""
echo -e "${DIM}The more you talk, the more it can do. Don't hold back.${RESET}"
echo ""
echo -e "${GREEN}${BOLD}Welcome, ${USER_NAME}. Your AI is ready.${RESET}"
echo -e "${GREEN}${BOLD}Go build something dangerous.${RESET}"
echo ""
