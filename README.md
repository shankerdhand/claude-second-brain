# claude-second-brain

**A second brain and personal assistant that lives in plain Markdown files and runs on Claude.**

Tell it about your people, work, routines and important dates once. After that, just ask:

> *"Mona, what's on today?"*
> *"Remember that Ravi's daughter is getting married on 14 November."*
> *"Draft a complaint to the bank. Here's what happened."*
> *"Brief me on Priya before the 3pm call."*

There's no app, server or database to run. It's a folder of Markdown files you can read, edit and
back up, plus a set of Claude Code skills that make Claude act as a chief of staff for your
personal and business life.

---

## Quick start

You need [Claude Code](https://claude.com/claude-code): the desktop app (Code tab) or the CLI.
Setup takes about two minutes. The first interview takes as long as you like.

### Option A · Use this template *(recommended)*

Your brain gets its own **private** GitHub repo, so it's backed up and synced between computers.

1. Click **Use this template → Create a new repository** at the top of this page, and choose **Private**.
2. Clone it and run setup:
   ```bash
   git clone https://github.com/<you>/<your-brain>.git
   cd <your-brain>
   ./setup.sh
   ```
3. Open the folder in Claude Code and type **`/onboard-brain`**.

### Option B · No terminal

1. Click **Code → Download ZIP** and unzip it wherever you like.
2. Open the folder in the Claude desktop app (**Code** tab → choose the folder).
3. Type **`/onboard-brain`**. Claude asks your name, email and what to call your assistant, runs
   setup for you, then starts the interview.

### Option C · Clone it straight into a folder

```bash
git clone https://github.com/shankerdhand/claude-second-brain.git my-brain
cd my-brain && ./setup.sh
```

Setup detaches the template's git remote, so your personal brain can't be pushed back here by accident.

> [!WARNING]
> **Don't fork this repo to hold your brain.** Forks of public repositories are public. Use A, B or C.

What setup looks like:

```text
$ ./setup.sh
Your full name: Priya Mehta
Your main email: priya@example.com
What should your assistant be called? [Mona]: Jarvis
Set up this folder for Priya Mehta, with an assistant called Jarvis? [Y/n]: y

✓ Jarvis is ready for Priya Mehta.
```

---

## What you get

### Skills

| Say | You get |
|---|---|
| `/onboard-brain` | A friendly interview that fills in the brain. Can be done in pieces. |
| `/daily-brief` | Calendar, emails worth your attention, tasks, open loops, upcoming birthdays and renewals |
| `/plan-day` | An honest plan that fits the hours you actually have |
| `/remember …` | Any fact filed into the right place, permanently |
| `/recall …` | Answers from your own notes, with the source |
| `/person-brief …` | Everything you know about someone, before you meet them |
| `/draft-letter` | Letters and formal emails in *your* voice. It never sends without asking. |
| `/meeting-notes` | Messy notes turned into decisions and actions with owners |
| `/process-inbox` | Everything dumped into `inbox/` gets filed, then cleared |
| `/weekly-review` | A Sunday retro, a clean-up, and next week set up |
| `/daily-email-summary` | The last 24 hours of email, summarised and sent to you |

You don't need the slash commands. *"What's on today?"* works too.

### A morning brief looks like this

```text
Good morning. Three calls, all afternoon; the morning is free.

⚠️  NEEDS YOU TODAY
- Invoice #204 is 12 days overdue. Send the reminder? (draft ready)

📅 CALENDAR
- 14:00–14:30  Ravi · pricing call · prep: has pushed on price twice before
- Free: 09:00–13:30

🔁 OPEN LOOPS
- Waiting 6 days on the landlord for the lease copy. Nudge?

📆 COMING UP
- In 6 days: Mum's birthday. You usually book dinner.
- In 11 days: car insurance renewal
```

### The brain

```text
CLAUDE.md          How the assistant behaves. The most important file.
brain/             What's known: identity, people, work, routines, health, money, home, writing
memory/            What happened: daily logs, decisions, open loops
inbox/             Quick notes waiting to be filed (never committed)
private/           Backups and anything sensitive (never committed)
scripts/brain      Small command-line helper: search, stats, backup…
.claude/skills/    The skills above
```

It includes ready-made letter templates (formal request, complaint escalation, family letter) and
email templates (follow-up, decline, payment reminder, cold intro). Each one has short rules
explaining why it's written the way it is.

---

## Connectors are optional

It works with no connectors at all. Each one you add makes it more useful:

| Connect | Unlocks |
|---|---|
| Email (e.g. Gmail) | Mail in the daily brief, person briefs, drafts, the email summary |
| Calendar (e.g. Google Calendar) | Today's schedule, day planning, meeting prep |
| Task manager (e.g. ClickUp, Todoist, Asana, Linear) | Tasks in the brief and the weekly review |

Without a task manager, tasks live in `memory/open-loops.md`.

## Privacy

Your brain holds personal information, so keep it in a private place. Short version:

- Keep your brain's repo **private**. Never fork this one.
- Passwords, card numbers, ID numbers and API keys never go in the files. The assistant refuses them.
- Anything outward-facing (sending email, inviting people) is shown to you first and waits for a yes.

Full details: [docs/PRIVACY.md](docs/PRIVACY.md).

## Make it yours

Rename the assistant, or add areas, templates, skills, or a scheduled morning brief:
[docs/CUSTOMIZING.md](docs/CUSTOMIZING.md).

## FAQ

**Does it work on Windows?** Setup is a bash script. On Windows, use WSL or Git Bash.

**Can I set up more than one brain?** Yes. `./setup.sh --into ~/brains/family --owner … --email …`
sets up a copy and leaves this folder untouched.

**Personal or business?** Both. The assistant keeps track of which one a request is about.

**How do I get template updates?** Your brain is personalised, so updates don't merge
automatically. Copy improved skills across by hand ([how](docs/CUSTOMIZING.md#getting-template-updates)).

**Where's my data?** In the folder. It's plain Markdown you can open in any editor.

## Contributing

Ideas, new skills and fixes are welcome. See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

[MIT](LICENSE)
