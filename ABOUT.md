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

## How Tighten is different from caveman / concise

Skills like [caveman](https://github.com/juliusbrussee/caveman) and [concise](https://github.com/o4f6bgpac3/concise) change how the agent *talks*: every reply comes out terser to save tokens. Tighten is not a response mode. It's a tool you point at a specific doc to rewrite it.

| | caveman / concise | Tighten |
|---|---|---|
| Acts on | the agent's own replies, all of them | a target you choose: a file, section, or pasted text |
| Goal | fewer output tokens | clearer docs, every fact kept |
| Grammar | drops articles, uses fragments | full, correct sentences (short, not crammed) |
| Facts | compresses prose freely | every number, path, code block, and caveat verbatim; not a summarizer |
| Mode | persistent for the session | invoked on demand; edits files in place and reports before/after size |

Use caveman or concise to spend fewer tokens as you work. Use Tighten when you have a doc that needs to read tight and stay accurate.
