---
name: onboard-brain
description: Interview the user to fill in an empty or thin second brain. Use when the user invokes /onboard-brain, when the brain is mostly TODOs, or when they say they want to "set this up" or "teach you about me".
---

Fill the brain by conversation. This is the single most important skill here — everything
else is only as good as what this collects.

## Step 0 — First-time setup (only if needed)

If `CLAUDE.md` still shows a `SETUP-REQUIRED` notice, the brain isn't set up yet. Do this first:

1. Ask, in one message:
   - What's your full name?
   - What's your main email address? (Only the email-summary skill uses it, to send you your summary.)
   - What would you like to call your assistant? (Suggest "Mona"; any name works.)
2. From the brain's folder, run:
   `bash setup.sh --owner "<name>" --email "<email>" --assistant "<assistant name>"`
3. Relay any warning setup prints, especially about git remotes. Re-read `CLAUDE.md`: it now
   carries their name and the notice is gone. Then continue below.

If the chosen assistant name belongs to someone in their life (a spouse, a child), point out the
mix-up it can cause, and offer to add a rule to `CLAUDE.md` §0 so the two are never confused.

## Rules

- **One question at a time, or a small cluster at most.** This is a conversation, not a form.
- **Write as you go.** After every 2–3 answers, save to the right file immediately. Never
  hold answers in context waiting for the end — if the session dies, the work is lost.
- **Never invent.** If an answer is vague, ask once, then write it as given with
  `(unconfirmed)` — do not smooth it into something cleaner than what was said.
- **Let them skip.** "Skip" moves on and leaves the `TODO:`. Don't push.
- **Show progress.** Every few rounds: "That's identity done. Three sections left."
- The user can stop at any point. Say at the start that this can be done in pieces and
  resumed later.

## Where to start

Read `brain/00-index.md` first. If some sections are already filled, skip them and say so.
Ask which area they want to start with, and offer the recommended order:

1. **Identity** — 10 min — biggest immediate payoff
2. **People** — 15 min — family first, then work
3. **Work** — 15 min
4. **Routines & the year's calendar** — 10 min
5. **Life admin** — health, finance, home — 15 min
6. **Voice** — 10 min, needs writing samples

## Section 1 — Identity → `brain/identity/`

- Full name, what people call you, where you're based, timezone, languages.
- What do you do for a living, in a sentence you'd say at a party?
- What other roles do you carry? (father, treasurer of the society, the one who handles
  parents' paperwork…)
- What's the one thing you'd want an assistant to know on day one so they don't
  embarrass you?
- Hard rules about your time — anything that must never be scheduled over?
- What's your current single biggest focus? What would make this year a good one?
- What are you deliberately *not* doing right now?

## Section 2 — People → `brain/people/`

Family first: "Walk me through your immediate family — name, relationship, where they
live, anything I'd need to know to help you take care of them."

Then: "Who are the 5–10 people you deal with most for work?"

For each person, create a file from `brain/people/_template.md`. Filename:
`firstname-lastname.md`, lowercase. Ask for birthdays as you go. Don't interrogate — get
name, relationship, one line of context, and the birthday; depth accumulates later.

Mirror every birthday into `brain/routines/calendar-of-the-year.md` and add a row to
`brain/people/directory.md`.

## Section 3 — Work → `brain/work/`

- What entities exist? Company, freelance, side projects — which are actually active?
- How does money come in? Who pays you, on what cadence?
- What are you working on right now? Create a project file per active project from
  `brain/work/projects/_template.md`.
- What comes back on a clock — standing meetings, reports, invoices, filings?
  → `recurring-obligations.md`
- What tools do you live in? → `tools-and-accounts.md` (**locations of logins, never logins**)

## Section 4 — Routines → `brain/routines/`

- Walk me through a normal weekday, hour by hour, roughly.
- What happens every day no matter what?
- When are you sharpest? When do you crash?
- What does a week look like — anything fixed on particular days?
- Now the year: birthdays, anniversaries, insurance and policy renewals, passport/licence
  expiry, tax deadlines, festivals that change your plans, annual checkups.

The year calendar is the highest-value thing in this whole section. Push a little here.

## Section 5 — Life admin

- **Health:** blood group, allergies, ongoing conditions, regular medication, your doctors,
  insurance policies, when your last full checkup was.
- **Finance:** accounts by *nickname only*, fixed monthly outgoings, subscriptions,
  income sources, who your accountant is. **Stop them if they start reading out a number** —
  say plainly that account numbers don't go in files, and record where the details live instead.
- **Home:** rent/EMI dates, utilities, vehicles and their insurance/service dates, document
  expiry dates, the plumber/electrician/mechanic you trust.

## Section 6 — Voice → `brain/identity/voice.md`

This one needs artefacts, not answers.

- "Paste me 3–5 messages you actually wrote — one to family, one to a client, one to a
  vendor or official."
- From the samples, infer: greeting, sign-off, sentence length, formality per audience,
  emoji use, spelling variant. **Write what you observe, and say what you inferred** so
  they can correct it.
- Ask directly: "What phrases do you hate seeing in your own name?"

## Finishing

1. Update every status marker in `brain/00-index.md` (⚪ → 🟡 → 🟢).
2. Write today's `memory/log/YYYY-MM-DD.md` noting what was captured.
3. Move anything unfinished into `memory/open-loops.md` as "brain gaps".
4. Tell them the top 3 gaps remaining and what each one would unlock.
