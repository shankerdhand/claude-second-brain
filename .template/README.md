# {{ASSISTANT_NAME}} — my second brain

{{ASSISTANT_NAME}} is my personal and business assistant. Say "{{ASSISTANT_NAME}}, brief me" or just ask.
Drafts always go out in my name, never signed {{ASSISTANT_NAME}}.

A personal and business assistant that lives in plain Markdown files, driven by Claude Code.
No server, no database, no lock-in. Everything is a file you can read, edit, grep, back up,
or take somewhere else.

## Start here

```bash
/onboard-brain
```

That's the interview that fills the brain in. It takes about an hour in total, but it's
designed to be done in pieces — do identity and family today, work next week. Everything
below gets better the more of it is filled in.

## Day to day

| Say this | And you get |
|---|---|
| `/daily-brief` | Calendar, mail worth your attention, tasks, open loops, upcoming dates |
| `/plan-day` | An honest plan that fits the hours you actually have |
| `/remember <anything>` | It gets filed in the right place, permanently |
| `/recall <question>` | An answer from your own notes, with the source |
| `/person-brief <name>` | Everything you know about someone, before you meet them |
| `/draft-letter` | A letter or formal email in your voice, not a robot's |
| `/meeting-notes` | Messy notes → decisions, actions with owners, filed |
| `/process-inbox` | Everything you dumped in `inbox/` gets filed and cleared |
| `/weekly-review` | Sunday retro, cleanup, and next week set up |
| `/daily-email-summary` | Last 24h of email, summarised and emailed to you |

You don't have to use the slash commands. "What's on today?", "remind me Ravi's daughter is
getting married in November", "who is Priya again?" all work.

## The shape of it

```
CLAUDE.md              How Claude behaves here. The most important file.
brain/                 What is known — identity, people, work, routines, life admin
memory/                What happened — dated logs, decisions, open loops
inbox/                 What hasn't been filed yet (gitignored)
private/               Backups and anything sensitive (gitignored)
scripts/brain          Small CLI helper
.claude/skills/        The skills above
```

## The helper

```bash
scripts/brain search "ravi"      # search everything
scripts/brain stats              # how full is the brain
scripts/brain todos              # every gap still unfilled
scripts/brain stale              # files that haven't been touched in 90 days
scripts/brain log "did a thing"  # append to today's log
scripts/brain person "Name"      # new person file
scripts/brain project "Name"     # new project file
scripts/brain backup             # snapshot to private/backups (keeps 10)
```

## What never goes in these files

Passwords, OTPs, card numbers, CVVs, bank account numbers, Aadhaar / PAN / passport
numbers, API keys, recovery codes. Record *where* a credential lives, never the credential
itself. Claude is instructed to refuse these and will say so.

## Two things worth doing early

1. **Fill `brain/identity/voice.md` with real writing samples.** It's the difference
   between drafts you send and drafts you rewrite.
2. **Fill `brain/routines/calendar-of-the-year.md`.** Birthdays, renewals, expiries,
   deadlines. It's the single highest-value file — it's what stops things being missed.

## Backing it up

It's just files. `scripts/brain backup` makes a local snapshot. For real safety, make it a
git repo and push it somewhere private:

```bash
git init && git add -A && git commit -m "brain"
```

`private/` and `inbox/` are already gitignored.
