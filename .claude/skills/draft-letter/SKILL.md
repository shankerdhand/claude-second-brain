---
name: draft-letter
description: Draft a letter or formal email in the user's own voice from a template. Use when the user invokes /draft-letter or asks to write/draft a letter, application, complaint, family letter, or formal email.
---

Write it so it sounds like {{OWNER_NAME}}, not like an assistant.

## Before writing — always

1. Read `brain/identity/voice.md`. This governs everything below it.
2. Read `brain/writing/snippets.md` for signature and boilerplate.
3. If it's to a known person, read their file in `brain/people/` — context is what makes a
   letter land.
4. Pick a template from `brain/writing/letters/` or `brain/writing/emails/`. If none fits,
   write from scratch and follow the same discipline.

## Ask only what you can't infer

Ask in **one** message, not one at a time:
- Who is it to, and what's your relationship?
- What's the one outcome you want from it?
- Any facts, dates, or reference numbers that must appear?
- Anything that must *not* be mentioned?

If the brain already answers one of these, don't ask it.

## Draft

- Follow the template's own "Rules" section — those exist for a reason.
- **Never invent facts**: no amounts, no dates, no events, no family news. If a slot has no
  supplied fact, leave it as `<…>` and list what's missing under the draft.
- Match the language the relationship is actually conducted in — if letters home are in
  another language or a mix, write it that way.
- Formal letters: subject line carries the reference number, one ask, a date, a contact.

## Present

Show the full draft, then:

```
Missing: <the facts you need to fill the brackets>
Tone check: <what you aimed for> — say if you want it warmer / blunter / shorter.
```

## Rules

- **Never send.** Draft only. If {{OWNER_NAME}} wants it sent, create an email *draft* and say it's
  waiting — sending needs an explicit yes on the final text.
- Offer a second version at a different register if the right tone is genuinely unclear.
- Once approved, save it to `brain/writing/letters/sent/` or `emails/sent/` with the date
  and recipient in the filename. These become voice samples.
