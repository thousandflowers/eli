#!/bin/sh
# Eli SessionStart hook. Two jobs:
#   1. If the profile exists, inject it into context so Eli always has the
#      current state — no reliance on the model remembering to read the file.
#   2. On the very first run (no profile), estimate a starting level from a
#      bounded sample of recent local session transcripts, then seed the profile.
#
# ponytail: naive line-grep heuristic over the newest few transcripts, NOT
# JSON-parsed. Bounded to 5 files / 4000 lines. Upgrade to real parsing only if
# the level estimate proves unreliable.
set -e

profile="$HOME/.claude/eli-profile.md"
today=$(date +%Y-%m-%d)

if [ -f "$profile" ]; then
  printf '%s\n' "[Eli] Active profile loaded — use it, do not re-scan history."
  printf '%s\n' "----- eli-profile.md -----"
  cat "$profile"
  exit 0
fi

# ---- First run: estimate a starting level from recent transcripts ----
proj="$HOME/.claude/projects"
level="dog"; conf="low"; src="none"

files=$(ls -t "$proj"/*/*.jsonl 2>/dev/null | head -5 || true)
if [ -n "$files" ]; then
  sample=$(tail -n 4000 $files 2>/dev/null || true)
  total=$(printf '%s\n' "$sample" | wc -l | tr -d ' ')
  tech=$(printf '%s\n' "$sample" | grep -Eci 'git |npm |docker|kubectl|async|await|compile|traceback|stack trace|regex|endpoint|migration|function |const |import |\.(ts|js|go|rs|py|swift|java|sh)' || true)
  src="cc_heuristic"
  if [ "${total:-0}" -gt 0 ]; then
    ratio=$(( tech * 1000 / total ))
    if   [ "$ratio" -ge 120 ]; then level="human"; conf="high"
    elif [ "$ratio" -ge 40 ];  then level="donkey"
    else level="dog"; fi
  fi
fi

cat > "$profile" <<EOF
# Eli Profile

eli_active: true
baseline_level: $level
baseline_confidence: $conf
history_source: $src
language: auto
created: $today
last_updated: $today
first_run_greeting: pending

## Concepts
(empty — learned as you talk)

## Explanations that worked
(empty)

## Explanations that failed
(empty)
EOF

printf '%s\n' "[Eli] First run — seeded profile (level: $level, source: $src)."
printf '%s\n' "[Eli] first_run_greeting is pending: greet the user once, in plain language, in their language, then have eli-memory set it to done."
exit 0
