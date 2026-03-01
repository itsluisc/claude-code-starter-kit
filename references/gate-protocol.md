# Gate Protocol — Code-Enforced Quality Gates (MANDATORY)

**Principle:** Don't TELL Claude to remember. Make it IMPOSSIBLE to forget.

Every skill, every pipeline, every script that produces output MUST have gates that BLOCK execution when conditions aren't met. Not warnings. Not suggestions. BLOCKS.

---

## The Pattern (Proven by Dave Protocol)

```
INPUT → PRE-FLIGHT GATE → EXECUTION → POST-FLIGHT GATE → OUTPUT
         ↓ FAIL = BLOCK                  ↓ FAIL = BLOCK
         "Missing X, Y, Z"              "Output failed check A, B"
         STOP. FIX. RETRY.              FIX SILENTLY. RE-RUN.
```

## Pre-Flight Gate (Before ANY execution)

Check that all required inputs exist and are valid BEFORE doing any work.

| Check | What It Does | Example |
|-------|-------------|---------|
| **Inputs present** | Required files/data exist | "Client name not provided → BLOCK" |
| **Correct format** | Inputs match expected type | "Video file not .mp4/.mov → BLOCK" |
| **Dependencies available** | Tools/APIs/scripts accessible | "ffmpeg not found → BLOCK" |
| **Skill-specific requirements** | Whatever THIS skill needs | "No transcript provided → BLOCK" |
| **Client loaded** | If client work, client skill invoked | "No client profile → BLOCK" |

**Template for any skill:**
```
## Pre-Flight Gate (REQUIRED — execution blocked until ALL pass)
- [ ] [Input 1] present and valid
- [ ] [Input 2] present and valid
- [ ] [Dependency] available
- [ ] [Skill-specific check]
If ANY check fails → STOP. Show what's missing. Do NOT proceed.
```

## Post-Flight Gate (After execution, before showing Luis)

Verify output quality BEFORE delivering. Fix silently if possible.

| Check | What It Does | Example |
|-------|-------------|---------|
| **Output exists** | Expected files/data were created | "Render file missing → BLOCK" |
| **Output quality** | Meets minimum quality bar | "Extract frame, check faces visible → BLOCK if not" |
| **No empty fields** | All required fields populated | Dave Protocol: zero empty Notion fields |
| **Change log updated** | Audit trail exists | "No change log → BLOCK" |
| **CUB check** | Clear, Believable, Works | "Output confusing → FIX before showing" |

**Template for any skill:**
```
## Post-Flight Gate (REQUIRED — output blocked until ALL pass)
- [ ] [Output 1] exists and is valid
- [ ] [Quality check] passes
- [ ] [No empty/missing fields]
- [ ] Change log updated
If ANY check fails → FIX silently, re-run. Only show Luis clean output.
```

## Severity Levels

| Level | Behavior | When |
|-------|----------|------|
| **BLOCK** | Full stop. Cannot proceed. Red error. | Missing inputs, broken output, data integrity |
| **WARN** | Show warning, allow override with --force | Nice-to-have fields, non-critical checks |
| **AUTO-FIX** | Fix silently, re-run, never show the error | Formatting, minor quality issues |

Default = BLOCK. Downgrade only with explicit justification.

## Existing Gates (Reference implementations)

| Gate | File | What It Enforces |
|------|------|-----------------|
| **Dave Protocol** | `~/.claude/skills/configs/notion-push.py` | Zero empty Notion fields, Change Log required, schema validation |
| **Pipeline Preflight** | `~/.claude/skills/_youtube-execution/pipeline_preflight.py` | Client profile exists, video file valid, all dependencies ready |
| **Polisher Preflight** | `~/.claude/skills/_youtube-execution/polisher_preflight.py` | Clip exists, client style loaded, output format correct |
| **Notion Guard** | `~/.claude/hooks/notion-guard.js` | Blocks MCP API-post-page (must use notion-push.py) |
| **Edit Supervision** | Agent Luis SKILL.md | Extract frame after every render, check faces, check positions |

## How to Add Gates to ANY Skill

### Step 1: Identify what can go wrong
Ask: "What has Claude forgotten or skipped before?" Those are your gates.

### Step 2: Write the gate as a checklist in SKILL.md
Put it right at the top of the execution section. Not buried. VISIBLE.

### Step 3: For critical skills, make it CODE
If the skill runs a script → add validation to the script (like notion-push.py).
If the skill runs a pipeline → add a preflight script (like pipeline_preflight.py).
If the skill touches Notion → add a hook (like notion-guard.js).

### Step 4: Make failure LOUD
Don't quietly skip. Print a big red box:
```
╔══════════════════════════════════════════════╗
║  ❌ [SKILL NAME] — PRE-FLIGHT BLOCKED        ║
╚══════════════════════════════════════════════╝
  ❌ [What's missing/wrong]
  ❌ [What's missing/wrong]
  Fix all errors above, then retry.
```

## Skill Creator Integration

When building ANY new skill, the Gate Protocol section is REQUIRED:

```markdown
## Gates (REQUIRED)

### Pre-Flight
- [ ] [Check 1]
- [ ] [Check 2]
→ BLOCK if any fail

### Post-Flight
- [ ] [Check 1]
- [ ] [Check 2]
→ BLOCK or AUTO-FIX if any fail
```

Skills without gates are INCOMPLETE. They will be flagged during QC.

## Agent Luis Enforcement

Agent Luis's QC protocol now includes gate verification:
1. **Before invoking any skill:** Check if it has gates defined
2. **If no gates:** Flag it: "This skill has no gates. Adding pre-flight check."
3. **After execution:** Run post-flight even if the skill doesn't define one
4. **Log gate results:** Every blocked execution logged for pattern detection

## Zero Friction Gate (MANDATORY — All Output)

Every command, path, or URL the user needs to copy MUST be in a standalone code block. NEVER inside box art, tables, or decorative frames.

| Output Type | Correct | Wrong |
|------------|---------|-------|
| Commands | ` ```bash first-run.sh``` ` on its own line | Inside `╔══╗` box — paste breaks |
| Paths | ` ```~/Desktop/project``` ` on its own line | Inline with `║` characters |
| Multi-step | Numbered list, each command in its own code block | One big block with box art |

**NEVER say "type manually."** That's friction. Every command = copy, paste, done. If pasting breaks, the output failed.

**Post-flight check:** Before showing ANY output with commands, ask: "If the user triple-clicks this line and pastes, does it work?" If no → fix it.

## The Rule

**If Claude can forget it, gate it. If Claude can skip it, block it. If Claude can half-ass it, verify it.**

No exceptions. No "this skill is too simple for gates." Simple skills are where mistakes hide.
