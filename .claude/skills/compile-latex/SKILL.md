---
name: compile-latex
description: Compile the LaTeX research paper with latexmk. Use when compiling the draft after making changes.
disable-model-invocation: true
argument-hint: "[optional: specific .tex file, defaults to main.tex]"
---

# Compile LaTeX Paper

Compile the research paper using latexmk with full citation resolution.

## Steps

1. **Navigate to draft/ directory** and compile:

```bash
cd draft
latexmk -pdf -interaction=nonstopmode main.tex 2>&1 | tail -30
```

If `$ARGUMENTS` specifies a different file:
```bash
cd draft
latexmk -pdf -interaction=nonstopmode $ARGUMENTS 2>&1 | tail -30
```

2. **Check for warnings:**
   - Grep output for `Overfull \\hbox` warnings
   - Grep for `undefined citations` or `Label(s) may have changed`
   - Report any issues found

3. **Open the PDF** for visual verification:
   ```bash
   open draft/main.pdf
   ```

4. **Report results:**
   - Compilation success/failure
   - Number of overfull hbox warnings
   - Any undefined citations
   - PDF page count

## Why latexmk?
latexmk automatically determines how many compilation passes are needed (including bibtex/biber) and runs them all. No need to manually run 3 passes.

## Important
- Run from the `draft/` directory where `main.tex` lives
- If compilation fails, check the `.log` file for detailed error messages
- Figures and tables must exist at the paths referenced in the .tex files
