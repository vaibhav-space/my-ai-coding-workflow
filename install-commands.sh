#!/usr/bin/env bash
# Installs the 3 prompts as Claude Code slash commands and copies the plan template.
#   /plan         <- prompts/planning.md
#   /review-plan  <- prompts/critical-plan-review.md
#   /review-prod  <- prompts/production-readiness-review.md
# Files go to ~/.claude. Existing files are skipped unless you pass --force,
# and --force keeps a .bak copy of whatever it replaces.
set -eu

force=0
[ "${1:-}" = "--force" ] && force=1

here=$(cd "$(dirname "$0")" && pwd)
dest="${HOME}/.claude"
tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT
mkdir -p "$dest/commands"

put() { # put <source> <target>
  if [ -e "$2" ]; then
    if cmp -s "$1" "$2"; then echo "same     $2"; return; fi
    if [ "$force" -ne 1 ]; then echo "skipped  $2 (exists, use --force to replace)"; return; fi
    cp "$2" "$2.bak"
  fi
  cp "$1" "$2"
  echo "wrote    $2"
}

for pair in planning:plan critical-plan-review:review-plan production-readiness-review:review-prod; do
  src="$here/prompts/${pair%%:*}.md"
  name=${pair##*:}
  awk '/^```markdown/{f=1;next} /^```/{f=0} f' "$src" > "$tmp/$name.md"
  [ -s "$tmp/$name.md" ] || { echo "no prompt block found in $src" >&2; exit 1; }
  put "$tmp/$name.md" "$dest/commands/$name.md"
done

put "$here/templates/plan-template.html" "$dest/plan-template.html"
echo "Done. Restart Claude Code, then type /plan"
