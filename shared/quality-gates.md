# Universal Quality Gates — MANDATORY for ALL Skills

**Every skill has gates. No exceptions. If a gate fails, the skill STOPS. Never show Luis broken output.**

---

## Pre-Flight Gate (BEFORE doing anything)

Every skill checks these BEFORE execution. ANY failure = BLOCK.

| Check | How | Fail Action |
|-------|-----|-------------|
| Inputs exist? | Files present, URLs valid, text provided | BLOCK — ask for missing inputs |
| Client identified? | Name matched to CLIENT-PROFILE.md or skill | BLOCK — ask which client |
| Tool stack loaded? | `_shared/tool-stack.md` referenced | BLOCK — load it |
| Dependencies available? | API keys set, tools installed, drives mounted | BLOCK — report what's missing |
| Viral reference loaded? | Client's top videos queried from Viral Hits Library | WARN — load before proceeding |

---

## Mid-Flight Gates (DURING execution, between stages)

For multi-stage skills (pipelines), check between EVERY stage:

| Gate | Check | Fail Action |
|------|-------|-------------|
| Transcript gate | Transcript exists, is not empty, has timestamps? | STOP — re-transcribe with groq-transcribe |
| Video watched? | Twelve Labs + Hume analysis completed? | STOP — run video intelligence before editing |
| Clip quality | Hook strong? Cut clean? Audio smooth? No dead air? | FLAG — mark for human review, don't auto-ship |
| Brand check | Client name spelled correctly? Handle correct? Voice matched? | STOP — verify against client skill |
| Format check | Correct aspect ratio? Duration in range? Resolution correct? | FIX — auto-correct if possible, flag if not |

---

## Post-Flight Gate (BEFORE showing Luis)

Every skill checks these BEFORE delivering output. ANY failure = FIX silently and re-run.

| Check | How | Fail Action |
|-------|-----|-------------|
| Output exists? | File created, content generated, result visible | FIX — re-run the step that failed |
| CUB Test passes? | Clear + Believable + Works (see below) | FIX — iterate until passes |
| Empty fields? | No blank sections, no placeholder text, no TBD | FIX — fill or remove |
| Viral reference compared? | Output scored against client's top viral videos | WARN — compare before delivering |
| Backed up? | Supermemory saved? State file updated? Notion pushed? | DO IT — save before closing |

---

## CUB Test (Clear, Believable, Works)

Run on EVERY output before Luis sees it.

| C — Clear | U — Believable | B — Works |
|-----------|----------------|-----------|
| Can Luis understand this in 5 seconds? | Would this fool someone into thinking a human made it? | Does it actually DO the thing it's supposed to? |
| No jargon, no confusion, no ambiguity | Matches the client's real voice, style, energy | Play the video. Read the post. Click the link. Does it work? |
| If Luis has to ask "what is this?" = FAIL | If it sounds like AI wrote it = FAIL | If it's broken, glitchy, or incomplete = FAIL |

---

## Viral Reference Check

For ANY content creation skill:

1. Query client's Viral Hits Library entries (top 10 by views)
2. Compare output against winning patterns:
   - Hook type matches what works for THIS client?
   - Duration in the sweet spot for THIS niche?
   - Energy level matches THIS client's viral videos?
   - Visual style consistent with what performs?
3. Score: Does this output match the energy of content that got 1M+ views?
4. If score < 7/10 → FLAG for human review with specific notes on what's weak

---

## Backup Gate (End of EVERY skill execution)

| What | Where | How |
|------|-------|-----|
| Session learning | Supermemory | `mcp__supermemory__memory` — save what was learned |
| Session state | `/tmp/claude-session-state.md` | Write tool — current task + progress |
| Permanent patterns | MEMORY.md | Edit tool — only confirmed stable patterns |
| Deferred tasks | `~/.claude/deferred-tasks.md` | Update if anything postponed or completed |
| Notion | Relevant DB | `notion-push.py` or direct MCP — push results |
| GitHub | Relevant repo | Commit if skill was updated |
| Google Drive | Relevant folder | `mcp__gdrive` — backup critical outputs |

**RULE:** If a skill creates something valuable, it gets backed up to AT LEAST 2 places before the session ends. Notion + GitHub minimum. Google Drive for media files.

---

## How Skills Import This

Every SKILL.md must include:

```
**Tool Stack:** Follow `~/.claude/skills/_shared/tool-stack.md` for ALL tool choices.
**Quality Gates:** Follow `~/.claude/skills/_shared/quality-gates.md` for ALL quality checks.
```

These two lines make ANY skill enforce the full system. No skill is exempt.
