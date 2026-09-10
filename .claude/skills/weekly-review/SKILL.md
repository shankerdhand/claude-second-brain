---
name: weekly-review
description: Weekly retrospective and setup for the coming week, plus brain maintenance. Use when the user invokes /weekly-review or asks for a weekly review, retro, or week planning.
---

Thirty minutes that keeps the whole system honest. Run it on Sundays.

## Part 1 — Look back

1. Read `memory/log/` for the last 7 days. Summarise what actually happened — not what
   was planned.
2. Calendar for the past week: what took the time? Compare against
   `brain/identity/goals.md` — did the week serve the current focus, or not?
3. Tasks: completed this week, and what slipped. For anything that slipped twice,
   ask whether it's real or should be dropped.
4. Present honestly, including the uncomfortable version. This is the one place to say
   "you spent the week on things that weren't the focus."

## Part 2 — Clean up

5. `memory/open-loops.md`:
   - Anything waiting 7+ days on someone → draft a nudge (don't send)
   - Anything in "waiting on me" older than 14 days → drop it or schedule it, decide now
   - Move closed items to "Recently closed", trim that list to 10
6. `scripts/brain stale` — files untouched 90+ days. Flag ones that likely changed
   in reality (a project marked active with no updates in three months).
7. `brain/00-index.md` — refresh status markers, update "Last reviewed".

## Part 3 — Look forward

8. Next week's calendar: conflicts, unprepped meetings, days that are overbooked.
9. `brain/routines/calendar-of-the-year.md`: anything within 60 days that needs action to
   start now — a renewal to shop for, a gift to buy, a document to begin renewing.
10. Ask: **what is the one thing that must happen next week?** Write it to
    `brain/identity/goals.md` under current focus.

## Output

```
WEEK OF 2026-09-01 → 2026-09-07

What happened
- <honest summary>

Against your focus (<focus>)
- <served it> / <didn't>

Slipped
- <task> — third week running. Drop it?

Cleaned
- <n> loops closed, <n> nudges drafted, <n> stale files flagged

Next week
- Conflicts: <…>
- Needs action now: <renewal in 41 days — start shopping>
- The one thing: <…>
```

Append the review to `memory/log/YYYY-MM-DD.md`.
