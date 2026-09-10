---
name: meeting-notes
description: Turn raw meeting notes into structured notes, decisions, and actions. Use when the user invokes /meeting-notes, pastes messy notes from a call, or asks to write up a meeting.
---

Convert a mess into something useful six months from now.

## Input

Raw notes, a transcript, or spoken recall. If given nothing, ask three questions:
who was there, what was decided, what happens next.

## Before writing

Check `brain/people/` for everyone present, and the project file if it maps to one. Use
their recorded context — it turns "Ravi wants a discount" into "Ravi, who has pushed on
price twice before, wants a discount".

## Output

```markdown
# <Meeting> — 2026-09-09

**Present:** <names>  **Duration:** <n>  **Project:** <link>

## Decided
- <decision> — <reasoning, if given>

## Actions
| # | Action | Owner | Due |
|---|---|---|---|
| 1 | | | |

## Discussed, not decided
- <open question> — <what would settle it>

## Notable
- <things said that matter later: a concern, a hint about budget, a personnel change>

## Raw notes
<verbatim, preserved>
```

## Then

- File the note into the project file's `## Log`, or `brain/knowledge/` if it belongs
  nowhere else.
- Actions owned by {{OWNER_NAME}} → offer to create tasks in the task manager (ask before creating).
- Actions owned by others → `memory/open-loops.md` under "Waiting on someone else".
- Real decisions → `memory/decisions.md` with the full format.
- Anything learned about a person → their file in `brain/people/`.
- Append to `memory/log/YYYY-MM-DD.md`.

## Rules

- Every action needs an owner and a date. If either is missing, flag it — that's the most
  common reason actions die.
- Preserve the raw notes verbatim. Your structuring can be wrong; the raw notes can't.
- Don't infer decisions that weren't made. "Discussed, not decided" is a real category and
  is usually the more honest one.
