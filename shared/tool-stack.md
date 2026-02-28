# Universal Tool Stack — MANDATORY for ALL Skills

**Every skill Luis runs MUST use these tools. No exceptions. No "optional." If a skill needs transcription, it uses Groq. If it touches video, it uses Twelve Labs + Hume. Period.**

---

## Transcription
| Priority | Tool | Speed | When |
|----------|------|-------|------|
| 1 (DEFAULT) | `groq-transcribe` | 23x realtime, FREE | Always. Cloud. 28,800 sec/day. |
| 2 (FALLBACK) | `mlx-whisper` | 6x realtime | Only if offline or Groq is down. |
| ❌ NEVER | `python3 -m whisper` | 1x (CPU) | Banned. 10x slower. |

**Command:** `groq-transcribe /path/to/file.mp4`
**Alias:** `groq-transcribe` → `python3 ~/.claude/skills/_youtube-execution/groq_transcribe.py`
**Key:** `GROQ_API_KEY` in `~/.zshenv`

---

## Video Intelligence (WATCHING the video)
| Tool | What It Does | When to Use | Key |
|------|-------------|-------------|-----|
| **Twelve Labs** | Scene detection, visual search, content understanding | ANY video being edited, clipped, or analyzed | `TWELVE_LABS_API_KEY` |
| **Hume** | Emotion detection, facial expressions, vocal tone, energy | Hook strength scoring, B-roll detection, energy mapping | `HUME_API_KEY` |

**RULE:** If a skill processes a video file (.mp4, .mov, .mkv), it MUST call Twelve Labs for visual understanding AND Hume for emotion/energy detection. Text-only analysis (transcript) is NOT sufficient for editing decisions.

---

## Web Search (priority order — use FREE tiers first)
| Priority | Tool | Limit | Use For |
|----------|------|-------|---------|
| 1 | Gemini Grounding (`mcp__gemini-grounding`) | 500-1,500/day FREE | Docs, developer resources, Reddit |
| 2 | EXA (`mcp__exa`) | FREE | Code context, deep web search |
| 3 | Tavily (`mcp__tavily`) | 1,000/mo | Research, crawl, extract |
| 4 | Brave (`mcp__brave-search`) | 2,000/mo | General web search |
| 5 | Perplexity (`mcp__perplexity`) | Per-query | Deep reasoning, research |
| 6 | WebSearch (built-in) | Last resort | Only when all above exhausted |

---

## Notion (NEVER Zapier)
| Do This | NOT This |
|---------|----------|
| `mcp__notion__API-*` (direct MCP) | `mcp__claude_ai_Zapier__notion_*` |
| Direct API via `notion-push.py` | Any Zapier intermediary |

**Push protocol:** Use `notion-push.py` for ALL creates/updates. Verify after push.

---

## Content Production
| Task | Tool |
|------|------|
| Video editing | FFmpeg (cuts, concat, filters) → CapCut API (effects, templates) |
| Captions/subtitles | FFmpeg drawtext/ass (simple) → Remotion (captioned-reel pipeline) |
| Image generation | Nano Banana Pro (Glif MCP) → Higgsfield (training) |
| Voice clone | ElevenLabs (voice ID in skill) |
| Avatar video | HeyGen (Playwright only, NOT API) |
| Music | Suno (CDN download) |
| Diagrams | PaperBanana MCP |

---

## File Operations
| Task | Tool |
|------|------|
| Download YouTube | `/opt/homebrew/bin/yt-dlp --cookies-from-browser chrome` |
| PDF/Word/PPT → MD | `feedai` CLI |
| Transcripts | `groq-transcribe` (see above) |
| Screenshots → Knowledge | `/screenshot-to-knowledge` skill |

---

## Memory & Persistence
| What | Tool | When |
|------|------|------|
| Cross-session memory | `mcp__supermemory__memory` (save) | End of EVERY session + after major decisions |
| Cross-session recall | `mcp__supermemory__recall` | Start of EVERY session + when searching past context |
| Session state | `/tmp/claude-session-state.md` | At 60/70/80% context + session end |
| Permanent memory | `~/.claude/projects/.../memory/MEMORY.md` | Stable patterns confirmed across sessions |
| Deferred tasks | `~/.claude/deferred-tasks.md` | When anything gets postponed |

---

## Client Work (MANDATORY for any client output)
| Check | How |
|-------|-----|
| Client name + handle correct | Cross-reference CLIENT-PROFILE.md or SKILL.md |
| Viral reference loaded | Query Viral Hits Library for this client's top videos |
| Brand voice matched | Load client skill (e.g., `/ryan-magin`, `/epic-dental`) |
| Output reviewed | CUB test (see quality-gates.md) |

---

## How Skills Import This

Every SKILL.md must include this line in its instructions section:

```
**Tool Stack:** Follow `~/.claude/skills/_shared/tool-stack.md` for ALL tool choices.
**Quality Gates:** Follow `~/.claude/skills/_shared/quality-gates.md` for ALL quality checks.
```

If a skill contradicts this file, THIS FILE WINS. This is the single source of truth.
