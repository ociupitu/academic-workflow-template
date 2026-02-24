---
name: research-ideation
description: Generate structured research questions, testable hypotheses, and empirical strategies from a topic or dataset.
disable-model-invocation: true
argument-hint: "[topic, phenomenon, or dataset description]"
---

<!-- TEMPLATE SETUP
     Replace [Target Journal] and [your field] with your submission venue and discipline.
     The step structure is fully generic and works as-is for most empirical research. -->

# Research Ideation

Generate structured research questions, testable hypotheses, and empirical strategies.

**Input:** `$ARGUMENTS` -- a topic, phenomenon, or dataset description.

## Steps

1. **Understand the input.** Read `$ARGUMENTS` and any referenced files. Check the knowledge base in `.claude/rules/knowledge-base.md`.

2. **Generate 3-5 research questions** ordered from descriptive to causal:
   - **Descriptive:** What are the patterns?
   - **Correlational:** What factors are associated?
   - **Causal:** What is the effect?
   - **Mechanism:** Why does the effect exist?
   - **Policy:** What are the implications?

3. **For each question, develop:**
   - **Hypothesis:** Testable prediction with expected sign/magnitude
   - **Identification strategy:** How to establish causality
   - **Data requirements:** What data is needed
   - **Key assumptions:** What must hold
   - **Potential pitfalls:** Threats to identification
   - **Related literature:** 2-3 papers

4. **Rank by feasibility and contribution.**

5. **Save** to `quality_reports/research_ideation_[sanitized_topic].md`

## Principles

- **Be creative but grounded.** Every suggestion must be empirically feasible.
- **Think like a top [Target Journal] referee.** For each causal question, immediately identify the identification challenge and whether the contribution is clearly differentiated from the existing [your field] literature.
- **Consider data availability.** A brilliant question with no available data is not actionable.
