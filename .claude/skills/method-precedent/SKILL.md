---
name: method-precedent
description: Search for published papers that justify a specific methodological decision. Returns precedents diversified across empirical domains, with top papers read in full via PDF.
argument-hint: "[decision] or [section:5-empirical-approach] [decision] or [domain: econ] [decision] or [journal: Marketing Science, ...] [decision]"
---

# Methodological Precedent Search

Find published papers that faced the same methodological decision and show how they handled it. This is NOT a literature review -- it is a targeted search for **methodological precedents**.

**Input:** `$ARGUMENTS` -- a description of the methodological decision, optionally prefixed with:
- `[section:filename]` -- read `draft/sections/{filename}.tex` for context (e.g., `[section:5-empirical-approach]`)
- `[domain: ...]` -- constrain search domain (e.g., `[domain: economics, finance]`)
- `[journal: ...]` -- journals to search **first**, not exclusively (e.g., `[journal: Marketing Science, Journal of Marketing, Journal of Marketing Research]`). The skill prioritizes these venues, then broadens to other sources, and reports honestly if it finds nothing relevant in them.

---

## Critical Rules

1. **Scope discipline.** Answer ONLY the query asked. Use project context to enrich search terms, never to expand the question. Do not get biased by papers already cited in the manuscript -- formulate queries independently.
2. **Domain diversity.** Cap at 2-3 papers from any single empirical domain. If results cluster, add cross-domain queries.
3. **Citation integrity.** Every author name, title, year, and venue MUST come from tool output (Semantic Scholar API, Crossref, or PDF text). Never fill metadata from training data. If unverifiable, mark as `[UNVERIFIED]`.
4. **Rate limiting.** Semantic Scholar API allows 1 request/second. The MCP server now retries automatically on a 429 (it waits and retries rather than silently returning nothing), so a throttle no longer looks like "no results". Still run MCP calls sequentially, not in parallel, and lean on filters and sensible `limit`s to avoid over-fetching. If a tool returns an `Error:` string, read it -- it distinguishes a rate-limit block, a bad key, and an empty result.
5. **Preferred-journal honesty.** Only present a paper as a preferred-journal (`[journal: ...]`) match when tool output confirms its `venue`. If no paper from the requested journals is clearly on-method, say so plainly and broaden to other sources. NEVER invent or stretch a preferred-journal recommendation just to satisfy the request. Note that Semantic Scholar's venue filter is forgiving but imperfect, so "nothing in journal X" may reflect a venue-string miss rather than a true absence -- state this honestly rather than overclaiming either way.

---

## Steps

### 1. Parse input and gather context

Extract from `$ARGUMENTS`:
- **Section reference** (optional): If present, read the `.tex` file to understand the decision in context. Use this to formulate better queries, but do NOT let existing text bias which papers you find or what conclusions you draw. When the section lists specific choices (e.g., a covariate set) or contains inline `% Note:` / TODO comments, extract them verbatim so the `## Recommendation for Your Paper` section can address them by name rather than generically.
- **Domain hint** (optional): If present, use as primary domain filter.
- **Journal hint** (optional): If `[journal: ...]` is present, parse the comma-separated list into a set of preferred journals to search first in Step 3.
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

One discovery slot is now filled by the **recommendations channel** rather than another keyword query: after the first search round, seed `recommend_papers` from the best on-target hits (see Step 3). Recommendations surface structurally similar papers in OTHER empirical domains that keyword search misses, so you can lean less on hand-crafting cross-domain keyword variants.

### 3. Search and collect candidates

Run searches **sequentially** (rate limit):

- **Preferred-journal first pass (only if `[journal: ...]` was given)**: before the general searches, run 2-3 of the main queries through `search_papers` with `venue=[<preferred journals>]` (and `fields_of_study` from the domain hint). Then **print a short progress line to the reader** stating the honest outcome, e.g. "Searching Marketing Science, Journal of Marketing... found 4 on-method candidates" or "No clearly on-method papers in the requested journals; broadening to other sources." Tag every hit from this pass as a preferred-journal paper (used in the Step 4 table). Respect Rule #5: do not stretch a weak hit into a recommendation, and remember the venue filter can miss venue-string variants.
- **MCP `search_by_topic`**: Run 4-5 of the formulated queries with `limit=10` each. Use the filters to keep results on-method and credible:
  - `fields_of_study` from the domain hint or the target journal's domain (e.g. `["Economics", "Business"]`).
  - `min_citation_count` to skip noise when a query returns many low-signal hits.
  - `year_start` / `year_end` when the decision is tied to a method era.
- **Recommendations pass (`recommend_papers`)**: after the first search round, pick the 2-3 most on-target hits and pass their `paperId`s as `positive_paper_ids`. Optionally pass clearly off-target papers as `negative_paper_ids` to steer away from them. This is the main cross-domain discovery step.
- **WebSearch**: Run 2-3 queries targeting Google Scholar, SSRN, NBER working papers.

Collect all unique results. From MCP results, retain: `paperId`, title, authors, year, DOI, venue, abstract, TLDR, `citationCount`, `fieldsOfStudy`, `isOpenAccess`, `openAccessPdf` URL. The `paperId` is required to seed recommendations and to batch-fetch details in Step 5. If `[journal: ...]` was given, also flag any result from the **general** searches whose `venue` matches a preferred journal (case-insensitive substring) -- this catches preferred-journal papers the venue filter missed.

### 4. Filter to top candidates

From the collected results (typically 20-40 papers):

1. **Relevance**: Does the abstract/TLDR indicate the paper actually addresses this methodological decision (not just uses the method incidentally)?
2. **Diversity check**: Count papers per empirical domain. If >3 from one domain, keep only the 2-3 most relevant. If ALL results come from one domain, go back to Step 3 with cross-domain queries.
3. **Select up to 5 for deep reading** (Tier 1). Prioritize: (a) open access, (b) target journal domain, (c) discusses the decision explicitly, (d) top venues or high citation count.
4. **Remaining relevant papers** become Tier 2 (abstract-only reporting).

Then **present a candidate table in your chat response to the user** (this lives in the chat, not in the saved report) so no plausibly-relevant paper is silently dropped. Include every plausibly-relevant candidate, sorted by relevance, with these columns:

| Authors | Title | Journal | Relevance | Download? |
|---------|-------|---------|-----------|-----------|

- **Relevance**: your estimate from 10 (best) to 1 (worst), based on the abstract/TLDR -- label it as an abstract-based estimate, since you have not read the full text yet.
- **Download?**: `Yes` for the up-to-5 Tier-1 papers you will read in full, `No` otherwise.
- Add a **Preferred?** column (Yes/No) **only when `[journal: ...]` was given**, marking preferred-journal hits.

The table is informational and lets the reader redirect before downloads begin; proceed to Step 5 after presenting it.

### 5. Acquire and read Tier 1 PDFs

First, fetch full details for all selected papers (Tier 1 and Tier 2) in **one** request with `get_papers_batch`, passing their `paperId`s. Do not loop `fetch_paper_details` per paper -- the batch call returns up to 500 papers at once and adds fields the search may have omitted (e.g. TLDR). Use `fetch_paper_details` only for a one-off lookup.

Then acquire the up-to-5 Tier-1 PDFs. **Check the `literature/` folder first** -- it may already hold a paper as `{AuthorYear}.pdf` (from a previous run or supplied by the researcher). If a matching file exists, use it and skip downloading.

For each Tier-1 paper not already in `literature/`, try to obtain the PDF, attempting **each source at most once -- never retry the same source in a loop**:
1. The `openAccessPdf` URL from the API.
2. If that fails, Playwright: navigate to `https://www.semanticscholar.org/paper/{paperId}`, snapshot, extract a PDF link.
3. If still nothing, one WebSearch for an open-access version.

Download with `curl -sL -o literature/{AuthorYear}.pdf "{pdf_url}"`.

**If any Tier-1 paper still has no PDF, STOP and hand off to the researcher** (they often have institutional access you lack). End your turn with:
- the list of missing papers (title, authors, year, and a DOI/link),
- a request to download each via institutional access and drop it into `literature/` as `{AuthorYear}.pdf`,
- an instruction to reply "continue" when done (or to say which papers to skip).

Do **not** finalize the report yet. When the researcher replies "continue", re-scan `literature/`, use the newly added PDFs, and resume. For any paper the researcher chooses to skip, demote it to Tier 2 and record it in the Caveats.

**Read** each acquired PDF with the `Read` tool, using the `pages` parameter to target the methodology/empirical-strategy sections (typically pages 5-15 of a 30-40 page paper; check the table of contents on pages 1-2 first). Extract:
- The exact methodological decision the paper made
- Their justification (quote directly when possible)
- Alternatives they discussed and rejected

### 6. Compile and save report

Save to `quality_reports/method_precedent_[sanitized_topic].md`. Lead the report with the `## Recommendation for Your Paper` section (a direct, decision-specific verdict); the literature synthesis follows as its evidence.

---

## Report Format

```
# Methodological Precedent Search: [Decision]
**Date:** YYYY-MM-DD
**Query:** [User's original question]
**Target domain:** [Detected or specified]
**Domains represented:** [List across all results]

## Recommendation for Your Paper
[Lead with the verdict, addressed directly to THIS paper -- not a restatement of literature consensus. Phrase it as a recommendation: "In your setting, retain ...; justify ... by citing ...; consider dropping/adding ...". Name the specific choices at issue (e.g., the actual covariates the section lists, by name) and give each a keep / justify / drop / add verdict tied to a named, tool-verified precedent `Author (Year)`. Resolve any open question the section context raised (e.g., an inline `% Note:` / TODO in the `.tex`). Cite only tool-verified papers. Keep it tight -- a short paragraph or compact list, not a full audit table. The literature synthesis that follows is the evidence behind this verdict.]

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
