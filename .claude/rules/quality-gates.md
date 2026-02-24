---
paths:
  - "draft/**/*.tex"
  - "code/**/*.R"
---

# Quality Gates & Scoring Rubrics

## Thresholds

- **80/100 = Commit** -- good enough to save
- **90/100 = PR** -- ready for review
- **95/100 = Excellence** -- aspirational

## LaTeX Paper Sections (.tex)

| Severity | Issue | Deduction |
|----------|-------|-----------|
| Critical | Compilation failure | -100 |
| Critical | Undefined citation | -15 |
| Critical | Wrong equation / formula error | -15 |
| Critical | Overfull hbox > 10pt | -10 |
| Major | Inconsistent notation across sections | -5 |
| Major | Claim without citation | -5 |
| Major | LLM writing patterns detected | -3 |
| Minor | Style inconsistency | -1 |
| Minor | Passive voice overuse | -1 |

## R Scripts (.R)

| Severity | Issue | Deduction |
|----------|-------|-----------|
| Critical | Syntax errors | -100 |
| Critical | Wrong specification (doesn't match paper) | -30 |
| Critical | Hardcoded absolute paths | -20 |
| Major | Missing set.seed() for stochastic code | -10 |
| Major | Missing output file generation | -5 |
| Major | No error handling for edge cases | -5 |
| Minor | Style inconsistencies | -1 |

## Enforcement

- **Score < 80:** Block commit. List blocking issues.
- **Score < 90:** Allow commit, warn. List recommendations.
- User can override with justification.
