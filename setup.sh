#!/usr/bin/env bash
# setup.sh — personalise this second brain for its owner.
set -euo pipefail

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEMPLATE_REPO="shankerdhand/claude-second-brain"

usage() {
  cat <<'USAGE'
Set up your second brain.

  ./setup.sh                                      asks for everything
  ./setup.sh --owner "Full Name" --email you@example.com [--assistant Mona]
  ./setup.sh --into <folder> --owner … --email …  set up a copy; leave this folder untouched

Options
  --owner       your full name
  --email       your main email (only the email-summary skill uses it)
  --assistant   what to call your assistant (default: Mona)
  --into        copy the template to <folder> and set that up instead
USAGE
}

die() { echo "setup: $*" >&2; exit 1; }

OWNER=""; EMAIL=""; ASSISTANT=""; INTO=""
while [ $# -gt 0 ]; do
  case "$1" in
    --owner)     OWNER="${2:?--owner needs a value}"; shift 2 ;;
    --email)     EMAIL="${2:?--email needs a value}"; shift 2 ;;
    --assistant) ASSISTANT="${2:?--assistant needs a value}"; shift 2 ;;
    --into)      INTO="${2:?--into needs a folder}"; shift 2 ;;
    -h|--help)   usage; exit 0 ;;
    *)           usage >&2; die "unknown argument: $1" ;;
  esac
done

grep -q "SETUP-REQUIRED" "$HERE/CLAUDE.md" 2>/dev/null \
  || die "this folder is already set up (CLAUDE.md has no SETUP-REQUIRED notice)."

interactive=false; [ -t 0 ] && interactive=true

ask() {  # ask <prompt> [default]
  local reply
  if [ -n "${2:-}" ]; then read -r -p "$1 [$2]: " reply; echo "${reply:-$2}"
  else read -r -p "$1: " reply; echo "$reply"; fi
}

if $interactive; then
  [ -n "$OWNER" ]     || OWNER="$(ask "Your full name")"
  [ -n "$EMAIL" ]     || EMAIL="$(ask "Your main email")"
  [ -n "$ASSISTANT" ] || ASSISTANT="$(ask "What should your assistant be called?" "Mona")"
fi
ASSISTANT="${ASSISTANT:-Mona}"

[ -n "$OWNER" ] || { usage >&2; die "--owner is required"; }
[ -n "$EMAIL" ] || { usage >&2; die "--email is required"; }
case "$EMAIL" in *@*.*) ;; *) die "that doesn't look like an email address: $EMAIL" ;; esac
case "$OWNER$EMAIL$ASSISTANT" in *$'\n'*) die "values can't contain line breaks" ;; esac

# --- Where to set up -------------------------------------------------------
if [ -n "$INTO" ]; then
  if [ -e "$INTO" ] && [ -n "$(ls -A "$INTO" 2>/dev/null)" ]; then
    die "$INTO already exists and isn't empty"
  fi
  mkdir -p "$INTO"
  TARGET="$(cd "$INTO" && pwd)"
  case "$TARGET/" in "$HERE"/*) die "--into must be outside this folder" ;; esac
  (cd "$HERE" && tar --exclude=.git --exclude=private --exclude=.DS_Store -cf - .) \
    | (cd "$TARGET" && tar -xf -)
else
  TARGET="$HERE"
  if $interactive; then
    read -r -p "Set up this folder for $OWNER, with an assistant called $ASSISTANT? [Y/n]: " ok
    case "$ok" in n|N|no|No|NO) die "cancelled" ;; esac
  fi
fi
cd "$TARGET"

# --- Fill placeholders -----------------------------------------------------
TODAY="$(date +%F)"; YEAR="$(date +%Y)"
export OWNER EMAIL ASSISTANT TODAY YEAR
find CLAUDE.md .claude brain memory scripts .template -type f ! -name .DS_Store -exec perl -pi -e '
  s/\{\{OWNER_NAME\}\}/$ENV{OWNER}/g;
  s/\{\{OWNER_EMAIL\}\}/$ENV{EMAIL}/g;
  s/\{\{ASSISTANT_NAME\}\}/$ENV{ASSISTANT}/g;
  s/\{\{CREATED_DATE\}\}/$ENV{TODAY}/g;
  s/\{\{YEAR\}\}/$ENV{YEAR}/g;
' {} +

perl -0pi -e 's/<!-- SETUP-REQUIRED:START -->.*?<!-- SETUP-REQUIRED:END -->\n\n?//s' CLAUDE.md

# The brain gets its own README; template-only files go.
mv .template/README.md README.md && rmdir .template
rm -rf .github tests CONTRIBUTING.md
mkdir -p private inbox
chmod +x scripts/brain

left="$(grep -rl '{{' CLAUDE.md README.md .claude brain memory scripts 2>/dev/null || true)"
[ -z "$left" ] || { echo "setup: warning — placeholders left in:" >&2; echo "$left" >&2; }

# --- Keep a personal brain away from the public template --------------------
if [ -z "$INTO" ] && git rev-parse --git-dir >/dev/null 2>&1; then
  url="$(git remote get-url origin 2>/dev/null || true)"
  case "$url" in
    "") ;;
    *"$TEMPLATE_REPO"*)
      git remote rename origin template
      echo "Renamed git remote 'origin' → 'template', so your personal brain can't be pushed to the public template." ;;
    *)
      echo
      echo "⚠️  This folder's git remote is: $url"
      echo "    Your brain will hold personal information. Make sure that repository is PRIVATE." ;;
  esac
fi

scripts/brain log "Brain set up for $OWNER; assistant named $ASSISTANT." >/dev/null

cat <<DONE

✓ $ASSISTANT is ready for $OWNER.
  Folder: $TARGET

Next:
  1. Open this folder in Claude Code  (terminal: cd "$TARGET" && claude)
  2. Type /onboard-brain — $ASSISTANT will interview you and fill in the brain.

Keep this folder private. If you back it up with git, push only to a PRIVATE repository.
DONE
