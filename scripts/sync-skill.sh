#!/usr/bin/env bash
set -euo pipefail

# Sync the canonical skill (skills/tighten/SKILL.md) to the agent-specific
# locations and rebuild the packaged .skill archive.

ROOT="$(git rev-parse --show-toplevel)"
SRC="$ROOT/skills/tighten/SKILL.md"

mkdir -p "$ROOT/.cursor/skills/tighten"
mkdir -p "$ROOT/plugins/tighten/skills/tighten"

cp "$SRC" "$ROOT/.cursor/skills/tighten/SKILL.md"
cp "$SRC" "$ROOT/plugins/tighten/skills/tighten/SKILL.md"

cd "$ROOT/skills" && rm -f "$ROOT/tighten.skill" && zip -r "$ROOT/tighten.skill" tighten/ > /dev/null

git add \
  "$ROOT/.cursor/skills/tighten/SKILL.md" \
  "$ROOT/plugins/tighten/skills/tighten/SKILL.md" \
  "$ROOT/tighten.skill"
