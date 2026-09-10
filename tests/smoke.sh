#!/usr/bin/env bash
# Smoke test: set up throwaway brains from this template and check the result.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
WORK="$(mktemp -d)"; trap 'rm -rf "$WORK"' EXIT
fail() { echo "FAIL: $*" >&2; exit 1; }
pass() { echo "ok   $*"; }

check_brain() {  # check_brain <dir> <owner> <assistant>
  local d="$1"
  ! grep -rn '{{' "$d/CLAUDE.md" "$d/README.md" "$d/.claude" "$d/brain" "$d/memory" "$d/scripts" \
    || fail "placeholders left in $d"
  ! grep -q SETUP-REQUIRED "$d/CLAUDE.md" || fail "setup notice still in CLAUDE.md"
  grep -qF "$2" "$d/CLAUDE.md"            || fail "owner name missing from CLAUDE.md"
  grep -qF "# $3 — Operating Manual" "$d/CLAUDE.md" || fail "assistant name missing from CLAUDE.md"
  grep -qF "# $3 — my second brain" "$d/README.md"  || fail "brain README not installed"
  [ ! -e "$d/.github" ] && [ ! -e "$d/tests" ] && [ ! -e "$d/.template" ] \
    || fail "template-only files left behind in $d"
  python3 -m json.tool "$d/.claude/settings.json" >/dev/null || fail "settings.json is invalid"
  "$d/scripts/brain" stats >/dev/null     || fail "scripts/brain stats failed"
  ls "$d"/memory/log/2*.md >/dev/null 2>&1 || fail "no log entry written"
}

# 1. --into a path with spaces, owner with an apostrophe
"$ROOT/setup.sh" --into "$WORK/brain one" --owner "Priya O'Neil" --email priya@example.com \
  --assistant Jarvis </dev/null >/dev/null
check_brain "$WORK/brain one" "Priya O'Neil" Jarvis
pass "--into works with spaces and apostrophes"
grep -q SETUP-REQUIRED "$ROOT/CLAUDE.md" || fail "--into modified the template itself"
pass "template left untouched"

# 2. In place, non-ASCII name, default assistant name
cp -R "$ROOT" "$WORK/inplace"; rm -rf "$WORK/inplace/.git"
"$WORK/inplace/setup.sh" --owner "Ana María" --email ana@example.com </dev/null >/dev/null
check_brain "$WORK/inplace" "Ana María" Mona
pass "in-place setup with default assistant name"

# 3. Guard rails
! "$WORK/inplace/setup.sh" --owner X --email x@example.com </dev/null >/dev/null 2>&1 \
  || fail "setup ran twice"
pass "refuses to run twice"
! "$ROOT/setup.sh" --into "$WORK/brain one" --owner X --email x@example.com </dev/null >/dev/null 2>&1 \
  || fail "overwrote a non-empty folder"
pass "refuses a non-empty --into folder"
! "$ROOT/setup.sh" --into "$WORK/bad" --owner X --email not-an-email </dev/null >/dev/null 2>&1 \
  || fail "accepted a bad email"
pass "rejects a bad email"

# 4. A clone of the public template gets its remote detached
slug="$(sed -n 's/^TEMPLATE_REPO="\(.*\)"$/\1/p' "$ROOT/setup.sh")"
cp -R "$ROOT" "$WORK/clone"; rm -rf "$WORK/clone/.git"
git -C "$WORK/clone" init -q
git -C "$WORK/clone" remote add origin "https://github.com/$slug.git"
"$WORK/clone/setup.sh" --owner T --email t@example.com </dev/null >/dev/null
git -C "$WORK/clone" remote | grep -qx template && ! git -C "$WORK/clone" remote | grep -qx origin \
  || fail "public template remote was not detached"
pass "detaches the public template remote"

# 5. Template hygiene
! grep -rnE "/Users/[A-Za-z]|/home/[A-Za-z]" "$ROOT" --exclude-dir=.git --exclude=smoke.sh \
  || fail "absolute home-directory paths in the template"
pass "no absolute home paths"

echo "all smoke tests passed"
