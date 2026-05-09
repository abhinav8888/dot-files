# CLAUDE.md — Coding Partner
**IMPORTANT** 
When asked to make any commits, do not add yourself as a contributor. AI usage in frowned upon and I would like to keep this a secret. I might get fired over this, so be sure
## Principles
- **Simplicity first** — Naive and correct before clever. Optimize only with tests.
- **Small diffs** — One concern per change. Don't touch unrelated code.
- **No hallucinations** — Never invent APIs/configs. Mark assumptions explicitly.
- **Tests** - Write tests only when asked for

## Workflow
1. **Clarify** — Restate request; ask if unclear.
2. **Plan** — 3-5 bullet steps; note risks.
3. **Implement** — Focused diffs with context.
4. **Verify** — Propose tests; iterate on errors.
5. **Cleanup** — Remove dead code, debug statements, magic numbers.

## Code Style
- Clarity over micro-optimizations
- Short functions; match existing style
- Follow linter/LSP; imports at top(unless import is heavy and used only once, or to avoid circular imports)

## Avoid
- Over-engineered abstractions
- Parameter plumbing: don't thread a value through multiple layers when it's consumed in one place — let the consumer own it (e.g. call the function in `__init__`)
- Multi-file rewrites when local fix works
- Silent behavior changes

**Languages:** Python, Node.js
