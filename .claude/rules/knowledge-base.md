---
paths:
  - "draft/**/*.tex"
  - "code/**/*.R"
---

# Project Knowledge Base: [PROJECT TITLE]

<!-- PURPOSE OF THIS FILE
     Claude reads this rule automatically whenever it touches .tex or .R files.
     Use it as a living reference so Claude stays consistent across sessions.
     Fill each section in as your project matures — empty tables are fine at the start. -->

## Key Variables

<!-- List every variable that appears in both your code and your paper.
     Keeping code names and LaTeX symbols in sync here prevents inconsistencies. -->

| Variable | Symbol | Description | Source |
|----------|--------|-------------|--------|
| [outcome variable] | $y_{it}$ / `outcome` | [What it measures, unit of observation] | [Dataset / file] |
| [main regressor] | `main_var`$_t$ | [Definition, any transformations applied] | [Dataset / file] |
| [control variable] | `control_1`$_{it}$ | [Description] | [Dataset / file] |

## Notation Registry

<!-- Document every symbol used in the paper.
     The "Anti-Pattern" column prevents Claude from reverting to old or inconsistent notation. -->

| Symbol | Meaning | Section Introduced | Anti-Pattern |
|--------|---------|-------------------|-------------|
| $y_{it}$ | [Outcome for unit $i$ at time $t$] | [e.g., Model (Sec 3)] | [e.g., Don't use $n$ for this] |
| $x_{it}$ | Vector of covariates | [Section] | |
| $\alpha_i$ | Unit fixed effect | [Section] | [e.g., Don't call it "intercept"] |
| $\beta$ | Coefficient vector | [Section] | |

## Key Papers

<!-- Track every paper you cite and its role.
     Citation keys should match your references.bib exactly. -->

| Paper | Citation Key | Role in Paper |
|-------|-------------|--------------|
| [Author Year, Title] | `authorYYYYkeyword` | [How you use it, e.g., foundational theory / identification strategy] |
| [Author Year, Title] | `authorYYYYkeyword` | |

## Data Summary

<!-- A quick-reference snapshot of your dataset. -->

- **Panel structure:** [e.g., N units × T periods (YYYY–YYYY)]
- **Spatial / cross-sectional unit:** [e.g., county, firm, individual]
- **Key data files:** [list the main .csv / .rds / .dta files]
- **Notable exclusions or filters:** [e.g., dropped observations and why]

## Known Methodological Decisions

<!-- Document WHY certain choices were made so future sessions don't revisit them.
     Add a row whenever you make a non-obvious modelling or data decision. -->

| Decision | Rationale | Section |
|----------|-----------|---------|
| [e.g., log-transform outcome] | [e.g., right-skewed distribution; log(1+x) handles zeros] | [Data / Model] |
| [e.g., cluster SEs at state level] | [e.g., treatment assigned at state level] | [Model] |

## Anti-Patterns (Don't Do This)

<!-- Record mistakes or naming confusions that have come up before.
     This section is especially valuable for preventing Claude from repeating old errors. -->

| Anti-Pattern | What Happened | Correction |
|-------------|---------------|-----------|
| [e.g., using old variable name "X_lag"] | [e.g., renamed in refactor] | [Use "X_l1" consistently] |

## Code Pitfalls

<!-- Document bugs or gotchas discovered in the analysis code. -->

| Bug / Issue | Impact | Fix |
|-------------|--------|-----|
| [e.g., package drops singleton groups] | [e.g., fewer obs than expected] | [Note in table footnotes; expected behavior] |
