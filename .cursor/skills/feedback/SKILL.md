---
name: feedback
description: Create a detailed, constructive peer review of a draft.
---
# Create a detailed peer review of a draft

## Task
Use this skill whenever the user asks for feedback on a draft. Act as a rigorous peer reviewer. Evaluate the draft systematically and produce a structured feedback document that explicitly identifies strengths and weaknesses, including gaps, limitations, and unsupported claims, and provides constructive suggestions for improvement.

## Feedback Categories

1. **Contribution**
    - Apply the "so what?" test: Why should the field care about this finding?
    - Verify that stated findings support the contribution claim. 
    - Flag where interpretation overreaches the evidence.

2. **Method**
   - Verify whether the methods are appropriate given the research question
   - Assess clarity and completeness of the methodological description.
   - Point out any methodological weaknesses, ambiguities, implicit assumptions, or missing details.
   - Check whether results and conclusions logically follow from the methods and data.

3. **Theory**
   - Verify the literature supports the paper's research questionn and positioning.
   - Evaluate whether theoretical arguments are explained clearly and concretely.
   - Check if the causal mechanisms is explicit in arguments related to the research question. 
   - Propose counterexamples or boundary conditions where the theory would not hold.

4. **Coherence**
   - Verify that the research question is clearly stated and consistently addressed.
   - Check alignment across sections: contribution ↔ theory ↔ methods ↔ results ↔ conclusions.
   - Flag logical gaps, circular reasoning, or unsupported inferential leaps.

5. **Language & Clarity**
   - Identify jargon or concepts that require further explanation.
   - Highlight unclear, awkward, or overly dense passages.
   - Check for consistency in terminology and tone.

6. **Errors & Typos**
   - Correct grammar, spelling, and punctuation.
   - Flag formatting inconsistencies (headings, references, numbering).

## Output
- Write the feedback document to `docs/feedback/YYYY-MM-DD-<topic>.md`.
- Begin with a high-level overview summarizing strengths and weaknesses for each feedback category.
- Follow with section-by-section feedback, addressing relevant categories for each section.

## Guidelines
- Use bullet points for clarity.
- When referencing the draft, cite locations using `(Line X)` or `(Lines X–Y)`.
- For cross-section issues, reference both locations (e.g., *Introduction (Line 20) vs. Methods (Line 105)*).
