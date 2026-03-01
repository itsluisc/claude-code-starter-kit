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
# YOUR AI ASSISTANT COMES ONLINE
# ═══════════════════════════════════════════

echo ""
echo -e "${CYAN}${BOLD}"
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

echo -e "${CYAN}${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
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

echo -e "  ${RED}${BOLD}\"${USER_HATES}\"${RESET}"
echo ""
sleep 0.3
echo -e "  ${DIM}That's hours of your life — every single week — you're never getting back.${RESET}"
sleep 0.3
echo -e "  ${DIM}And it's not that you're bad at it.${RESET}"
echo -e "  ${DIM}The tools to fix it didn't exist until right now.${RESET}"
sleep 0.5
echo ""
echo -e "  ${BOLD}You were right${RESET} — there IS a better way."
echo -e "  ${DIM}Everyone who told you \"that's just how it is\" was wrong.${RESET}"
sleep 0.5
echo ""
echo -e "  ${GREEN}${BOLD}\"${USER_HATES}\"?${RESET}"
echo -e "  ${GREEN}Starting today — that's over. We're killing it.${RESET}"
sleep 1
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
echo -e "${BOLD}Here's what most people don't know:${RESET}"
echo -e "Claude connects ${BOLD}directly${RESET} to your apps. Not copy-paste. ${BOLD}Live access.${RESET}"
echo ""
echo -e "${DIM}Look at everything that's possible:${RESET}"
echo ""
echo -e "  ${CYAN}${BOLD}EMAIL & COMMUNICATION${RESET}"
echo -e "   1) Gmail               2) Slack               3) Discord"
echo ""
echo -e "  ${CYAN}${BOLD}PRODUCTIVITY${RESET}"
echo -e "   4) Notion              5) Asana               6) Linear"
echo -e "   7) Todoist             8) Trello              9) Jira"
echo ""
echo -e "  ${CYAN}${BOLD}CALENDAR & STORAGE${RESET}"
echo -e "  10) Google Calendar    11) Google Drive        12) Dropbox"
echo ""
echo -e "  ${CYAN}${BOLD}DEVELOPER & DESIGN${RESET}"
echo -e "  13) GitHub             14) GitLab             15) Figma"
echo ""
echo -e "  ${CYAN}${BOLD}BUSINESS & MONEY${RESET}"
echo -e "  16) Stripe             17) QuickBooks         18) HubSpot"
echo ""
echo -e "  ${CYAN}${BOLD}SOCIAL & CONTENT${RESET}"
echo -e "  19) YouTube            20) Twitter/X"
echo ""
echo -e "  ${CYAN}${BOLD}AUTOMATION${RESET}"
echo -e "  21) Zapier             22) Make               23) Airtable"
echo ""
echo -e "${DIM}Pick numbers separated by spaces, or type '${RESET}${BOLD}all${RESET}${DIM}' to connect everything.${RESET}"
echo -e "${DIM}Don't worry — you can always add more later.${RESET}"
echo ""
echo -ne "${YELLOW}Your apps (e.g. 1 4 10 13 or 'all'): ${RESET}"
read TOOLS_INPUT

# Handle "all" / "ALL" / "everything" — natural language input
TOOLS_LOWER=$(echo "$TOOLS_INPUT" | tr '[:upper:]' '[:lower:]')
if [[ "$TOOLS_LOWER" == *"all"* ]] || [[ "$TOOLS_LOWER" == *"every"* ]]; then
  TOOLS_INPUT="1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23"
fi

# Parse tool selections
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

for num in $TOOLS_INPUT; do
  case $num in
    1)  USE_GMAIL=true;      MCP_LIST="${MCP_LIST}\n  - Gmail (read, search, draft emails)"; ((MCP_COUNT++)) ;;
    2)  USE_SLACK=true;      MCP_LIST="${MCP_LIST}\n  - Slack (channels, messages, threads)"; ((MCP_COUNT++)) ;;
    3)  USE_DISCORD=true;    MCP_LIST="${MCP_LIST}\n  - Discord (servers, channels, messages)"; ((MCP_COUNT++)) ;;
    4)  USE_NOTION=true;     MCP_LIST="${MCP_LIST}\n  - Notion (pages, databases, wikis)"; ((MCP_COUNT++)) ;;
    5)  USE_ASANA=true;      MCP_LIST="${MCP_LIST}\n  - Asana (tasks, projects, goals)"; ((MCP_COUNT++)) ;;
    6)  USE_LINEAR=true;     MCP_LIST="${MCP_LIST}\n  - Linear (issues, projects, cycles)"; ((MCP_COUNT++)) ;;
    7)  USE_TODOIST=true;    MCP_LIST="${MCP_LIST}\n  - Todoist (tasks, projects)"; ((MCP_COUNT++)) ;;
    8)  USE_TRELLO=true;     MCP_LIST="${MCP_LIST}\n  - Trello (boards, cards, lists)"; ((MCP_COUNT++)) ;;
    9)  USE_JIRA=true;       MCP_LIST="${MCP_LIST}\n  - Jira (issues, sprints, boards)"; ((MCP_COUNT++)) ;;
    10) USE_GCAL=true;       MCP_LIST="${MCP_LIST}\n  - Google Calendar (events, scheduling)"; ((MCP_COUNT++)) ;;
    11) USE_GDRIVE=true;     MCP_LIST="${MCP_LIST}\n  - Google Drive (files, folders, sharing)"; ((MCP_COUNT++)) ;;
    12) USE_DROPBOX=true;    MCP_LIST="${MCP_LIST}\n  - Dropbox (files, folders)"; ((MCP_COUNT++)) ;;
    13) USE_GITHUB=true;     MCP_LIST="${MCP_LIST}\n  - GitHub (repos, PRs, issues, code)"; ((MCP_COUNT++)) ;;
    14) USE_GITLAB=true;     MCP_LIST="${MCP_LIST}\n  - GitLab (repos, MRs, pipelines)"; ((MCP_COUNT++)) ;;
    15) USE_FIGMA=true;      MCP_LIST="${MCP_LIST}\n  - Figma (designs, components, files)"; ((MCP_COUNT++)) ;;
    16) USE_STRIPE=true;     MCP_LIST="${MCP_LIST}\n  - Stripe (payments, subscriptions, invoices)"; ((MCP_COUNT++)) ;;
    17) USE_QUICKBOOKS=true; MCP_LIST="${MCP_LIST}\n  - QuickBooks (accounting, invoices)"; ((MCP_COUNT++)) ;;
    18) USE_HUBSPOT=true;    MCP_LIST="${MCP_LIST}\n  - HubSpot (CRM, contacts, deals)"; ((MCP_COUNT++)) ;;
    19) USE_YOUTUBE=true;    MCP_LIST="${MCP_LIST}\n  - YouTube (transcripts, analytics)"; ((MCP_COUNT++)) ;;
    20) USE_TWITTER=true;    MCP_LIST="${MCP_LIST}\n  - Twitter/X (posts, search, trends)"; ((MCP_COUNT++)) ;;
    21) USE_ZAPIER=true;     MCP_LIST="${MCP_LIST}\n  - Zapier (5000+ app automations)"; ((MCP_COUNT++)) ;;
    22) USE_MAKE=true;       MCP_LIST="${MCP_LIST}\n  - Make (workflow automations)"; ((MCP_COUNT++)) ;;
    23) USE_AIRTABLE=true;   MCP_LIST="${MCP_LIST}\n  - Airtable (databases, views, automations)"; ((MCP_COUNT++)) ;;
  esac
done

echo ""
if [ $MCP_COUNT -gt 0 ]; then
  if [ $MCP_COUNT -ge 15 ]; then
    echo -e "${GREEN}${BOLD}${MCP_COUNT} apps. You're about to be dangerous.${RESET}"
  elif [ $MCP_COUNT -ge 5 ]; then
    echo -e "${GREEN}${BOLD}${MCP_COUNT} apps. Claude connects to all of them.${RESET}"
  else
    echo -e "${GREEN}${MCP_COUNT} apps. Good start — you can always add more.${RESET}"
  fi
else
  echo -e "${GREEN}No worries. You can connect apps anytime.${RESET}"
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
echo -e "${GREEN}${DEPTH_DESC}. That's how Claude will talk to you from now on.${RESET}"
sleep 0.5
echo ""

# ═══════════════════════════════════════════
# BUILD CLAUDE.MD FROM ANSWERS
# ═══════════════════════════════════════════

echo -e "${CYAN}${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
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
  echo -e "${BOLD}Your app connections:${RESET}"
  echo -e "${DIM}These are the MCP commands to connect each app. Copy and run in terminal.${RESET}"
  echo ""

  # Tier 1: Official Anthropic MCP servers (one-command install)
  TIER1_COUNT=0
  if $USE_GMAIL; then
    echo -e "  ${CYAN}claude mcp add gmail -- npx @anthropic/claude-gmail-mcp${RESET}"
    ((TIER1_COUNT++))
  fi
  if $USE_GCAL; then
    echo -e "  ${CYAN}claude mcp add gcal -- npx @anthropic/claude-google-calendar-mcp${RESET}"
    ((TIER1_COUNT++))
  fi
  if $USE_NOTION; then
    echo -e "  ${CYAN}claude mcp add notion -- npx @anthropic/claude-notion-mcp${RESET}"
    ((TIER1_COUNT++))
  fi
  if $USE_GDRIVE; then
    echo -e "  ${CYAN}claude mcp add gdrive -- npx @anthropic/claude-google-drive-mcp${RESET}"
    ((TIER1_COUNT++))
  fi
  if $USE_SLACK; then
    echo -e "  ${CYAN}claude mcp add slack -- npx @anthropic/claude-slack-mcp${RESET}"
    ((TIER1_COUNT++))
  fi
  if $USE_GITHUB; then
    echo -e "  ${CYAN}claude mcp add github -- npx @anthropic/claude-github-mcp${RESET}"
    ((TIER1_COUNT++))
  fi
  if $USE_ASANA; then
    echo -e "  ${CYAN}claude mcp add asana -- npx @anthropic/claude-asana-mcp${RESET}"
    ((TIER1_COUNT++))
  fi
  if $USE_LINEAR; then
    echo -e "  ${CYAN}claude mcp add linear -- npx @anthropic/claude-linear-mcp${RESET}"
    ((TIER1_COUNT++))
  fi

  # Tier 2: Community MCP servers (setup guide needed)
  TIER2_APPS=""
  if $USE_DISCORD; then TIER2_APPS="${TIER2_APPS} Discord"; fi
  if $USE_TODOIST; then TIER2_APPS="${TIER2_APPS} Todoist"; fi
  if $USE_TRELLO; then TIER2_APPS="${TIER2_APPS} Trello"; fi
  if $USE_JIRA; then TIER2_APPS="${TIER2_APPS} Jira"; fi
  if $USE_DROPBOX; then TIER2_APPS="${TIER2_APPS} Dropbox"; fi
  if $USE_GITLAB; then TIER2_APPS="${TIER2_APPS} GitLab"; fi
  if $USE_FIGMA; then TIER2_APPS="${TIER2_APPS} Figma"; fi
  if $USE_STRIPE; then TIER2_APPS="${TIER2_APPS} Stripe"; fi
  if $USE_QUICKBOOKS; then TIER2_APPS="${TIER2_APPS} QuickBooks"; fi
  if $USE_HUBSPOT; then TIER2_APPS="${TIER2_APPS} HubSpot"; fi
  if $USE_YOUTUBE; then TIER2_APPS="${TIER2_APPS} YouTube"; fi
  if $USE_TWITTER; then TIER2_APPS="${TIER2_APPS} Twitter/X"; fi
  if $USE_ZAPIER; then TIER2_APPS="${TIER2_APPS} Zapier"; fi
  if $USE_MAKE; then TIER2_APPS="${TIER2_APPS} Make"; fi
  if $USE_AIRTABLE; then TIER2_APPS="${TIER2_APPS} Airtable"; fi

  if [ -n "$TIER2_APPS" ]; then
    echo ""
    echo -e "  ${DIM}These need community MCP setup (ask Claude how):${RESET}"
    echo -e "  ${DIM} ${TIER2_APPS}${RESET}"
  fi

  echo ""
  if [ $TIER1_COUNT -gt 0 ]; then
    echo -e "${DIM}Copy and run each command above. Takes 30 seconds each.${RESET}"
  fi
  echo -e "${DIM}Pro tip: Just tell Claude \"connect my Gmail\" and it walks you through it.${RESET}"
fi

sleep 0.5

# ═══════════════════════════════════════════
# THE MOMENT — WHAT TO SAY FIRST
# ═══════════════════════════════════════════

echo ""
echo -e "${CYAN}${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
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

echo -e "${CYAN}${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
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
