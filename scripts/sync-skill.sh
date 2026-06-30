#!/usr/bin/env bash
set -euo pipefail

# Sync the canonical skill (skills/tighten/SKILL.md) to the agent-specific
# locations and rebuild the packaged .skill archive.

if ! command -v zip >/dev/null 2>&1; then
  echo "sync-skill.sh: 'zip' is required to build tighten.skill but was not found." >&2
  echo "  Install it (e.g. 'apt install zip', 'brew install zip') and retry." >&2
  exit 1
fi

ROOT="$(git rev-parse --show-toplevel)"
SRC="$ROOT/skills/tighten/SKILL.md"

mkdir -p "$ROOT/.cursor/skills/tighten"
mkdir -p "$ROOT/plugins/tighten/skills/tighten"

cp "$SRC" "$ROOT/.cursor/skills/tighten/SKILL.md"
cp "$SRC" "$ROOT/plugins/tighten/skills/tighten/SKILL.md"

# Build tighten.skill deterministically: stage in a temp dir with a fixed
# timestamp and use -X so the archive only changes when the skill changes.
STAGE="$(mktemp -d)"
trap 'rm -rf "$STAGE"' EXIT
mkdir -p "$STAGE/tighten"
cp "$SRC" "$STAGE/tighten/SKILL.md"
touch -d "2000-01-01T00:00:00Z" "$STAGE/tighten/SKILL.md" "$STAGE/tighten"

rm -f "$ROOT/tighten.skill"
( cd "$STAGE" && zip -X -r "$ROOT/tighten.skill" tighten/ >/dev/null )

git add \
  "$ROOT/.cursor/skills/tighten/SKILL.md" \
  "$ROOT/plugins/tighten/skills/tighten/SKILL.md" \
  "$ROOT/tighten.skill"
