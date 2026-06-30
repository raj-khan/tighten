# Tighten

[![npm version](https://img.shields.io/npm/v/tighten-skill.svg)](https://www.npmjs.com/package/tighten-skill)
[![npm downloads](https://img.shields.io/npm/dm/tighten-skill.svg)](https://www.npmjs.com/package/tighten-skill)
[![license](https://img.shields.io/npm/l/tighten-skill.svg)](LICENSE)

An agent skill that rewrites long or padded prose to be tight and clear: **same meaning, fewer words, every fact kept.** Works in [Claude Code](https://claude.com/claude-code), Cursor, Windsurf, Codex, Cline, GitHub Copilot, and [50+ other agents](https://github.com/vercel-labs/skills).

It is *not* a summarizer. It cuts filler, hedging, buzzwords, and empty adjectives while keeping every number, path, code block, and caveat verbatim.

![Before and after example](assets/before-after.svg)

## Install

### Any agent (via the `skills` CLI)

Installs the skill into whichever agent you target with `-a`:

```bash
npx skills add raj-khan/tighten                    # Claude Code (default)
npx skills add raj-khan/tighten -a cursor
npx skills add raj-khan/tighten -a windsurf
npx skills add raj-khan/tighten -a codex
npx skills add raj-khan/tighten -a cline
npx skills add raj-khan/tighten -a github-copilot
```

See the full [agent list](https://github.com/vercel-labs/skills) for every supported `-a` value.

### Claude Code plugin

```bash
claude plugin marketplace add raj-khan/tighten
claude plugin install tighten@tighten
```

### Claude Code slash command (npx)

Installs `/tighten` as a slash command:

```bash
npx tighten-skill            # install for your user (~/.claude/commands)
npx tighten-skill --project  # install into the current project (.claude/commands)
```

### By hand

The slash command is one Markdown file, so you can drop it in directly:

```bash
mkdir -p ~/.claude/commands
curl -o ~/.claude/commands/tighten.md \
  https://raw.githubusercontent.com/raj-khan/tighten/main/tighten.md
```

Restart your agent (in Claude Code, run `/help`) and Tighten will be available.

## Usage

```
/tighten <target> [intent]
```

- **target** : a file path, a section name, or pasted text.
- **intent** *(optional)* : how hard to cut, a target length, the audience, or what to protect.

Given a file or section, it edits in place and reports rough before/after size. Given pasted text, it returns the rewrite.

### Examples

```
/tighten README.md
/tighten the "Background" section, lightly
/tighten this paragraph, to ~120 words
/tighten our launch email, for execs, keep the pricing table
```

## What happens when you use it

You run:

```
/tighten our migration status update
```

**Before (45 words):**

> At this moment in time, we are currently in the process of working towards the
> goal of migrating the remaining 12 services over to the new v2 API, and it is
> anticipated that this effort will in all likelihood be fully completed by
> March 14.

**After (16 words):**

> We're migrating the remaining 12 services to the v2 API, expected to finish by March 14.

The facts (12 services, the v2 API, the March 14 date) survive. The padding ("At this moment in time," "currently in the process of working towards the goal of," "it is anticipated that," "in all likelihood") is gone. Claude then confirms every fact survived and reports `~64% shorter`.

## How it behaves

- **Keeps every fact.** Numbers, paths, signatures, enums, constants, error strings, decisions, caveats, code blocks, and tables stay verbatim.
- **Honors your intent.** "lightly" vs "hard", "to ~120 words", "for execs", "keep section 3". It never drops a fact just to hit a length.
- **Short, not crammed.** It splits awkward sentences instead of jamming clauses together.
- **Matches your style.** It follows the punctuation, headings, and reference style the file already uses.
- **Asks first if you mean *summarize*.** Leaving facts out is a different job; it will confirm before doing that.

## What Tighten cuts

Common padding it removes, while keeping the fact in each line intact:

| # | Pattern | Before | After |
|---|---------|--------|-------|
| 1 | Filler connectives | "In order to deploy, you must set `PORT`." | "To deploy, set `PORT`." |
| 2 | Throat-clearing | "It is important to note that the cache expires after 60s." | "The cache expires after 60s." |
| 3 | Hedging | "You might possibly want to consider raising the timeout." | "Raise the timeout." |
| 4 | Empty intensifiers | "This is a really very simple fix." | "This fix is simple." |
| 5 | Restated context | "As mentioned above, the API returns JSON." | "The API returns JSON." |
| 6 | Nominalizations | "We performed a migration of 12 tables." | "We migrated 12 tables." |
| 7 | Redundant pairs | "Each and every request is logged." | "Every request is logged." |
| 8 | Padded conditions | "In the event that the build fails, retry." | "If the build fails, retry." |
| 9 | Passive bloat | "The file is created by the installer." | "The installer creates the file." |
| 10 | Wordy verb phrases | "Make use of the `--force` flag." | "Use the `--force` flag." |

The facts (`PORT`, 60s, JSON, 12 tables, `--force`) never change. Only the words around them do.

## How Tighten is different from caveman / humanizer

[caveman](https://github.com/juliusbrussee/caveman) is an output mode: it makes the agent's own replies terser to save tokens. [humanizer](https://github.com/blader/humanizer) rewrites AI text to sound more human, stripping the "tells" and reworking tone and voice. Tighten also rewrites text, but its job is length and clarity: cut the bloat, keep every fact, and match the doc's existing style.

| | caveman | humanizer | Tighten |
|---|---|---|---|
| Category | output mode | rewrite tool | rewrite tool |
| Acts on | every reply the agent writes | existing AI-written text | a target you choose: a file, section, or pasted text |
| Goal | fewer output tokens | sound human, remove AI "tells" | shorter and clearer |
| Changes | drops articles, uses fragments | tone and voice | wording only |
| Keeps | code and error output | the facts | every fact verbatim: numbers, paths, code blocks, caveats |
| Length | shorter | about the same | shorter |

Reach for humanizer when AI text reads robotic. Reach for Tighten when it reads bloated. They compose well: humanize first, then tighten.

## Contributing

Issues and pull requests are welcome. The whole skill is `tighten.md`: edit the prompt, open a PR.

## License

[MIT](LICENSE) © raj-khan
