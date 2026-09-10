---
name: remember
description: Capture a fact, event, person, or decision into the right place in the brain. Use when the user invokes /remember, or says "remember this", "note that", "don't let me forget", or states a fact worth keeping.
---

Route the fact to the right file, write it in the house format, confirm in one line.

## Routing

| The thing is… | Goes to |
|---|---|
| About a person | `brain/people/<area>/<name>.md` — create from `_template.md` if new |
| A date that recurs | `brain/routines/calendar-of-the-year.md` |
| A preference or rule about how I work | `brain/identity/preferences.md` |
| A goal or a change of focus | `brain/identity/goals.md` |
| About a project | `brain/work/projects/<project>.md` |
| A client or money term | `brain/work/clients.md` |
| A standing obligation | `brain/work/recurring-obligations.md` |
| Health, money, home, vehicle, document | the matching file in `brain/health\|finance\|home/` |
| A how-to or reference fact | new file in `brain/knowledge/` |
| A choice made and why | `memory/decisions.md` |
| Something unfinished / waiting on someone | `memory/open-loops.md` |
| Ambiguous | ask, once — then file it and say where |

## How to write it

- Absolute dates. `2026-09-09`, never "yesterday".
- Add to the relevant section; add a line under `## Updates` with today's date.
- Fill an existing `TODO:` rather than appending a duplicate fact somewhere else.
- If it contradicts something already in the brain: **say so, show both, ask which is right.**
  Then correct in place and note the correction in `## Updates`.
- New file → add a row to `brain/00-index.md`, and to `brain/people/directory.md` if a person.
- Append to `memory/log/YYYY-MM-DD.md`.

## Refuse to store

Passwords, OTPs, card numbers, CVVs, bank account numbers, Aadhaar/PAN/passport/SSN
numbers, API keys, recovery codes. Say plainly that it doesn't go in a file, and offer to
record the *location* instead ("in 1Password under X").

## Confirm

One line only: `Filed to brain/people/work/ravi-sharma.md — birthday 12 March, added to the year calendar too.`
