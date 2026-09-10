# Making it yours

Everything is plain Markdown, so you can change anything. Here are the common changes.

## Rename your assistant
Edit the title and §0 of `CLAUDE.md`, and the title of `README.md`. If the new name belongs to
someone in your life, add a line to §0 saying which one is meant when. Otherwise mix-ups will
happen.

## Add an area to the brain
Create a folder or file under `brain/` (for example `brain/pets/pets.md`). End it with an
`## Updates` section and add a row to `brain/00-index.md` so the assistant knows it exists.

## Add a letter or email template
Drop a Markdown file into `brain/writing/letters/` or `brain/writing/emails/`. Use
`<angle brackets>` for the gaps and finish with a short **Rules** section. `/draft-letter`
follows those rules.

## Add a skill
Create `.claude/skills/<name>/SKILL.md`:

```markdown
---
name: expense-log
description: Log an expense into brain/finance. Use when the user says "I spent", "log this expense", or /expense-log.
---

What it does, step by step, and the exact output shape.
```

Then add it to the table in `CLAUDE.md` §6.

## Connect your tools
Connectors are optional. Add email, calendar, or a task manager from Claude's settings in the
desktop app, or with `claude mcp add` in the CLI. The skills find what's connected. Anything
missing is skipped.

## Automate the morning brief
Ask your assistant: *"Run /daily-brief every weekday at 8am."* Claude Code can set up scheduled
tasks.

## Getting template updates
Your brain was personalised when you set it up, so template updates don't merge automatically.
To bring an improved skill across, copy its `SKILL.md` from the template repo into your brain and
replace any `{{…}}` placeholders by hand.
