# Orchestrator Protocol: Research Project Mode

**After a plan is approved, the orchestrator takes over autonomously.**

## The Loop

```
Plan approved → orchestrator activates
  │
  Step 1: IMPLEMENT — Execute plan steps
  │
  Step 2: VERIFY — Compile paper, run R scripts, check outputs
  │         If verification fails → fix → re-verify
  │
  Step 3: REVIEW — Run review agents (by file type)
  │         .tex files → proofreader
  │         .R files → r-reviewer
  │         Full paper → domain-reviewer (if requested)
  │
  Step 4: FIX — Apply fixes (critical → major → minor)
  │
  Step 5: RE-VERIFY — Confirm fixes are clean
  │
  Step 6: SCORE — Apply quality-gates rubric
  │
  └── Score >= threshold?
        YES → Present summary to user
        NO  → Loop back to Step 3 (max 3 rounds)
              After max rounds → present with remaining issues
```

## Limits

- **Main loop:** max 3 review-fix rounds
- **Verification retries:** max 2 attempts
- Never loop indefinitely

## "Just Do It" Mode

When user says "just do it" / "handle it":
- Skip final approval pause
- Auto-commit if score >= 80
- Still run the full verify-review-fix loop
- Still present the summary
