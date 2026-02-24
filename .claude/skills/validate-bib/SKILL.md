---
name: validate-bib
description: Validate bibliography entries against citations in all paper sections. Find missing entries and unused references.
disable-model-invocation: true
---

# Validate Bibliography

Cross-reference all citations in the paper against bibliography entries.

## Steps

1. **Read the bibliography file** (`draft/references.bib`) and extract all citation keys

2. **Scan all paper sections for citation keys:**
   - `.tex` files in `draft/sections/`: look for `\cite{`, `\citet{`, `\citep{`, `\citeauthor{`, `\citeyear{`
   - Also check `draft/main.tex` for any citations in the preamble or abstract
   - Extract all unique citation keys used

3. **Cross-reference:**
   - **Missing entries:** Citations used in paper but NOT in bibliography -- CRITICAL
   - **Unused entries:** Entries in bibliography not cited anywhere -- informational
   - **Potential typos:** Similar-but-not-matching keys (e.g., "Smith2020" vs "smith2020")

4. **Check entry quality** for each bib entry:
   - Required fields present (author, title, year, journal/booktitle)
   - Author field properly formatted
   - Year is reasonable (not future-dated, not ancient unless intentional)
   - No malformed characters or encoding issues

5. **Report findings:**
   - List of missing bibliography entries (CRITICAL)
   - List of unused entries (informational)
   - List of potential typos in citation keys
   - List of quality issues in bib entries

## Files to scan:
```
draft/sections/*.tex
draft/main.tex
```

## Bibliography location:
```
draft/references.bib
```
