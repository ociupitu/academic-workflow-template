---
name: devils-advocate
description: Challenge the paper's arguments, methodology, and framing with 5-7 specific critical questions. Identifies weaknesses before reviewers do.
disable-model-invocation: true
argument-hint: "[section name, or 'full paper']"
---

<!-- TEMPLATE SETUP
     Replace [Target Journal] with your submission venue throughout this file.
     The challenge category examples are intentionally generic — replace the quoted
     example questions with ones that reflect your paper's actual methodology and setting. -->

# Devil's Advocate Review

Critically examine the paper and challenge its arguments with 5-7 specific questions a tough [Target Journal] referee would ask.

## Setup

1. **Read the target** -- either a specific section or the full paper
2. **Read the knowledge base** in `.claude/rules/knowledge-base.md`
3. **Read MEMORY.md** for known methodological decisions and their rationale

## Challenge Categories

Generate 5-7 challenges from these categories:

### 1. Identification Challenges
> "What if [key independent variable] is endogenous to [outcome]?"

### 2. Alternative Explanation Challenges
> "Could this result be driven by [alternative mechanism] rather than [proposed mechanism]?"

### 3. External Validity Challenges
> "Does this generalize beyond [your specific context / sample] to [broader population or setting]?"

### 4. Measurement Challenges
> "Is [your measure of X] the right way to capture [underlying construct] for [your population]?"

### 5. Specification Challenges
> "What happens with a different [lag structure / functional form / sample restriction / control set]?"

### 6. Literature Positioning Challenges
> "How is this different from [specific paper] that studies similar dynamics?"

### 7. Economic Significance Challenges
> "The coefficient is statistically significant, but is the effect economically meaningful?"

## Output Format

```markdown
# Devil's Advocate: [Section or Full Paper]

## Challenges

### Challenge 1: [Category] -- [Short title]
**Question:** [The specific critical question]
**Why it matters:** [What a referee would worry about]
**Suggested response:** [How to address this in the paper]
**Section affected:** [Which section(s)]
**Severity:** [High / Medium / Low]

[Repeat for 5-7 challenges]

## Summary Verdict
**Strengths:** [2-3 things done well]
**Critical changes:** [0-2 changes needed before submission]
**Suggested improvements:** [2-3 nice-to-have improvements]
```

## Principles

- **Be specific:** Reference exact claims, equations, tables
- **Be constructive:** Every challenge has a suggested response
- **Think like a hostile referee at [Target Journal]**
- **Prioritize:** Identification threats > measurement > framing
