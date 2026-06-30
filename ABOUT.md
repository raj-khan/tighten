# Why I built Tighten

Ask Claude or any AI agent to write docs and you get marketing copy: em-dashes (—), buzzwords, bloated paragraphs. Every time, I want to clean it up before I even start reviewing.

So this morning I kept asking the agent to redo docs, until it clicked: make it a skill I can invoke anytime. I built two, one with my own context, one generic that anyone can invoke with their own context and name.

## Usage

```
tighten <context-file>
```

It's a Claude Code plugin skill:

https://github.com/raj-khan/tighten

```
claude plugin marketplace add raj-khan/tighten
claude plugin install tighten@tighten
```

It also works in other coding agents, Cursor, Codex, Cline, Windsurf, GitHub Copilot, and 50+ more:

```
npx skills add raj-khan/tighten -a cursor
npx skills add raj-khan/tighten -a codex
npx skills add raj-khan/tighten -a windsurf
```

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
