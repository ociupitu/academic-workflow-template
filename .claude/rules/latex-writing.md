---
paths:
  - "draft/**/*.tex"
  - "draft/references.bib"
---

# LaTeX & Academic Writing Standards

## Writing Style

- **Formal but accessible**: write for a knowledgeable academic audience, not a textbook
- **Active voice preferred**: "We estimate..." not "It is estimated that..."
- **Short sentences**: break compound sentences at natural points
- **Oxford commas**: always use them
- **No contractions**: write "do not", not "don't"

## LLM Anti-Patterns (NEVER use these)

- **Em dashes as filler**: the `—` character (typed directly or as `---` in LaTeX source); use commas, semicolons, parentheses, or restructure the sentence instead. Hyphens (`-`) and en dashes (`--`, for ranges like pp.~10--15) are fine.
- **Chatty openers**: "Interestingly,", "It is worth noting that", "Notably,"
- **Hedging chains**: "arguably", "it could be said that", "to some extent"
- **Clichéd transitions**: "Furthermore,", "Moreover,", "Additionally,", "In addition,"
- **Vague quantifiers**: "many studies", "several researchers" — cite specific ones
- **Filler phrases**: "In order to" (use "To"), "Due to the fact that" (use "Because")

## LaTeX Conventions

- Citations: `\citet{}` for in-text ("Smith (2020) show..."), `\citep{}` for parenthetical ("...effect is positive \citep{Smith2020}")
- Non-breaking space before references: `Table~\ref{tab:main}`, `Figure~\ref{fig:adoption}`
- Numbers with units: `81~cities`, `\$50{,}000`
- Math mode: use `$p$-value` not `p-value` when referring to statistical quantities
- Equations: use `\begin{equation}` for numbered, `\[...\]` for unnumbered display math
- Tables: use `booktabs` package conventions (`\toprule`, `\midrule`, `\bottomrule`)

## Cross-Section Consistency

When editing ANY section:
1. Check that notation matches other sections (same variable for same concept)
2. Check that numbers are consistent (sample size, city count, time period)
3. Check that claims in the introduction match what the results show
4. Check that the conclusion doesn't overstate the findings

## Section-Specific Guidelines

### Introduction
- Start with the phenomenon, not the literature
- State the research question in the first paragraph
- Clearly state the contribution (how this differs from prior work)

### Literature Review
- Organize thematically, not chronologically
- Each paragraph should make a point, not just list papers
- End with a clear gap that your paper fills

### Model/Methodology
- Define every variable before using it in equations
- State assumptions explicitly
- Explain estimation strategy and its justification

### Results
- Lead with the main finding, then nuance
- Report economic significance alongside statistical significance
- Reference specific table columns and figure panels

### Discussion/Conclusion
- Do not introduce new results
- Acknowledge limitations honestly
- Connect findings back to the introduction's motivation
