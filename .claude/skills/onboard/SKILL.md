---
name: onboard
description: Check that all dependencies required to run this template are installed. Verifies R, LaTeX, required packages, and runs a full smoke test of the pipeline.
disable-model-invocation: true
argument-hint: "[none required]"
---

# Onboard — Template Environment Check

Verify that your machine can run every part of this template: R scripts, figure generation, table generation, and LaTeX compilation. Run all checks, then report everything at once.

---

## Step 1: Detect OS

```bash
uname -s   # Darwin = macOS, Linux = Linux
```

On Windows, check for WSL or Git Bash:
```bash
cmd.exe /c ver 2>/dev/null || echo "Not Windows CMD"
```

The detected OS determines the installation suggestions used throughout this report.

---

## Step 2: System Tools

Check that the following CLI tools are available:

| Tool | Check command | macOS | Linux | Windows |
|------|--------------|-------|-------|---------|
| R / Rscript | `Rscript --version` | `brew install r` or r-project.org | `sudo apt install r-base` | Download from r-project.org |
| pdflatex | `pdflatex --version` | `brew install --cask mactex-no-gui` | `sudo apt install texlive-full` | Install MiKTeX from miktex.org |
| latexmk | `latexmk --version` | Included with MacTeX | `sudo apt install latexmk` | Via MiKTeX console |
| bibtex | `bibtex --version` | Included with MacTeX | Included with texlive | Included with MiKTeX |
| git | `git --version` | `brew install git` | `sudo apt install git` | Download from git-scm.com |

---

## Step 3: R Packages

Run this snippet to check all packages the template uses:

```bash
Rscript -e '
required <- c(
  "data.table",    # fast CSV reading
  "modelsummary",  # regression tables
  "ggplot2"        # figures
)
installed <- rownames(installed.packages())
missing <- setdiff(required, installed)
if (length(missing) == 0) {
  cat("All", length(required), "R packages installed.\n")
} else {
  cat("Missing:", paste(missing, collapse = ", "), "\n")
  cat("Install with: install.packages(c(\"", paste(missing, collapse = "\", \""), "\"))\n", sep = "")
}
'
```

<!-- PROJECT CUSTOMISATION
     When you replace the template's example code with your own analysis scripts,
     update the `required` vector above to match the packages your scripts use.
     Run: grep -h "^library(" code/*.R | sort -u   to get the current list. -->

---

## Step 4: LaTeX Packages

Check that the packages used in `draft/preamble/packages.tex` are available:

```bash
kpsewhich natbib.sty booktabs.sty threeparttable.sty microtype.sty \
          amsmath.sty amssymb.sty graphicx.sty hyperref.sty cleveref.sty \
          dsfont.sty pdflscape.sty subcaption.sty caption.sty \
          setspace.sty relsize.sty xcolor.sty footmisc.sty \
          tabularx.sty multirow.sty tablefootnote.sty
```

Each call should return a file path. Empty output means the package is missing.

- **macOS / Linux (TeX Live / MacTeX):** `tlmgr install <package-name>`
- **Windows (MiKTeX):** packages auto-install on first compile, or use the MiKTeX console

Also verify that the bibliography style ships with the template:

```bash
ls draft/informs2014.bst
```

This file is included in the template repository — it does **not** need a separate install.

<!-- PROJECT CUSTOMISATION
     If you switch to a different bibliography style (e.g., your target journal's .bst file),
     update the check above and update \bibliographystyle{} in draft/preamble/packages.tex. -->

---

## Step 5: Template Data Files

Verify that the sample dataset ships with the repository:

```bash
ls -lh data/mtcars.csv
```

This file is tracked in git and should always be present. If missing, run `git checkout data/mtcars.csv`.

<!-- PROJECT CUSTOMISATION
     When you replace the sample data with your own:
     1. Update this check to list your actual raw data files.
     2. Add a note here about where to obtain them (public URL, data provider, etc.)
        since raw data is typically not committed to git.
     3. If any script requires an API key or credentials, document the expected
        environment variable names here (but never the values themselves). -->

---

## Step 6: Output Directories

Check that output directories exist; create them if missing:

```bash
mkdir -p draft/figures draft/tables
ls draft/figures draft/tables
```

---

## Step 7: Smoke Test — Run the Full Pipeline

If all tools are present, execute each stage in order:

**Stage 1 — Generate tables (main-analysis.R):**
```bash
Rscript code/main-analysis.R 2>&1
```
Expected output: `draft/tables/summary-statistics.tex` and `draft/tables/main-results.tex`

**Stage 2 — Generate figures (visualization.R):**
```bash
Rscript code/visualization.R 2>&1
```
Expected output: `draft/figures/scatter_mpg_wt.pdf` and `draft/figures/scatter_mpg_hp.pdf`

**Stage 3 — Compile the PDF:**
```bash
cd draft && latexmk -pdf -interaction=nonstopmode main.tex 2>&1 | tail -20
```
Expected: exit code 0 and `draft/main.pdf` generated.

```bash
ls -lh draft/main.pdf
```

<!-- PROJECT CUSTOMISATION
     When you add new R scripts to code/, add a smoke-test stage here for each one.
     When you rename or restructure draft/, update the latexmk command accordingly. -->

---

## Output Format

Present results as a checklist:

```
## Onboard Results

### System Tools
- [x] R 4.x.x
- [x] pdflatex (TeX Live / MacTeX / MiKTeX)
- [x] latexmk
- [x] bibtex
- [x] git
- [ ] pdflatex — MISSING  →  brew install --cask mactex-no-gui

### R Packages (3 required)
- [x] 3/3 installed
- [ ] Missing: ggplot2  →  install.packages("ggplot2")

### LaTeX Packages
- [x] All found
- [ ] Missing: cleveref  →  tlmgr install cleveref

### Template Files
- [x] draft/informs2014.bst
- [x] data/mtcars.csv

### Output Directories
- [x] draft/figures/ exists
- [x] draft/tables/ exists

### Smoke Test
- [x] main-analysis.R  →  tables generated
- [x] visualization.R  →  figures generated
- [x] LaTeX compile    →  main.pdf generated (N pages)

### Summary
Ready to work: YES / NO (list any blocking issues)
```
