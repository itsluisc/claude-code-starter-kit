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

 v1.0 — How Claude Code should come out of the box.
```

**One install. Zero pain.** Your AI assistant actually remembers what it's doing, warns you before you burn credits, and never loses your work.

---

## Getting Started — Onboarding Questionnaire

Before you install, answer these questions. They'll shape your CLAUDE.md and make Claude Code work *for you* specifically.

```
╔══════════════════════════════════════════════════════════════╗
║              GETTING TO KNOW YOU                             ║
╠══════════════════════════════════════════════════════════════╣
║                                                              ║
║  1. What's your role?                                        ║
║     [ ] Developer  [ ] Designer  [ ] Operator                ║
║     [ ] Founder    [ ] Content Creator  [ ] Other            ║
║                                                              ║
║  2. What's your main stack?                                  ║
║     Languages: ___________  Frameworks: ___________          ║
║     Database: ____________  Hosting: ______________          ║
║                                                              ║
║  3. What tools do you live in?                               ║
║     [ ] Notion   [ ] Obsidian  [ ] Linear  [ ] Jira         ║
║     [ ] Slack    [ ] Discord   [ ] Gmail   [ ] Outlook      ║
║     [ ] Figma    [ ] VS Code   [ ] Cursor  [ ] Other        ║
║                                                              ║
║  4. What's your OS?                                          ║
║     [ ] macOS    [ ] Windows (WSL2)  [ ] Linux               ║
║                                                              ║
║  5. What annoys you most about AI coding tools?              ║
║     [ ] Losing context / session dies                        ║
║     [ ] Walls of text I can't scan                           ║
║     [ ] Burning credits too fast                             ║
║     [ ] Doesn't remember what I told it                      ║
║     [ ] Have to repeat myself constantly                     ║
║     [ ] All of the above                                     ║
║                                                              ║
║  6. Personality (optional but powerful):                      ║
║     Myers-Briggs: ____ (take: 16personalities.com)           ║
║     VARK Learning Style: V__ A__ R__ K__                     ║
║       (take: vark-learn.com/the-vark-questionnaire)          ║
║     DISC: ____ (D/I/S/C)                                     ║
║     Communication style: [ ] Direct  [ ] Detailed            ║
║                           [ ] Casual  [ ] Structured         ║
║                                                              ║
╚══════════════════════════════════════════════════════════════╝
```

After answering, paste your answers into your `CLAUDE.md` under `## About Me`. Claude will adapt its output style, communication, and format to match YOU.

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
║  😤 Figured out integrations the hard way                         ║
╠═══════════════════════════════════════════════════════════════════╣
║                     AFTER THE STARTER KIT                         ║
╠═══════════════════════════════════════════════════════════════════╣
║  ✅ Sessions survive forever — auto-saves, auto-resumes           ║
║  ✅ Cost warnings at 50%, 70%, 85% — never surprise-burned        ║
║  ✅ Smart boot picks up where you left off automatically          ║
║  ✅ Visual-first output — tables, box frames, scannable           ║
║  ✅ Backup enforcer — never lose work again                       ║
║  ✅ Ship tracker — are you building or just tinkering?            ║
║  ✅ All MCP servers pre-documented with use cases                  ║
║  ✅ Personality-tuned to YOUR learning style                       ║
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

## What's In The Kit

### 🪝 Hooks (Auto-Run, Zero Effort)

Hooks are scripts that run automatically during your Claude Code sessions. You install them once and never think about them again.

| Hook | What Pain It Kills | How It Works |
|------|-------------------|--------------|
| `context-survival.js` | "My session died mid-task" | Saves your work state at 60/70/80% context. After auto-compaction, reads it back. Session never dies. |
| `smart-boot.js` | "Where was I? What was I doing?" | At session start, checks for recent state file, detects your project from the directory, shows git branch. |
| `cost-guardian.js` | "I burned my whole weekly credit limit" | Warns at 50%, 70%, 85% of weekly usage. Tracks how many expensive agents you've spawned. |
| `ship-tracker.js` | "I spent all day in Claude but shipped nothing" | Classifies your work as "dangerous" (visible output — pushed code, sent emails) vs "system" (internal — configs, refactors). Alerts after 60 min of system-only work. |
| `session-end-enforcer.js` | "I forgot to save/backup my work" | Forces you to save session state, update backups before the session ends. Not a suggestion — a command. |

### 📋 CLAUDE.md Template

A starter `CLAUDE.md` that gives Claude Code the right habits from day one:
- **Visual-first output** — tables, box frames, checklists (not walls of text)
- **Context survival protocol** — how to handle session state
- **Gate protocol** — pre-flight/post-flight checks on every operation
- **Parallel execution** — use free parallel tool calls, don't burn credits on agents
- **Docs-first** — always read documentation before guessing
- **No excuses** — try 3 approaches before asking

### 📖 Reference Docs

| Doc | What It Teaches Claude |
|-----|----------------------|
| `gate-protocol.md` | Never show broken output. Check inputs before running, verify outputs after. |
| `qc-backup-protocol.md` | Where to backup, how to verify, verification table format. |
| `documentation-first.md` | Always fetch official docs before advising on any tool. |
| `quality-gates.md` | Pre/mid/post-flight checklists for any operation. |
| `tool-stack.md` | Which tools to use for what (transcription, video, search, etc.) |

---

## Personality Setup (Do This First!)

Claude Code works 10x better when it knows HOW you think. Before your first session, figure out these about yourself:

### Learning Style (VARK Test)

Take the free test: https://vark-learn.com/the-vark-questionnaire/

| Type | You Learn By | Claude Should |
|------|-------------|---------------|
| **V**isual | Seeing diagrams, charts, flows | Use tables, ASCII art, box frames |
| **A**ural | Hearing explanations | Give conversational explanations with analogies |
| **R**ead/Write | Reading docs, taking notes | Provide detailed written documentation |
| **K**inesthetic | Doing, hands-on | Break everything into single executable steps |

Add to your CLAUDE.md:
```markdown
## My Learning Style
VARK scores: V[score] A[score] R[score] K[score]
Primary: [Visual/Aural/Read-Write/Kinesthetic]
Always use [tables/diagrams/step-by-step/docs] format.
```

### Personality Type

Any of these help Claude communicate better with you:

| Test | Free Link | What It Tells Claude |
|------|-----------|---------------------|
| **Myers-Briggs (16P)** | https://www.16personalities.com | Introvert/extrovert, thinker/feeler, structured/flexible |
| **DISC** | https://www.tonyrobbins.com/disc | Dominant/Influencer/Steady/Conscientious — communication style |
| **PI Index** | (via employer) | Work drives and behavioral patterns |

Add to your CLAUDE.md:
```markdown
## My Personality
Myers-Briggs: [TYPE] (e.g., ENFP)
DISC: [TYPE] (e.g., Di — dominant with influence)
Communication preference: [direct/detailed/casual/structured]
```

---

## MCP Servers — What To Install & Why

MCP (Model Context Protocol) servers give Claude Code superpowers — direct access to your tools instead of copy-pasting between apps.

### Essential (Install These First)

| MCP Server | What It Does | Install Command | Use Case |
|-----------|-------------|----------------|----------|
| **Gmail** | Read, search, send, draft emails | `claude mcp add gmail -- npx @anthropic/claude-gmail-mcp` | Email triage, auto-drafts, inbox zero |
| **Google Calendar** | View, create, update events | `claude mcp add gcal -- npx @anthropic/claude-google-calendar-mcp` | Schedule management, find free time |
| **Notion** | Read/write Notion pages & databases | `claude mcp add notion -- npx @anthropic/claude-notion-mcp` | Knowledge base, project tracking, SOPs |
| **Google Drive** | Read/manage Drive files | `claude mcp add gdrive -- npx @anthropic/claude-google-drive-mcp` | File access, document management |
| **Brave Search** | Web search without leaving Claude | `claude mcp add brave-search -- npx @anthropic/claude-brave-search-mcp` | Research, fact-checking, current events |

### Power User

| MCP Server | What It Does | Use Case |
|-----------|-------------|----------|
| **Supermemory** | Persistent memory across sessions | Claude remembers everything you've ever discussed |
| **Playwright** | Full browser automation | Fill forms, scrape sites, test UIs |
| **CapCut** | Video editing API | Create/edit videos programmatically |
| **Firecrawl** | Web scraping & crawling | Extract data from any website |
| **YouTube Transcript** | Pull transcripts from any video | Learn from videos, create content |

### Platform-Specific

| If You Use... | Install This MCP | Why |
|--------------|-----------------|-----|
| Notion | Notion MCP | Direct read/write to your workspace |
| Obsidian | File system MCP + local vault path | Read/write your vault directly |
| Slack | Slack MCP | Read channels, send messages |
| Linear | Linear MCP | Issue tracking, sprint management |
| Asana | Asana MCP | Task management, project tracking |
| GitHub | (built-in via `gh` CLI) | PRs, issues, code review |

---

## System Requirements & Setup

### macOS

```bash
# Required
brew install node           # Hooks run on Node.js
brew install git            # Version control
brew install gh             # GitHub CLI (built-in to Claude Code)

# Recommended
brew install uv             # Fast Python package manager
brew install ffmpeg          # Audio/video processing
brew install jq             # JSON processing
```

### Windows (WSL2)

```bash
# In WSL2 terminal:
sudo apt update && sudo apt install -y nodejs npm git
npm install -g gh

# Recommended
sudo apt install -y python3-pip ffmpeg jq
pip install uv
```

### API Keys You'll Want

| API | Free Tier | What For | Get It |
|-----|-----------|----------|--------|
| **Anthropic** | (via Claude Code subscription) | Already have it | — |
| **Brave Search** | 2,000 queries/month | Web search MCP | https://brave.com/search/api/ |
| **Groq** | 28,800 sec/day audio | Fast transcription | https://console.groq.com |
| **Notion** | Unlimited | Notion MCP integration | https://www.notion.so/my-integrations |
| **Google Cloud** | Free tier | Gmail + Calendar MCPs | https://console.cloud.google.com |

---

## Customization Guide

### Add Your Projects to Smart Boot

Edit `~/.claude/hooks/smart-boot.js` — find the `PROJECT_MAP` array:

```javascript
const PROJECT_MAP = [
  {
    pattern: /my-saas-app/i,
    name: 'My SaaS App',
    context: 'Next.js frontend, Supabase backend, Stripe payments.'
  },
  {
    pattern: /client-website/i,
    name: 'Client Website',
    context: 'WordPress redesign for AccountingCo.'
  }
];
```

### Customize Your CLAUDE.md

The template gives you the basics. Add sections for:

```markdown
## My Role
[What you do — developer, designer, operator, founder]

## My Stack
[Languages, frameworks, databases you use daily]

## My Tools
[Apps you use — Notion/Obsidian, Figma, Slack, etc.]

## Never Do
[Things that annoy you — e.g., "never use emojis", "don't explain obvious things"]

## Always Do
[Your preferences — e.g., "always use TypeScript", "test before committing"]
```

---

## FAQ

**Q: Will this conflict with my existing Claude Code setup?**
A: No. The installer skips files that already exist. Your settings.json may need manual hook merging if you already have hooks configured.

**Q: Does this work on Windows?**
A: Yes, via WSL2. The hooks are Node.js — platform-independent.

**Q: How do I update?**
A: `git pull` in the starter kit directory, then run `bash install.sh` again. It won't overwrite your customizations.

**Q: Can I remove a hook I don't want?**
A: Delete it from `~/.claude/hooks/` and remove its entry from `~/.claude/settings.json`.

**Q: What if I use Obsidian instead of Notion?**
A: The kit is tool-agnostic. The references mention Notion but everything works with whatever you use. Point your MCP servers at your tools.

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
│   └── CLAUDE.md                ← Starter CLAUDE.md
├── references/
│   ├── gate-protocol.md         ← Pre/post-flight checks
│   ├── qc-backup-protocol.md    ← Backup verification
│   └── documentation-first.md   ← Read docs before coding
└── shared/
    ├── quality-gates.md         ← Quality checklists
    └── tool-stack.md            ← Tool recommendations
```

---

## Credits

Built by [Luis Carrillo](https://github.com/itsluisc) — learned all of this the hard way so you don't have to.

Systems architecture by Dave (Luis's AI Systems Architect).
