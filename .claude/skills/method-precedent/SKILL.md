---
name: method-precedent
description: Search for published papers that justify a specific methodological decision. Returns precedents diversified across empirical domains, with top papers read in full via PDF.
argument-hint: "[decision] or [section:5-empirical-approach] [decision] or [domain: econ] [decision]"
---

# Methodological Precedent Search

Find published papers that faced the same methodological decision and show how they handled it. This is NOT a literature review -- it is a targeted search for **methodological precedents**.

**Input:** `$ARGUMENTS` -- a description of the methodological decision, optionally prefixed with:
- `[section:filename]` -- read `draft/sections/{filename}.tex` for context (e.g., `[section:5-empirical-approach]`)
- `[domain: ...]` -- constrain search domain (e.g., `[domain: economics, finance]`)

---

## Critical Rules

1. **Scope discipline.** Answer ONLY the query asked. Use project context to enrich search terms, never to expand the question. Do not get biased by papers already cited in the manuscript -- formulate queries independently.
2. **Domain diversity.** Cap at 2-3 papers from any single empirical domain. If results cluster, add cross-domain queries.
3. **Citation integrity.** Every author name, title, year, and venue MUST come from tool output (Semantic Scholar API, Crossref, or PDF text). Never fill metadata from training data. If unverifiable, mark as `[UNVERIFIED]`.
4. **Rate limiting.** Semantic Scholar API allows 1 request/second. Do not fire MCP search calls in parallel -- run them sequentially.

---

## Steps

### 1. Parse input and gather context

Extract from `$ARGUMENTS`:
- **Section reference** (optional): If present, read the `.tex` file to understand the decision in context. Use this to formulate better queries, but do NOT let existing text bias which papers you find or what conclusions you draw.
- **Domain hint** (optional): If present, use as primary domain filter.
- **The decision**: What specific methodological choice needs justification?

Then:
- Read `CLAUDE.md` to identify the target journal and domain (if no explicit domain hint).
- `Grep` through `draft/references.bib` for papers already cited that address this method. Note them but do not let them anchor the search.

### 2. Formulate search queries

Generate **5-7 queries** with built-in diversity:

| Slot | Purpose |
|------|---------|
| 1-2 | Direct methodological query using user's terms |
| 3 | Same method + target journal domain terms |
| 4-5 | Same method + DIFFERENT empirical contexts |
| 6-7 | Surveys, handbook chapters, or review articles on this method |

### 3. Search and collect candidates

Run searches **sequentially** (rate limit):

- **MCP `search_by_topic`**: Run 4-5 of the formulated queries with `limit=10` each.
- **WebSearch**: Run 2-3 queries targeting Google Scholar, SSRN, NBER working papers.

Collect all unique results. From MCP results, retain: title, authors, year, DOI, venue, abstract, TLDR, `isOpenAccess`, `openAccessPdf` URL, `paperId`.

### 4. Filter to top candidates

From the collected results (typically 20-40 papers):

1. **Relevance**: Does the abstract/TLDR indicate the paper actually addresses this methodological decision (not just uses the method incidentally)?
2. **Diversity check**: Count papers per empirical domain. If >3 from one domain, keep only the 2-3 most relevant. If ALL results come from one domain, go back to Step 3 with cross-domain queries.
3. **Select up to 5 for deep reading** (Tier 1). Prioritize: (a) open access, (b) target journal domain, (c) discusses the decision explicitly, (d) top venues or high citation count.
4. **Remaining relevant papers** become Tier 2 (abstract-only reporting).

### 5. Download and read Tier 1 PDFs

For each Tier 1 paper:

1. **Get PDF URL**: Check if `openAccessPdf` URL exists from the API. If not, use Playwright to navigate to `https://www.semanticscholar.org/paper/{paperId}`, take a snapshot, and extract the PDF link. If still not found, try WebSearch for an open-access version.
2. **Download**: `curl -sL -o literature/{AuthorYear}.pdf "{pdf_url}"`
3. **Read**: Use the `Read` tool with `pages` parameter targeting the methodology/empirical strategy sections (typically pages 5-15 for a 30-40 page paper; check table of contents on page 1-2 first). Extract:
   - The exact methodological decision the paper made
   - Their justification (quote directly when possible)
   - Alternatives they discussed and rejected

If PDF download fails (paywall, broken link), demote to Tier 2.

### 6. Compile and save report

Save to `quality_reports/method_precedent_[sanitized_topic].md`.

---

## Report Format

```
# Methodological Precedent Search: [Decision]
**Date:** YYYY-MM-DD
**Query:** [User's original question]
**Target domain:** [Detected or specified]
**Domains represented:** [List across all results]

## Summary
[2-3 sentences: consensus approach, key variations, cross-domain patterns]

## Tier 1: Full-Text Analysis

### 1. Author (Year) -- Short Title
- **APA citation:** [From tool-verified metadata only]
- **Domain:** [Empirical domain]
- **Their decision:** [What they chose]
- **Their justification:** [Why -- quote where possible]
- **Relevance to our decision:** [How it informs what we should do]

## Tier 2: Abstract-Only (Verify Manually)

### 6. Author (Year) -- Short Title
- **APA citation:** [From tool-verified metadata only]
- **Domain / Venue:** [Field and journal]
- **Brief note:** [What the abstract suggests about their approach]
- **Status:** [No open-access PDF / paywall / etc.]

## Consensus & Variations
- **Most common approach:** [What most papers do]
- **Notable alternatives:** [Different paths and why]
- **Cross-domain pattern:** [Consistent across fields or domain-specific?]

## BibTeX Entries
[Verified papers only]

## Caveats
[Papers that could not be accessed; search limitations]
```
