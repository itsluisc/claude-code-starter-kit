```
   _____ _                 _         ____          _
  / ____| |               | |       / ___|___   __| | ___
 | |    | | __ _ _   _  __| | ___  | |   / _ \ / _` |/ _ \
 | |    | |/ _` | | | |/ _` |/ _ \ | |__| (_) | (_| |  __/
 |  ____| | (_| | |_| | (_| |  __/  \____\___/ \__,_|\___|
  \_____|_|\__,_|\__,_|\__,_|\___|

  ____  _             _              _  ___ _
 / ___|| |_ __ _ _ __| |_ ___ _ __ | |/ (_) |_
 \___ \| __/ _` | '__| __/ _ \ '__|| ' /| | __|
  ___) | || (_| | |  | ||  __/ |   | . \| | |_
 |____/ \__\__,_|_|   \__\___|_|   |_|\_\_|\__|

 v1.2 — How Claude Code should come out of the box.
```

**One install. Zero pain.** The starter kit we wish existed when we started. Everything we learned the hard way — packaged so you don't have to.

**The promise: You will never lose a file, a session, or an idea ever again.**

---

## Why This Exists

Claude Code is powerful. But out of the box, it has problems nobody warns you about:

- Your session **dies mid-task** and says "start a new conversation" — losing everything
- You **burn your entire weekly credit limit** by Wednesday with no warning
- Claude **forgets what you were working on** every single session
- Output is **walls of text** you can't scan in under 30 seconds
- You have **no idea which MCP servers, APIs, or tools** to install
- You **lose work** because nothing was automatically saved

This kit fixes all of that. One install. Then it just works — forever.

---

## First: Let's Get To Know You

Your answers here shape everything. They determine which setup instructions you see, which MCP servers to install, and how Claude communicates with you.

```
╔══════════════════════════════════════════════════════════════╗
║                   GETTING TO KNOW YOU                        ║
╠══════════════════════════════════════════════════════════════╣
║                                                              ║
║  ABOUT YOUR SETUP                                            ║
║  ────────────────                                            ║
║  1. Computer:  [ ] Mac  [ ] Windows  [ ] Linux               ║
║                                                              ║
║  2. Phone:     [ ] iPhone  [ ] Android                       ║
║                                                              ║
║  3. Editor:    [ ] VS Code  [ ] Cursor  [ ] Neovim           ║
║                [ ] Terminal only  [ ] Other                   ║
║                                                              ║
║  ABOUT YOUR WORK                                             ║
║  ────────────────                                            ║
║  4. Role:      [ ] Developer  [ ] Designer  [ ] Operator     ║
║                [ ] Founder  [ ] Content Creator  [ ] Other   ║
║                                                              ║
║  5. Stack:                                                   ║
║     Languages: ________________                              ║
║     Frameworks: _______________                              ║
║     Database: _________________                              ║
║     Hosting: __________________                              ║
║                                                              ║
║  6. Daily tools:                                             ║
║     [ ] Notion   [ ] Obsidian  [ ] Linear   [ ] Jira        ║
║     [ ] Slack    [ ] Discord   [ ] Gmail    [ ] Outlook      ║
║     [ ] Figma    [ ] GitHub    [ ] Vercel   [ ] Other        ║
║                                                              ║
║  ABOUT YOUR PAIN POINTS                                      ║
║  ────────────────────────                                    ║
║  7. What annoys you most?                                    ║
║     [ ] Losing context / session dies                        ║
║     [ ] Walls of text I can't scan                           ║
║     [ ] Burning credits too fast                             ║
║     [ ] Doesn't remember what I told it                      ║
║     [ ] Have to repeat myself constantly                     ║
║     [ ] All of the above                                     ║
║                                                              ║
║  ABOUT YOU (optional but 10x more powerful)                  ║
║  ──────────────────────────────────────────                  ║
║  8. Myers-Briggs: ____ (free: 16personalities.com)           ║
║                                                              ║
║  9. VARK Learning Style: V__ A__ R__ K__                     ║
║     (free: vark-learn.com/the-vark-questionnaire)            ║
║                                                              ║
║  10. DISC Profile: ____ (D/I/S/C)                            ║
║                                                              ║
║  11. How do you like to communicate?                         ║
║      [ ] Direct — just tell me what to do                    ║
║      [ ] Detailed — explain everything                       ║
║      [ ] Casual — talk to me like a friend                   ║
║      [ ] Structured — bullet points and tables               ║
║                                                              ║
╚══════════════════════════════════════════════════════════════╝
```

**Why this matters:** If you're a Visual-Kinesthetic learner (like most builders), Claude should give you tables and step-by-step actions — not paragraphs. If you're INTJ, Claude should be direct and skip the pleasantries. If you use Windows, the install commands are completely different from Mac. Your answers change EVERYTHING.

After answering, paste them into your `CLAUDE.md` under `## About Me`.

---

## Before vs After

```
╔═══════════════════════════════════════════════════════════════════╗
║                    BEFORE THE STARTER KIT                         ║
╠═══════════════════════════════════════════════════════════════════╣
║  😤 Session dies mid-task → "Please start a new conversation"     ║
║  😤 Burned weekly credits by Thursday → wait until reset          ║
║  😤 Claude forgets what you were working on every session         ║
║  😤 Walls of text you can't scan                                  ║
║  😤 Lost work because nothing was saved                           ║
║  😤 No idea which MCP servers to install                          ║
║  😤 Every mistake = learning from scratch, alone                  ║
║  😤 Nothing is repeatable — reinvent the wheel every time         ║
╠═══════════════════════════════════════════════════════════════════╣
║                     AFTER THE STARTER KIT                         ║
╠═══════════════════════════════════════════════════════════════════╣
║  ✅ Sessions survive forever — auto-saves state, auto-resumes     ║
║  ✅ Cost warnings at 50%, 70%, 85% — never surprise-burned        ║
║  ✅ Smart boot picks up where you left off automatically          ║
║  ✅ Visual-first output — tables, box frames, scannable in 5 sec  ║
║  ✅ Backup enforcer — you will NEVER lose work again              ║
║  ✅ Ship tracker — know if you're building or just tinkering      ║
║  ✅ All MCP servers documented with install commands               ║
║  ✅ Personality-tuned to YOUR learning + communication style       ║
║  ✅ Everything repeatable becomes a skill you keep forever         ║
╚═══════════════════════════════════════════════════════════════════╝
```

---

## Quick Install

```bash
git clone https://github.com/itsluisc/claude-code-starter-kit.git
cd claude-code-starter-kit
bash install.sh
```

Then restart Claude Code. Done.

---

## The 10 Fundamental Rules

These are the principles baked into every piece of this kit. They're not optional — they're what separates a frustrating Claude Code experience from a magical one.

| # | Rule | Why It Matters |
|---|------|---------------|
| 1 | **One source of truth** | Every piece of data lives in ONE place. Not scattered across 5 files. Your database, your CLAUDE.md, your state file — each owns its domain. |
| 2 | **Never lose anything** | Context-survival + session-end-enforcer + state file = impossible to lose work. Sessions auto-save at 60%, 70%, 80%. After compaction, auto-resume. |
| 3 | **Visual-first output** | Max 3 sentences before a table, box frame, or checklist. If you can't scan it in 5 seconds, it's wrong. |
| 4 | **Gate everything** | Pre-flight: are inputs correct? Post-flight: is output good? If Claude can skip a check, it will. Gates prevent that. |
| 5 | **Docs before guessing** | Always read official documentation before advising on any tool. Never guess at APIs. |
| 6 | **Parallel by default** | Free parallel tool calls > expensive agent spawns. Batch reads, searches, and checks. Save agents for complex work. |
| 7 | **Everything repeatable = a skill** | Did something twice? It's a skill. Package it with a SKILL.md so you (or Claude) can run it perfectly every time. |
| 8 | **Tag and categorize everything** | Frameworks, keywords, layers (Surface/Machine/Underground) — structured data is searchable data. Unstructured data is lost data. |
| 9 | **Fix it, don't explain it** | Try 3 approaches before asking. Don't explain blockers — solve them. |
| 10 | **Ship, don't tinker** | Track your dangerous-to-system ratio. If you've been building internal stuff for 60+ minutes without any visible output — something's wrong. |

---

## What's In The Kit

### Hooks (Auto-Run, Zero Effort)

Hooks are scripts that fire automatically during your sessions. Install once, never think about them again.

| Hook | Pain It Kills | How It Works |
|------|--------------|--------------|
| `context-survival.js` | "My session died mid-task" | Auto-saves work state at 60/70/80% context usage. After auto-compaction, reads it back. **Your session literally never dies.** |
| `smart-boot.js` | "Where was I?" | At session start: checks for recent state file, detects your project from directory, shows git branch. Picks up exactly where you left off. |
| `cost-guardian.js` | "Burned my whole weekly limit" | Warns at 50%, 70%, 85% of weekly usage. Tracks expensive agent spawns. You'll never be surprised again. |
| `ship-tracker.js` | "Spent all day, shipped nothing" | Classifies work as "dangerous" (pushed code, sent emails, created content) vs "system" (configs, refactors). Alerts after 60 min of system-only work. |
| `session-end-enforcer.js` | "Forgot to save my work" | Commands (not suggests) backup sequence when session is ending. Shows verification table of what's saved and what's not. |

### CLAUDE.md Template

Your `CLAUDE.md` is the instruction manual Claude reads at every session start. The template includes:
- **Visual-first output rules** — tables, box frames, checklists
- **Context survival protocol** — how to handle the state file
- **Gate protocol** — pre-flight/post-flight on every operation
- **Parallel execution** — free parallel calls first, agents last
- **Docs-first** — read documentation before coding
- **No excuses** — solve it, don't explain why you can't

### Reference Docs

| Doc | What It Teaches Claude |
|-----|----------------------|
| `gate-protocol.md` | Never show broken output. Check inputs before running, verify outputs after. |
| `qc-backup-protocol.md` | Where to backup, how to verify, verification table format. |
| `documentation-first.md` | Always fetch official docs before advising on any tool. |
| `quality-gates.md` | Pre/mid/post-flight checklists for any operation. |
| `tool-stack.md` | Which tools to use for what (transcription, video, search, etc.) |

---

## Personality Setup

Claude Code works 10x better when it knows HOW you think.

### Learning Style (VARK)

Take the free test: https://vark-learn.com/the-vark-questionnaire/

| Type | You Learn By | What Claude Should Do |
|------|-------------|----------------------|
| **V**isual | Diagrams, charts, flows | Tables, ASCII art, box frames, tree structures |
| **A**ural | Hearing, discussing | Conversational tone, analogies, "think of it like..." |
| **R**ead/Write | Docs, notes, lists | Detailed documentation, numbered steps, references |
| **K**inesthetic | Doing, hands-on | Single executable steps, "do this now, then this" |

### Personality Profiles

| Test | Free Link | What It Tells Claude |
|------|-----------|---------------------|
| **Myers-Briggs** | https://www.16personalities.com | How you process info, make decisions, handle structure |
| **DISC** | https://www.tonyrobbins.com/disc | Communication style — direct/social/steady/analytical |
| **PI Index** | (via employer) | Work drives and behavioral patterns |

Add to your CLAUDE.md:
```markdown
## About Me
Role: [what you do]
Myers-Briggs: [TYPE]
VARK: V[score] A[score] R[score] K[score]
DISC: [TYPE]
Communication: [direct/detailed/casual/structured]
Never: [things that annoy you]
Always: [your preferences]
```

---

## Building Skills (Make Everything Repeatable)

Here's a rule that will change how you use Claude Code forever:

**If you did something twice, it's a skill. Package it.**

A skill is a reusable instruction file that Claude reads when you invoke it. Instead of explaining what you want every time, you say `/my-skill` and it runs perfectly.

### How to Create a Skill

Official docs: https://docs.anthropic.com/en/docs/claude-code/skills

```
~/.claude/skills/my-skill/
├── SKILL.md          ← Instructions Claude follows
└── references/       ← Supporting docs, templates, examples
    └── template.md
```

Basic SKILL.md format:
```markdown
---
name: my-skill
description: "What this skill does in one sentence."
invocation: "/my-skill"
---

# My Skill

## What This Does
[Explain the task]

## Steps
1. [Step 1]
2. [Step 2]
3. [Step 3]

## Output Format
[What the result should look like]
```

### Skill Ideas for Beginners

| Skill | What It Automates |
|-------|------------------|
| `/commit` | Stage, write message, commit with your preferred format |
| `/review` | Code review checklist you always follow |
| `/deploy` | Your deployment steps in order |
| `/standup` | Generate daily standup from git log |
| `/email-draft` | Draft emails in your voice and style |

**The mindset:** Every workflow you repeat is a skill waiting to be built. The more skills you create, the more powerful Claude Code becomes — permanently.

---

## MCP Servers — Your Superpowers

MCP (Model Context Protocol) servers give Claude direct access to your tools. No more copy-pasting between apps.

### Essential (Install These First)

| MCP Server | What It Does | Install | Use Case |
|-----------|-------------|---------|----------|
| **Gmail** | Read, search, send emails | `claude mcp add gmail -- npx @anthropic/claude-gmail-mcp` | Email triage, drafts |
| **Google Calendar** | View, create events | `claude mcp add gcal -- npx @anthropic/claude-google-calendar-mcp` | Scheduling |
| **Notion** | Read/write pages & DBs | `claude mcp add notion -- npx @anthropic/claude-notion-mcp` | Knowledge base |
| **Google Drive** | File management | `claude mcp add gdrive -- npx @anthropic/claude-google-drive-mcp` | Documents |
| **Brave Search** | Web search | `claude mcp add brave-search -- npx @anthropic/claude-brave-search-mcp` | Research |

### Power User

| MCP Server | What It Does | Best For |
|-----------|-------------|----------|
| **Supermemory** | Persistent memory across sessions | Claude remembers everything forever |
| **Playwright** | Full browser automation | Forms, scraping, testing |
| **Firecrawl** | Web scraping & crawling | Data extraction from any site |
| **YouTube Transcript** | Pull transcripts | Learn from videos, content creation |
| **CapCut** | Video editing API | Programmatic video editing |

### By Your Tools

| If You Use... | Install This | Why |
|--------------|-------------|-----|
| Notion | Notion MCP | Direct read/write |
| Obsidian | Filesystem access (built-in) + set vault path in CLAUDE.md | Read/write your vault |
| Slack | Slack MCP | Channels, messages |
| Linear | Linear MCP | Issues, sprints |
| Asana | Asana MCP | Tasks, projects |
| GitHub | Built-in via `gh` CLI | PRs, issues, code review |

---

## System Setup (By Platform)

### macOS

```bash
# ═══════════════════════════════════════
# REQUIRED — Claude Code won't work well without these
# ═══════════════════════════════════════
brew install node              # Hooks run on Node.js
brew install git               # Version control
brew install gh                # GitHub CLI

# ═══════════════════════════════════════
# RECOMMENDED — makes everything smoother
# ═══════════════════════════════════════
brew install uv                # Fast Python package manager (replaces pip)
brew install ffmpeg            # Audio/video processing
brew install jq                # JSON processing in terminal
brew install ripgrep           # Fast code search (rg command)
brew install sqlite3           # Database for bot schedulers, local data
brew install wget              # Download files from URLs
brew install tree              # Visual directory structure

# ═══════════════════════════════════════
# FOR CONTENT CREATORS
# ═══════════════════════════════════════
brew install yt-dlp            # Download YouTube videos
brew install imagemagick       # Image manipulation
```

### Windows (WSL2 Required)

WSL2 gives you a Linux terminal inside Windows. Claude Code runs here.

```bash
# Install WSL2 first (in PowerShell as admin):
# wsl --install

# Then in WSL2 terminal:
sudo apt update && sudo apt install -y \
  nodejs npm git jq ripgrep sqlite3 wget tree ffmpeg imagemagick

# GitHub CLI
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update && sudo apt install gh

# Python tooling
sudo apt install -y python3-pip
pip install uv yt-dlp
```

### Linux

Same as WSL2 above — it IS Linux.

---

## API Keys — Where They Live & How to Get Them

**Important: Every person gets their OWN API keys. Never share keys.**

### Where to Store Keys

Create a `.env` file in your Claude config:

```bash
# File: ~/.claude/.env
# This file is PRIVATE — never commit to git, never share

BRAVE_API_KEY=your-key-here
GROQ_API_KEY=your-key-here
NOTION_TOKEN=your-integration-token
# Add more as needed
```

Add to your `.gitignore`:
```
.env
*.env
```

### Keys You'll Want

| API | Free Tier | What For | Get It |
|-----|-----------|----------|--------|
| **Anthropic** | Included with Claude Code sub | Powers Claude Code itself | Already have it |
| **Brave Search** | 2,000 queries/month | Web search MCP | https://brave.com/search/api/ |
| **Groq** | 28,800 sec/day audio | Fastest transcription (Whisper) | https://console.groq.com |
| **Notion** | Unlimited | Notion MCP read/write | https://www.notion.so/my-integrations |
| **Google Cloud** | Free tier | Gmail + Calendar + Drive MCPs | https://console.cloud.google.com |
| **OpenAI** | Pay-as-you-go | Whisper fallback, DALL-E images | https://platform.openai.com |
| **Twelve Labs** | Free tier | Video understanding AI | https://twelvelabs.io |
| **ElevenLabs** | 10K chars/month | Text-to-speech, voice cloning | https://elevenlabs.io |

---

## Customization Guide

### Add Your Projects to Smart Boot

Edit `~/.claude/hooks/smart-boot.js` — find `PROJECT_MAP`:

```javascript
const PROJECT_MAP = [
  {
    pattern: /my-saas-app/i,
    name: 'My SaaS',
    context: 'Next.js frontend, Supabase backend, Stripe payments.'
  },
  {
    pattern: /client-website/i,
    name: 'Client Site',
    context: 'WordPress redesign for AccountingCo.'
  }
];
```

Now when you open Claude Code in that directory, it auto-detects the project.

### Expand Your CLAUDE.md

The template gives you the basics. Here's what to add as you grow:

```markdown
## My Role
[Developer / Designer / Operator / Founder / Creator]

## My Stack
[Languages, frameworks, databases, hosting]

## My Database
[The ONE place where your structured data lives — Notion, Obsidian, Postgres, etc.]
This is the single source of truth. Everything routes here.

## My Tools
[Apps you use daily — list them so Claude knows what's available]

## Never Do
[Things that drive you crazy — "never walls of text", "don't use emojis"]

## Always Do
[Your non-negotiables — "always use TypeScript", "test before commit"]

## My Frameworks
[If you have your own systems, teach them to Claude here.
Tag everything: keywords, categories, layers.]
```

---

## FAQ

**Q: Will this conflict with my existing setup?**
A: No. The installer skips existing files. If you have hooks already, merge the settings.json manually.

**Q: Mac or Windows — does it matter?**
A: The hooks are Node.js — platform-independent. Install commands differ (brew vs apt), but everything else is identical.

**Q: How do I update the kit?**
A: `cd claude-code-starter-kit && git pull && bash install.sh` — won't overwrite your customizations.

**Q: Can I remove a hook?**
A: Delete from `~/.claude/hooks/` and remove from `~/.claude/settings.json`.

**Q: I use Obsidian, not Notion.**
A: Kit is tool-agnostic. Obsidian works great — just set your vault path in CLAUDE.md and Claude reads/writes directly via filesystem.

**Q: What is a "skill" and do I need one?**
A: A skill = a reusable instruction file. If you do something more than once, make it a skill. See the [Building Skills](#building-skills-make-everything-repeatable) section. Official docs: https://docs.anthropic.com/en/docs/claude-code/skills

**Q: Where should my API keys live?**
A: In `~/.claude/.env` — NEVER in your code, NEVER committed to git, NEVER shared with anyone. Each person creates their own keys.

---

## File Structure

```
claude-code-starter-kit/
├── README.md                    ← You are here
├── install.sh                   ← One-command installer
├── hooks/
│   ├── context-survival.js      ← Sessions never die
│   ├── cost-guardian.js         ← Weekly credit warnings
│   ├── ship-tracker.js          ← Are you shipping or tinkering?
│   ├── smart-boot.js            ← Auto-resume sessions
│   └── session-end-enforcer.js  ← Forces backup before exit
├── templates/
│   └── CLAUDE.md                ← Starter CLAUDE.md template
├── references/
│   ├── gate-protocol.md         ← Pre/post-flight checks
│   ├── qc-backup-protocol.md    ← Backup verification system
│   └── documentation-first.md   ← Read docs before coding
└── shared/
    ├── quality-gates.md         ← Quality checklists
    └── tool-stack.md            ← Tool recommendations
```

---

## What's Next

This kit is v1.2. It will keep growing. Planned additions:

- [ ] Interactive setup wizard (runs in terminal, builds your CLAUDE.md from answers)
- [ ] Before/after visual comparison image
- [ ] Platform-specific install scripts (detect OS automatically)
- [ ] Starter skills pack (commit, review, deploy, standup)
- [ ] Team onboarding guide (for companies rolling out Claude Code)
- [ ] Video walkthrough

---

## Credits

Built by [Luis Carrillo](https://github.com/itsluisc) — learned all of this the hard way so you don't have to.

Systems architecture by Dave. Hooks battle-tested across 185+ skills and thousands of sessions.

**The philosophy:** Claude Code is the most powerful AI coding tool that exists. But out of the box, it's like buying a race car with no seat belt, no speedometer, and no GPS. This kit adds all of that. Now go build something dangerous.
