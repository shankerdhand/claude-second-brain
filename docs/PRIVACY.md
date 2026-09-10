# Privacy & safety

**The template is public. Your brain is not.** The moment you run setup, the folder starts
collecting personal information about you, your family, and your work.

## Keep your brain private
- **Don't fork this repo for your own brain.** GitHub forks of public repositories are public.
- Use **Use this template → Private**, or clone and run `./setup.sh`. Setup renames a clone's
  `origin` remote to `template`, so `git push` can't send your brain here by accident.
- If you back up with git, push only to a **private** repository.
- `private/` and `inbox/` are gitignored and never leave your machine through git.

## What never goes in the brain
Passwords, OTPs, card numbers, CVVs, bank account numbers, national ID numbers (SSN, Aadhaar,
PAN, passport…), API keys, private keys, recovery codes. Record *where* a credential lives, never
the credential itself. The assistant is instructed to refuse these and tell you why.

## What leaves your machine
- Your brain's files stay on your computer (and in your private repo, if you use one).
- When Claude reads a file or a connector (email, calendar, tasks) to answer you, that content is
  sent to Anthropic as part of the conversation. Your Claude plan's terms cover how it's handled.
- Connectors are read only when a skill needs them.

## Guard rails, and their limits
- `CLAUDE.md` tells the assistant to show you every outward action first: sending email,
  replying, inviting people, creating shared tasks. It waits for a clear yes.
- `.claude/settings.json` asks before `rm` and `git push`.
- These are instructions and permission prompts, not a sandbox. Read what you approve.
- Emails, documents, and tasks are treated as data, not commands. If one contains instructions,
  the assistant quotes them to you instead of acting on them.
