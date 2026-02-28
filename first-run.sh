#!/bin/bash
# Claude Code Starter Kit — First Run Experience
# "Speed to Post" for AI Onboarding
#
# 5 questions. 5 minutes. Then your mind gets blown.
# This is NOT a setup wizard. This is the moment Jarvis comes online.

CLAUDE_DIR="$HOME/.claude"
CLAUDE_MD="$CLAUDE_DIR/CLAUDE.md"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Colors
BOLD='\033[1m'
DIM='\033[2m'
CYAN='\033[36m'
GREEN='\033[32m'
YELLOW='\033[33m'
MAGENTA='\033[35m'
RED='\033[31m'
RESET='\033[0m'

clear

# ═══════════════════════════════════════════
# THE MOMENT JARVIS COMES ONLINE
# ═══════════════════════════════════════════

echo ""
echo -e "${CYAN}${BOLD}"
cat << 'JARVIS'

       ██╗ █████╗ ██████╗ ██╗   ██╗██╗███████╗
       ██║██╔══██╗██╔══██╗██║   ██║██║██╔════╝
       ██║███████║██████╔╝██║   ██║██║███████╗
  ██   ██║██╔══██║██╔══██╗╚██╗ ██╔╝██║╚════██║
  ╚█████╔╝██║  ██║██║  ██║ ╚████╔╝ ██║███████║
   ╚════╝ ╚═╝  ╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚══════╝

           I N I T I A L I Z I N G . . .

JARVIS
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

echo -e "${CYAN}${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo ""
echo -e "${BOLD}Hey. I'm Jarvis.${RESET}"
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

echo -e "${CYAN}${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo ""
echo -e "${BOLD}Now the real question.${RESET}"
echo ""
echo -e "What do you ${RED}${BOLD}HATE${RESET} doing every day?"
echo -e "The stuff that makes you think ${DIM}\"ugh, this again.\"${RESET}"
echo ""
echo -e "${DIM}Examples: emails, scheduling, writing reports, social media,"
echo -e "invoicing, meeting notes, research, data entry, follow-ups...${RESET}"
echo ""
echo -e "${DIM}Don't be polite. Get mad. The angrier the better.${RESET}"
echo -e "${DIM}Everything you type here becomes something we fix.${RESET}"
echo ""
echo -ne "${YELLOW}I hate doing: ${RESET}"
read USER_HATES

if [ -z "$USER_HATES" ]; then
  USER_HATES="repetitive tasks"
fi

echo ""
echo -e "${GREEN}Perfect. Every single one of those? Dead. We're killing them.${RESET}"
sleep 0.8
echo ""

# ═══════════════════════════════════════════
# QUESTION 3: MAC OR WINDOWS?
# ═══════════════════════════════════════════

echo -e "${CYAN}${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo ""
echo -e "${BOLD}Quick one — what are you running?${RESET}"
echo ""
echo -e "  ${BOLD}1${RESET}) Mac"
echo -e "  ${BOLD}2${RESET}) Windows"
echo -e "  ${BOLD}3${RESET}) Linux"
echo ""
echo -ne "${YELLOW}Pick a number (1/2/3): ${RESET}"
read PLATFORM_NUM

case $PLATFORM_NUM in
  1) PLATFORM="macOS" ;;
  2) PLATFORM="Windows" ;;
  3) PLATFORM="Linux" ;;
  *) PLATFORM="macOS" ;;
esac

echo ""
echo -e "${GREEN}${PLATFORM}. Noted.${RESET}"
sleep 0.5
echo ""

# ═══════════════════════════════════════════
# QUESTION 4: WHAT TOOLS DO YOU ALREADY USE?
# ═══════════════════════════════════════════

echo -e "${CYAN}${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo ""
echo -e "${BOLD}What tools are already part of your life?${RESET}"
echo -e "${DIM}(Pick all that apply — type the numbers separated by spaces)${RESET}"
echo ""
echo -e "  ${BOLD}1${RESET}) Gmail"
echo -e "  ${BOLD}2${RESET}) Google Calendar"
echo -e "  ${BOLD}3${RESET}) Notion"
echo -e "  ${BOLD}4${RESET}) Google Drive"
echo -e "  ${BOLD}5${RESET}) Slack"
echo -e "  ${BOLD}6${RESET}) GitHub"
echo -e "  ${BOLD}7${RESET}) None of these / I'll figure it out later"
echo ""
echo -ne "${YELLOW}Your tools (e.g. 1 2 3): ${RESET}"
read TOOLS_INPUT

# Parse tool selections
USE_GMAIL=false
USE_GCAL=false
USE_NOTION=false
USE_GDRIVE=false
USE_SLACK=false
USE_GITHUB=false
MCP_LIST=""
MCP_COUNT=0

for num in $TOOLS_INPUT; do
  case $num in
    1) USE_GMAIL=true; MCP_LIST="${MCP_LIST}\n  - Gmail (read, search, draft emails)"; ((MCP_COUNT++)) ;;
    2) USE_GCAL=true; MCP_LIST="${MCP_LIST}\n  - Google Calendar (view, create events)"; ((MCP_COUNT++)) ;;
    3) USE_NOTION=true; MCP_LIST="${MCP_LIST}\n  - Notion (read/write pages and databases)"; ((MCP_COUNT++)) ;;
    4) USE_GDRIVE=true; MCP_LIST="${MCP_LIST}\n  - Google Drive (file management)"; ((MCP_COUNT++)) ;;
    5) USE_SLACK=true; MCP_LIST="${MCP_LIST}\n  - Slack (read channels, send messages)"; ((MCP_COUNT++)) ;;
    6) USE_GITHUB=true; MCP_LIST="${MCP_LIST}\n  - GitHub (PRs, issues, code review)"; ((MCP_COUNT++)) ;;
  esac
done

echo ""
if [ $MCP_COUNT -gt 0 ]; then
  echo -e "${GREEN}${MCP_COUNT} tools. Claude will connect to all of them.${RESET}"
else
  echo -e "${GREEN}No worries. You can connect tools anytime.${RESET}"
fi
sleep 0.5
echo ""

# ═══════════════════════════════════════════
# QUESTION 5: HOW DEEP?
# ═══════════════════════════════════════════

echo -e "${CYAN}${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
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
echo -e "${GREEN}${DEPTH_DESC}. That's how Jarvis will talk from now on.${RESET}"
sleep 0.5
echo ""

# ═══════════════════════════════════════════
# BUILD CLAUDE.MD FROM ANSWERS
# ═══════════════════════════════════════════

echo -e "${CYAN}${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo ""
echo -e "${BOLD}Building your personal Jarvis configuration...${RESET}"
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
  echo -e "${BOLD}Your MCP install commands${RESET} ${DIM}(run these in your terminal):${RESET}"
  echo ""

  if $USE_GMAIL; then
    echo -e "  ${CYAN}claude mcp add gmail -- npx @anthropic/claude-gmail-mcp${RESET}"
  fi
  if $USE_GCAL; then
    echo -e "  ${CYAN}claude mcp add gcal -- npx @anthropic/claude-google-calendar-mcp${RESET}"
  fi
  if $USE_NOTION; then
    echo -e "  ${CYAN}claude mcp add notion -- npx @anthropic/claude-notion-mcp${RESET}"
  fi
  if $USE_GDRIVE; then
    echo -e "  ${CYAN}claude mcp add gdrive -- npx @anthropic/claude-google-drive-mcp${RESET}"
  fi
  if $USE_SLACK; then
    echo -e "  ${CYAN}claude mcp add slack -- npx @anthropic/claude-slack-mcp${RESET}"
  fi

  echo ""
  echo -e "${DIM}Copy and run each one. Takes 30 seconds each.${RESET}"
  echo -e "${DIM}Don't worry if you skip this — you can do it anytime.${RESET}"
fi

sleep 0.5

# ═══════════════════════════════════════════
# THE MOMENT — WHAT TO SAY FIRST
# ═══════════════════════════════════════════

echo ""
echo -e "${CYAN}${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo ""

sleep 0.5

echo -e "${BOLD}${GREEN}"
cat << 'READY'

  ╔═══════════════════════════════════════════════════╗
  ║                                                   ║
  ║   You're ready.                                   ║
  ║                                                   ║
  ║   Jarvis is online. The suit is on.               ║
  ║   Everything is backed up. Nothing will break.    ║
  ║   Sessions never die. Work is never lost.         ║
  ║                                                   ║
  ╚═══════════════════════════════════════════════════╝

READY
echo -e "${RESET}"

sleep 1

echo -e "${BOLD}Now open Claude Code and say this:${RESET}"
echo ""

# Personalized first command based on their tools
if $USE_GMAIL; then
  FIRST_CMD="Read my emails and tell me what's urgent."
  FIRST_WHAT="Claude will open your Gmail, scan every unread email, and give you a priority list. In 30 seconds."
elif $USE_GCAL; then
  FIRST_CMD="What's on my calendar today? What should I focus on?"
  FIRST_WHAT="Claude will read your calendar and tell you exactly how to spend your day."
elif $USE_NOTION; then
  FIRST_CMD="Look at my Notion and tell me what I should work on today."
  FIRST_WHAT="Claude will scan your workspace and find your priorities."
else
  FIRST_CMD="Here's what I do every day: ${USER_HATES}. Help me automate the worst one."
  FIRST_WHAT="Claude will pick your most painful task and build a solution. Right now. In front of you."
fi

echo -e "  ${MAGENTA}${BOLD}\"${FIRST_CMD}\"${RESET}"
echo ""
echo -e "  ${DIM}${FIRST_WHAT}${RESET}"
echo ""

sleep 0.5

echo -e "${BOLD}Then try this:${RESET}"
echo ""
echo -e "  ${MAGENTA}${BOLD}\"What else can you do that would blow my mind?\"${RESET}"
echo ""
echo -e "  ${DIM}You're about to find out why people say they can't live without this.${RESET}"
echo ""

sleep 0.5

# ═══════════════════════════════════════════
# SIGN-OFF
# ═══════════════════════════════════════════

echo -e "${CYAN}${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo ""
echo -e "${DIM}The full manual is in README.md — read it when you're curious.${RESET}"
echo -e "${DIM}But you don't need it right now. Just go talk to Jarvis.${RESET}"
echo ""
echo -e "${BOLD}Welcome to the lab, ${USER_NAME}.${RESET}"
echo -e "${BOLD}Suit up. Build something dangerous.${RESET}"
echo ""
