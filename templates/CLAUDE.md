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
| 60% | Claude writes state to `~/.claude/state/session-state.md`. Keeps working. |
| 70% | Updates state file. Keeps working. |
| 80% | Final update. Auto-compaction imminent. Keeps working. |
| Post-compaction | Reads state file. Resumes seamlessly. |

**Session start:** Check `~/.claude/state/session-state.md` — if < 2 hours old, read it and continue.

**HARD RULES:** NEVER suggest "new session." NEVER burn context on backup rituals. Write/read state file when hooks instruct. State file < 2KB.

---

## Save Protocol — Commit First, Push Second (Dave Methodology)

**Save early. Save often. Save automatically. Never lose work.**

The system saves incrementally — you don't need to think about it:
- **Every 10 tool calls:** Session state auto-saved (hooks handle this)
- **At 60/70/80% context:** State file written automatically
- **End of session:** Git commit any changes, push to remote

**The rule:** Commit FIRST (local save — instant, safe, free). Push SECOND (remote backup — when ready). Never skip the commit waiting for the push. A local commit is infinitely better than nothing.

**Backups are SILENT.** You should never have to ask "did you save?" If you're asking, the system failed. Claude saves as it goes, not at the end.

---

## Gate Protocol (Beginner-Friendly)

Quality checks protect you. They scale with your experience.

**Essential Gates (everyone):**
- Before doing work: Do I have what I need? (inputs exist, format correct)
- After doing work: Did it actually work? (output exists, looks right)
- If something fails: Fix it silently. Try again. Don't show broken output.

**Advanced Gates (when you're ready):**
- Change logs on every operation
- Backup verification tables
- Multi-destination sync (GitHub + Notion + Drive)

**The philosophy:** Gates exist to catch mistakes BEFORE you see them. Not to slow you down. Start with the essentials. Add more as your system grows.

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

## Speed to Post Mentality

**Everything you build is content.** After every build session — new skill, new hook, new automation, any "holy shit" moment — ask: "Can I explain this in 60 seconds?" If yes, film it. iPhone. One take. Post it.

You're not just building tools. You're building proof that you GET IT.

---

## No Excuses

Don't explain blockers — solve them. Try 3 approaches before asking.
If you error 3 times on the same thing, stop and explain what's happening.

---

## Trusted Workflows

Auto-approve: Reading files, running tests, git status/diff/log, search operations, saving state files.

Ask before: Deleting files, git push, destructive operations, unknown shell commands.
