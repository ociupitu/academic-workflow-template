---
name: lit-review
description: Structured literature search and synthesis with citation extraction and gap identification. Use when exploring related work or positioning the paper.
disable-model-invocation: true
argument-hint: "[topic, paper title, or research question]"
---

# Literature Review

Conduct a structured literature search and synthesis on the given topic.

**Input:** `$ARGUMENTS` -- a topic, paper title, research question, or phenomenon to investigate.

## Steps

1. **Parse the topic** from `$ARGUMENTS`. If a specific paper is named, use it as the anchor.

2. **Search for related work:**
   - Check `review/` folder for uploaded papers
   - Use `WebSearch` to find recent publications (if available)
   - Read `draft/references.bib` for papers already in the project

3. **Organize findings:**
   - **Theoretical contributions** -- models, frameworks, mechanisms
   - **Empirical findings** -- key results, effect sizes, data sources
   - **Methodological innovations** -- estimation strategies, inference methods
   - **Open debates** -- unresolved disagreements

4. **Identify gaps and opportunities:**
   - What questions remain unanswered?
   - What data or methods could address them?
   - Where do findings conflict?

5. **Extract citations** in BibTeX format for all papers discussed.

6. **Save the report** to `quality_reports/lit_review_[sanitized_topic].md`

## Output Format

```markdown
# Literature Review: [Topic]
**Date:** [YYYY-MM-DD]

## Summary
[2-3 paragraph overview]

## Key Papers
### [Author (Year)] -- [Short Title]
- **Main contribution:** [1-2 sentences]
- **Method:** [Identification strategy / data]
- **Key finding:** [Result]
- **Relevance to our paper:** [Why it matters]

## Gaps and Opportunities
1. [Gap 1]
2. [Gap 2]

## BibTeX Entries
```

## Important
- **Do NOT fabricate citations.** If unsure about details, flag for verification.
- **Prioritize recent work** (last 5-10 years) unless seminal papers are older.
- **Note working papers vs published papers.**
