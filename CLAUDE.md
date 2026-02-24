# CLAUDE.MD -- [PROJECT NAME]

**Project:** [One-sentence description of what the project does or studies]
**Institution:** [University / Organization]
**Branch:** main

---

## Core Principles

- **Plan first** -- enter plan mode before non-trivial tasks
- **Verify after** -- [compile / run / render] output at the end of every task
- **Single source of truth** -- [which folder/files are authoritative, e.g. `src/`, `draft/sections/`]
- **Quality gates** -- nothing ships below 80/100
- **[LEARN] tags** -- when corrected or when a non-obvious insight is confirmed, save `[LEARN:category]` to MEMORY.md
- **Cross-file consistency** -- when editing one file, check related files for alignment

---

## Folder Structure

<!-- Update this tree to reflect the actual project layout.
     Keep comments short — one phrase per line. -->

```
project/
├── CLAUDE.md                    # This file (loaded every session)
├── README.md                    # Project overview and setup instructions
├── .claude/                     # Rules, skills, agents
│   ├── agents/                  # Specialized agents (proofreader, reviewer, etc.)
│   ├── rules/                   # Workflow and coding conventions
│   └── skills/                  # Slash command skills
├── .vscode/                     # VS Code tasks configuration
├── code/                        # R analysis scripts
│   ├── main-analysis.R          # Primary analysis
│   └── visualization.R          # Figure generation
├── data/                        # Raw and processed data
│   └── mtcars.csv
└── draft/                       # LaTeX manuscript
    ├── main.tex                 # Root document
    ├── references.bib           # Bibliography
    ├── preamble/                # packages.tex, macros.tex
    ├── sections/                # One .tex file per section
    ├── figures/                 # Generated PDF figures
    ├── tables/                  # Generated LaTeX tables
    └── aux_files/               # LaTeX build artefacts (ignored)
```

---

## Writing Style

<!-- Keep or remove based on whether this is a writing-heavy project. -->

- Formal but accessible prose; active voice preferred
- Short, clear sentences; Oxford commas
- **Avoid LLM patterns:** no em dashes (`—`, i.e., `---` in LaTeX source) as sentence fillers — use commas, semicolons, or restructure instead; no chatty openers, no hedging phrases ("It's worth noting"), no clichéd transitions ("Furthermore", "Moreover")
- [Any domain-specific style conventions, e.g. citation format, notation standards]

---

## Quality Thresholds

| Score | Gate | Meaning |
|-------|------|---------|
| 80 | Commit | Good enough to save |
| 90 | PR | Ready for review |
| 95 | Excellence | Aspirational |

---

## Skills Quick Reference

<!-- List only the skills that exist in .claude/skills/ for this project.
     Remove rows for skills you have not set up. -->

| Command | What It Does |
|---------|-------------|
| `/onboard` | Check all dependencies and environment |
| `/compile-latex` | Build PDF via latexmk |
| `/lit-review [topic]` | Literature search + synthesis |
| `/research-ideation [topic]` | Research questions + strategies |
| `/interview-me [topic]` | Interactive research interview |
| `/validate-bib` | Cross-reference citations |
| `/devils-advocate` | Challenge arguments |
| `/commit [msg]` | Stage, commit, PR, merge |

---

## Current Project State

<!-- UPDATE THIS TABLE at the end of every major editing session.
     This is the most important section for cross-session continuity.
     Add or remove rows to match the actual structure of the project. -->

| Component | File / Path | Status | Notes |
|-----------|-------------|--------|-------|
| [Module 1] | `[path/to/file]` | NOT STARTED | |
| [Module 2] | `[path/to/file]` | NOT STARTED | |
| [Module 3] | `[path/to/file]` | NOT STARTED | |

**Status values:** COMPLETE | IN PROGRESS | NEEDS UPDATE | NOT STARTED

**Active direction:** [1-2 sentences describing the current focus and immediate next step.]

**Open questions:** [List any unresolved decisions that affect the next session.]
