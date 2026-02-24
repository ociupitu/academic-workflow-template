---
name: commit
description: Stage and commit changes, grouped into logical commits (e.g. writing vs. code). Optionally push with the "push" flag.
disable-model-invocation: true
argument-hint: "[push] [optional: commit message override]"
---

# Commit (and optionally Push)

Inspect all unstaged changes, group them into logical commits, and commit. Push only if `push` is explicitly passed.

## Usage

- `/commit` — Auto-detect changes, group into commits, commit only
- `/commit push` — Same, then push to main
- `/commit "your message"` — Custom message, single commit, no push
- `/commit push "your message"` — Custom message, single commit, then push

## Steps

1. **Check current state:**

```bash
git status
git diff --stat
git log --oneline -5
```

2. **Parse `$ARGUMENTS`:**
- If it contains the word `push`, set a flag to push at the end (strip `push` from the message)
- If remaining text is non-empty, treat it as a custom message (single commit, all changes)

3. **Categorize changes** into logical groups. Typical groups for this project:

| Group | Files | Prefix |
|-------|-------|--------|
| Writing | `draft/`, `review/` | `draft:` |
| Code | `code/` | `code:` |
| Data | `data/` | `data:` |
| Config / meta | `CLAUDE.md`, `MEMORY.md`, `.claude/`, `quality_reports/` | `chore:` |

If all changes fall into one group, make a single commit.
If changes span multiple groups, make one commit per group.

4. **Update CLAUDE.md** — if any `draft/sections/*.tex` files are among the changes, update the Current Project State table now to reflect the new status of those sections. This must happen before staging so the update is included in the commit.

5. **Stage and commit each group** — repeat for each group:

```bash
git add <file1> <file2> ...   # never git add -A
git commit -m "<prefix>: <short, descriptive message>"
```

Do NOT stage: `.rds`, `.rda`, binary data files, or files containing secrets.
Write messages that explain *why*, not just *what*.

6. **Report commits** — always print after all commits are created:

```
Commits created:
  [<short-hash>] <prefix>: <message>
  [<short-hash>] <prefix>: <message>
  ...
```

```bash
git log --oneline -<n>   # where n = number of commits just created
```

7. **Push — only if the `push` flag was set in step 2:**

```bash
git push origin main
```

Confirm with a single line (e.g. `Pushed to origin/main`) — do NOT reprint the commit list.
If not pushing, remind the user: "Run `/commit push` to push when ready."

8. **CLAUDE.md summary** — if CLAUDE.md was updated in step 4, print a brief plain-English summary of what changed (which sections, old status → new status).

## Rules

- Never create branches or PRs
- Never push unless `push` is explicitly in `$ARGUMENTS`
- Never use `git add -A` or `git add .`
- Exclude data files and sensitive files
- Commit messages: short, lowercase after prefix, no period at end
