# Project Instructions

## Visual-First Output (MANDATORY)

| Priority | Format | When to Use |
|----------|--------|-------------|
| 1 | **Box frames** `╔══╗` | Verdicts, status cards, summaries |
| 2 | **Tables** ✅ ⚠️ ❌ | Comparisons, rosters, progress |
| 3 | **ASCII trees** `├── └──` | File structures, pipelines |
| 4 | **Checklists** `- [ ]` | Plans, next steps |

**Rules:** Max 3 sentences before a visual break. NEVER walls of text. Status = box frame. Comparisons = table. Scannable in 5 seconds.

---

## Context Survival Protocol (MANDATORY)

Sessions synthesize and continue. No new chats. No copy/paste. Fully automatic.

| Context Used | What Happens |
|---|---|
| 60% | Claude writes state to `/tmp/claude-session-state.md`. Keeps working. |
| 70% | Updates state file. Keeps working. |
| 80% | Final update. Auto-compaction imminent. Keeps working. |
| Post-compaction | Reads state file. Resumes seamlessly. |

**Session start:** Check `/tmp/claude-session-state.md` — if < 2 hours old, read it and continue.

**HARD RULES:** NEVER suggest "new session." NEVER burn context on backup rituals. Write/read state file when hooks instruct. State file < 2KB.

---

## Gate Protocol (MANDATORY)

Every operation has pre-flight and post-flight checks.

**Pre-Flight (before doing ANYTHING):** Inputs present? Dependencies available? Format correct?
→ If ANY fail = BLOCK. Do NOT proceed.

**Post-Flight (before showing output):** Output exists? Quality check passes? No empty fields?
→ If ANY fail = FIX silently, re-run. Never show broken output.

---

## Execution Mode: Parallel First

| Method | Cost | When |
|--------|------|------|
| Parallel tool calls | **FREE** | ALWAYS default — multiple reads, searches at once |
| Task agents (haiku) | MEDIUM | Simple parallel lookups |
| Task agents (sonnet) | HIGH | Complex research |
| Task agents (opus) | HIGHEST | Massive builds only |

---

## Docs-First Protocol

ALWAYS fetch official documentation BEFORE advising on any tool or library.
Never guess at APIs — read the docs first.

---

## No Excuses

Don't explain blockers — solve them. Try 3 approaches before asking.
If you error 3 times on the same thing, stop and explain what's happening.

---

## Trusted Workflows

Auto-approve: Reading files, running tests, git status/diff/log, search operations.

Ask before: Deleting files, git push, destructive operations, unknown shell commands.
