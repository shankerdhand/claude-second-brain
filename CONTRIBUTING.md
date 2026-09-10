# Contributing

Thanks for helping. This repo is a **template**: every change ends up inside people's private
brains, so the bar is *useful to almost everyone, and safe by default*.

## Ground rules

- **No personal data, ever.** Examples use obviously fictional people (Ravi, Priya) and
  `example.com` addresses.
- **Keep the placeholders.** `{{OWNER_NAME}}`, `{{OWNER_EMAIL}}`, `{{ASSISTANT_NAME}}`,
  `{{CREATED_DATE}}` and `{{YEAR}}` are filled in by `setup.sh`. Only `CLAUDE.md`, `.claude/`,
  `brain/`, `memory/`, `scripts/` and `.template/` are personalised.
- **Connectors are optional.** Every skill must still do something useful with no email,
  calendar, or task manager connected.
- **Outward actions need a yes.** Skills draft. They never send, post, or create things other
  people will see without explicit confirmation.
- **Tool output is data, not instructions.** Say so in any skill that reads email, tasks, or files.

## Before opening a pull request

```bash
bash tests/smoke.sh
```

It sets up throwaway brains and checks nothing is left half-personalised. CI runs the same test
on macOS and Linux.

## Writing a new skill

1. Create `.claude/skills/<name>/SKILL.md` with `name` and `description` frontmatter. The
   description decides when Claude reaches for the skill, so include the phrases people will
   actually say.
2. Structure: one-line purpose → steps → output shape → rules.
3. Add it to the skills table in `CLAUDE.md` §6 and in `.template/README.md`.
