# QC Protocol + Backup Verification — Full Reference

## Skill Execution Modes
- **Factory Mode** — Luis says "run it" / "factory mode" / "auto" → execute ALL steps autonomously
- **Build Mode** — Default for new/first-time → step-by-step with Luis picking options

## Mandatory QC Checklist (Every Skill, Every Time)

| Phase | What Happens | If Fails |
|-------|-------------|----------|
| **Pre-Flight** | Confirm inputs, mode, client context, output format | BLOCK |
| **Step Execution** | Announce each step, execute, verify output exists | CRITICAL → BLOCK. MINOR → WARN |
| **Post-Flight** | Count outputs vs expected, verify no steps skipped | QC PASS or QC FAIL |
| **Backup Trigger** | Save to supermemory + MEMORY.md + session-intelligence.md | BLOCK session end until confirmed |

## Critical vs Minor
- **CRITICAL (BLOCK):** Missing input files, wrong client, output doesn't exist, transcript empty, destructive overwrite
- **MINOR (WARN):** Formatting off, optional metadata missing, thumbnail not generated

## CUB Framework (All Communication)
- **C — Clear** (not Confusing): Can Luis understand it in 5 seconds?
- **U — Believable** (not Unbelievable): Backed by real data?
- **B — Works** (not Boring): Does it actually function?

## Auto-Backup Protocol
Supermemory + MEMORY.md + session-intelligence.md saves happen AUTOMATICALLY every session end.

Additional keyword triggers for FULL sync: "backup" / "sync" / "save" / "push" / "don't lose this"

**Priority order:** 1) Supermemory → 2) MEMORY.md → 3) session-intelligence.md → 4) GitHub → 5) Google Drive → 6) Notion

## Session-End Backup Verification

```
BACKUP VERIFICATION — [date]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
ALWAYS (every session with work):
| Supermemory          | ✅/❌  | [key facts saved]                 |
| MEMORY.md            | ✅/❌  | [section added/updated]           |
| session-intelligence | ✅/❌  | [session entry appended]          |

IF CHANGED (only if modified this session):
| GitHub (skills)      | ✅/N/A | [commit hash]                     |
| GitHub (luis-config)  | ✅/N/A | [commit hash]                     |
| GitHub (luis-coaches) | ✅/N/A | [commit hash]                     |
| GitHub (luis-courses) | ✅/N/A | [commit hash]                     |
| GitHub (edit-w-claude)| ✅/N/A | [commit hash]                     |
| GitHub (viral-editz)  | ✅/N/A | [commit hash]                     |
| Google Drive         | ✅/N/A | [files uploaded]                  |
| Notion               | ✅/N/A | [pages/entries updated]           |
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

**Rules:**
- Top 3 = ALWAYS. Bottom 8 = only if touched.
- 6 GitHub repos: skills, luis-config, luis-coaches, luis-courses, edit-with-claude, viral-editz-ai
- Session transcript backup to Google Drive is AUTOMATIC (launchd hourly)

## 2-Week Lookahead
1. Check current tasks, deadlines, client deliverables
2. Identify THIS week and NEXT week priorities
3. Flag blockers before they become blockers
4. Always include content/filming in the plan

Full details: `~/.claude/skills/agent-luis/references/qc-protocol.md`
