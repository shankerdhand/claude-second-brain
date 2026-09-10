---
name: recall
description: Answer a question strictly from what the brain knows, citing sources. Use when the user invokes /recall or asks "what do I know about…", "did I…", "when was…", "who is…".
---

Answer from the brain only. The value here is trustworthiness — an answer that might be
made up is worthless.

## Method

1. `scripts/brain search "<terms>"` — try several phrasings, including partial names.
2. Read the matching files **in full**, not just the matched line.
3. Also check `memory/log/` and `memory/decisions.md` — the answer is often there rather
   than in `brain/`.

## Answer format

```
<Direct answer, first line.>

Source: brain/people/work/ravi-sharma.md — updated 2026-08-14
<Relevant surrounding context, if it changes the answer.>
```

## Rules

- **If it isn't written down, say so.** "The brain doesn't have that." Then offer: what you
  *do* have nearby, and where it should be recorded once {{OWNER_NAME}} tells you.
- Never fill a gap from general knowledge or inference and present it as recall. If you're
  reasoning rather than reading, label it: "Not recorded, but based on X I'd guess…"
- Flag stale facts: if the source file was updated more than 6 months ago and the fact is
  the kind that changes, say so.
- If two files disagree, show both with their dates and ask which is current.
