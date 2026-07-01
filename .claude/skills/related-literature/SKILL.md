---
name: related-literature
description: Build the "Related Literature" section by mapping each literature stream and drafting its contribution paragraph, using Semantic Scholar. Proposes the streams with you first, then searches per stream and reads 1-2 anchor papers in full.
disable-model-invocation: true
argument-hint: "[streams: A; B; C] [domain: marketing, economics] [journal: Marketing Science, ...] [section:2-related-literature] free-text guidance"
---

# Related-Literature Builder

Populate the paper's "Related Literature" section. For each literature **stream** (angle), find the related work, then draft a "how we contribute to this stream" paragraph. The section is organized as thematic blocks that each follow a **review prior work -> state our contribution** pattern, and this skill produces exactly that, one block at a time.

This is NOT `method-precedent` (which justifies a single methodological decision) and NOT the generic `lit-review` (which synthesizes one topic). It is **multi-stream**, it **agrees the streams with you before searching**, and it **verifies and folds in the citations you already have** rather than ignoring them.

**Input:** `$ARGUMENTS` -- guidance on the streams to cover, optionally with the prefixes below.

---

## Critical Rules

1. **Confirmation gate is mandatory.** Never run a single search before the user has approved the stream map (Step 2). The whole point of this skill is to agree the angles and the per-stream contribution framing first.
2. **Citation integrity.** Every author name, title, year, and venue MUST come from tool output (Semantic Scholar API, Crossref, or PDF text). Never fill metadata from training data. If unverifiable, mark as `[UNVERIFIED]`.
3. **Verify, do not ignore, existing cites.** Unlike `method-precedent`, this skill DOES use the papers already in the section. Confirm each preliminary `\citep`/`\citet` key and each `[TODO-cite]` item against the API, correct the metadata and BibTeX key, and report which ones checked out and which did not. Then find additional work around them.
4. **Per-stream selection (not domain capping).** Within a stream, favor the canonical, high-citation anchors plus recent work. The goal is faithful coverage of that stream, so do NOT apply `method-precedent`'s "cap 2-3 per domain" rule here. Cross-stream, keep the streams distinct so the same paper is not the headline of two blocks.
5. **Rate limiting.** Semantic Scholar allows 1 request/second. The MCP server retries automatically on a 429 (it waits and retries rather than returning nothing), so a throttle no longer looks like "no results". Still run MCP calls **sequentially**, not in parallel, and lean on filters and sensible `limit`s. If a tool returns an `Error:` string, read it -- it distinguishes a rate-limit block, a bad key, and an empty result.
6. **Preferred-journal honesty.** Only present a paper as a `[journal: ...]` match when tool output confirms its `venue`. If nothing on-stream comes from the requested journals, say so plainly and broaden. The venue filter is forgiving but imperfect, so "nothing in journal X" may be a venue-string miss rather than a true absence -- state this honestly rather than overclaiming either way.

---

## Input prefixes

Parse `$ARGUMENTS` for these optional prefixes (lists are semicolon- or comma-separated):

- `[streams: A; B; C]` -- explicit angle list supplied up front. If absent, derive candidate streams from the paper (Step 1).
- `[domain: ...]` -- `fields_of_study` for the MCP filters (e.g. `[domain: economics, business]`). Default: the target journal's domain from `CLAUDE.md`.
- `[journal: ...]` -- venues to search **first**, not exclusively (e.g. `[journal: Marketing Science, Journal of Marketing]`). Same honesty rules as Rule #6.
- `[section:filename]` -- the section to read for context. Default `2-related-literature`. Resolves to `draft/sections/{filename}.tex`.
- Bare text -- additional guidance, candidate streams, or framing notes.

---

## Steps

### 1. Parse input and read the paper

- Read the target section (`draft/sections/{section}.tex`). Extract the existing **blocks** (these are candidate streams), every preliminary `\citep`/`\citet` key, and every `[TODO-cite]` note, keeping track of which stream each belongs to.
- Read `draft/sections/1-introduction.tex` for the paper's stated **contribution**, and the abstract in `draft/main.tex` if one is drafted. These tell you what the paper claims to add to each stream.
- Read `CLAUDE.md` (Current Project State + Writing Style) and `.claude/rules/knowledge-base.md` for the target journal/domain and notation conventions.
- `Grep` `draft/references.bib` for the keys collected above to see which preliminary cites already have full BibTeX entries (and which `[TODO-cite]` items are missing entirely).

Do not search yet.

### 2. Build the stream map and PRESENT IT (gate)

Assemble a **stream map**. For each stream produce:
- a short **label** (e.g. "Regulation, policy, and adoption"),
- a one-line **scope** (what prior work this block reviews),
- the paper's **contribution to this stream**, drawn from the intro/section (how we differ),
- the **existing cites** found for it, split into verified-in-bib vs. `[TODO-cite]`/preliminary.

You MAY propose 1-2 **additional streams** the paper plausibly touches but has not listed, clearly marked as suggestions. You may also propose sharper labels/scoping for the user's streams.

Present the map to the user with `AskUserQuestion` (or a compact written confirm block) and ask them to:
- edit labels, scope, or the contribution framing,
- add or cut streams (including accepting/rejecting your suggested ones),
- optionally **flag the 1-2 anchor papers** per stream they most want read in full (otherwise you choose anchors in Step 4).

**Do not proceed to searching until the user confirms.** Treat any edit as a new map and re-confirm if the change is substantive.

### 3. Per-stream search (sequential, rate-limited)

Process one confirmed stream at a time. For each:

1. **Verify existing cites.** Collect the stream's preliminary keys/titles and resolve them with `get_papers_batch` (pass DOIs or titles). Record corrected metadata and note any that fail to resolve (these go in Caveats).
2. **Formulate 3-5 queries** with built-in coverage:
   - foundational/canonical work in the stream,
   - recent work (use `year_start` for the last ~5 years),
   - the **contribution's specific angle** (the exact thing this paper does differently),
   - one cross-domain variant (the same phenomenon in another field).
3. **Preferred-journal first pass** (only if `[journal: ...]` was given): run 1-2 of the queries through `search_papers` with `venue=[...]` and `fields_of_study` from the domain, then print a short honest progress line to the reader (e.g. "Searching Marketing Science, Journal of Marketing for stream 1... 3 on-stream candidates" or "Nothing clearly on-stream in the requested journals; broadening").
4. **General search:** run the queries through `search_by_topic`/`search_papers` with `fields_of_study`, a sensible `limit` (~10), and `min_citation_count` to skip noise.
5. **Recommendations pass:** seed `recommend_papers` with the `paperId`s of the best on-stream hits (and any known canonical anchor) to surface adjacent work that keyword search misses.
6. **Dedupe** across the stream's queries. Retain `paperId`, title, authors, year, DOI, venue, abstract, TLDR, `citationCount`, `fieldsOfStudy`, `isOpenAccess`, and `openAccessPdf` URL.
7. **Present a per-stream candidate table** in your chat response (lives in chat, not the saved report) so nothing plausibly-relevant is dropped silently:

   | Authors | Title | Venue | Year | Cites | Relevance | Status | Anchor? |
   |---------|-------|-------|------|-------|-----------|--------|---------|

   - **Relevance**: abstract-based estimate 10 (best) to 1, labeled as not-yet-read.
   - **Status**: `existing-verified` / `new` / `[TODO]` (preliminary cite confirmed) / `[UNVERIFIED]`.
   - **Anchor?**: `Yes` for the 1-2 papers you will read in full (honor user flags from Step 2), else `No`.

Run all streams' searches before moving on, or process stream-by-stream end to end -- either is fine, but keep MCP calls sequential.

### 4. Deep-read 1-2 anchor papers per stream

For each stream, fully read the 1-2 anchors (user-flagged, else the most canonical on-stream paper plus one strong recent one). Reuse `method-precedent`'s acquisition, attempting **each source at most once -- never retry the same source in a loop**:

1. **Check `literature/` first** -- it may already hold the paper as `{AuthorYear}.pdf`.
2. The `openAccessPdf` URL from the API.
3. Playwright: navigate to `https://www.semanticscholar.org/paper/{paperId}`, snapshot, extract a PDF link.
4. One WebSearch for an open-access version.

Download with `curl -sL -o literature/{AuthorYear}.pdf "{pdf_url}"`.

**If an anchor PDF still cannot be obtained, hand off to the researcher** (they often have institutional access you lack). End the turn with the missing papers (title, authors, year, DOI/link), a request to drop each into `literature/` as `{AuthorYear}.pdf`, and an instruction to reply "continue" when done (or say which to skip). Do not finalize the report yet; on "continue", re-scan `literature/` and resume. For any skipped anchor, fall back to its abstract/TLDR and note this in Caveats.

**Read** each PDF with the `Read` tool, targeting the contribution/findings and (where relevant) the related-work framing -- check the first pages for structure, then read the core. Extract: the paper's main contribution to the stream, its key finding, and the precise way our paper differs from it.

### 5. Compose and save the report

Save to `quality_reports/related_literature_[sanitized_topic].md`. This skill is **report-only**: produce LaTeX-ready prose blocks; do NOT edit `draft/sections/{section}.tex`.

The drafted prose must follow the project's writing style (see `.claude/rules/latex-writing.md`): `\citet` for in-text and `\citep` for parenthetical citations, Oxford commas, active voice, no em dashes (no `---`), and none of the banned transitions ("Furthermore", "Moreover", "Additionally", "Notably"). Use the verified BibTeX keys, and write `\citep{KEY}` even for `new` papers so the prose drops straight into the section once the BibTeX is added.

---

## Report Format

```
# Related Literature: [Paper short title]
**Date:** YYYY-MM-DD
**Target journal / domain:** [from CLAUDE.md]
**Streams:** [ordered list of confirmed stream labels]

## How to use this report
[One line: each stream below gives a prior-work review and a ready-to-paste contribution paragraph;
add the BibTeX entries at the end to references.bib first.]

---

## Stream 1: [Label]
**Scope:** [one line]

### Prior work
[Synthesized review of what this stream established -- a few sentences making a point, not a list.
Then the evidence table:]

| Authors | Title | Venue | Year | Cites | What it establishes | Status |
|---------|-------|-------|------|-------|---------------------|--------|

### Our contribution (LaTeX-ready draft)
[A prose paragraph in the project's style, mirroring the section's review -> contrast move:
"Prior work shows X \citep{...}. We instead ...". Uses verified \citet/\citep keys.]

### Anchors read in full
- **Author (Year)** -- contribution, key finding, and exactly how we differ.

---

## Stream 2: [Label]
[same structure]

---

## Cross-stream gap statement (LaTeX-ready draft)
[One short paragraph that ties the streams together into the single gap this paper fills --
the closing move of the section.]

## BibTeX entries to add to references.bib
[Verified new and corrected entries only, with final keys matching the \cite commands above.]

## Caveats
- Preliminary cites that did not resolve: [...]
- Anchors that could not be accessed (abstract-only): [...]
- Search or venue-filter limitations: [...]
```
