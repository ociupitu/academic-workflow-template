# Plan-First Workflow

**For any non-trivial task, enter plan mode before writing code or editing the paper.**

## The Protocol

1. **Enter Plan Mode** — use `EnterPlanMode`
2. **Check MEMORY.md** — read any `[LEARN]` entries relevant to this task
3. **Check Current Project State** — read the table in CLAUDE.md to understand what's done/in progress
4. **Draft the plan** — what changes, which files, in what order
5. **Present to user** — wait for approval
6. **Exit plan mode** — only after approval
7. **Implement** — follow the plan, verify output

## When to Plan

- Task is high-level or vague (e.g., "improve this section", "analyze this data")
- Editing multiple sections of the paper
- Changing methodology or variable definitions
- Adding new analysis or robustness checks
- Restructuring sections
- Any task touching 3+ files

## When to Skip Planning

- Single typo fix (e.g., "fix typo in line 42")
- Minor formatting change
- Simple single-file edit the user has already specified

## Context Management

- Prefer auto-compression over `/clear`
- `/clear` only when context is genuinely polluted

## Session Recovery

After compression or new session:
1. Read `CLAUDE.md` (especially Current Project State table)
2. Check `git log --oneline -10` and `git diff`
3. State what you understand the current task to be
