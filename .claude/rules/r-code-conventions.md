---
paths:
  - "code/**/*.R"
---

# R Code Standards

**Standard:** Senior Principal Data Engineer + PhD researcher quality

---

## 1. Reproducibility

- `set.seed()` called ONCE at top (YYYYMMDD format) if stochastic elements exist
- All packages loaded at top via `library()` (not `require()`)
- All paths relative to repository root
- `dir.create(..., recursive = TRUE)` for output directories

## 2. Function Design

- `snake_case` naming, verb-noun pattern
- Roxygen-style documentation for non-trivial functions
- Default parameters, no magic numbers
- Named return values (lists or tibbles)

## 3. Domain Correctness

<!-- Replace these bullets with checks specific to your models and data.
     The goal is to catch mismatches between code and what the paper describes. -->

- Verify model formula matches what the paper's model section describes
- Confirm any transformations (lags, rolling windows, log-transforms) align with the data section
- Cross-check variable names in code against the knowledge-base notation registry

## 4. Figure Standards

```r
# Save figures to draft/figures/
ggsave(file.path("draft", "figures", "figure_name.pdf"), width = [w], height = [h], dpi = [dpi])
```

- Use consistent theme across all figures
- Axis labels in sentence case with units
- Legend at bottom or right, never overlapping data
- Color palette consistent across the paper

## 5. Common Pitfalls

<!-- Add project-specific pitfalls as you discover them -->
| Pitfall | Impact | Prevention |
|---------|--------|------------|
| Hardcoded paths | Breaks on other machines | Use `file.path()` with relative paths |
| `require()` instead of `library()` | Silent failure | Always use `library()` |

## 6. Line Length

**Standard:** Keep lines <= 100 characters.

**Exception: Mathematical Formulas** -- lines may exceed 100 chars if:
1. Breaking the line would harm readability
2. An inline comment explains the mathematical operation
3. The line is in a numerically intensive section

## 7. Code Quality Checklist

```
[ ] Packages at top via library()
[ ] set.seed() once at top (if stochastic)
[ ] All paths relative
[ ] Functions documented
[ ] Figures: explicit dimensions, consistent theme
[ ] RDS: every computed object saved
[ ] Comments explain WHY not WHAT
```
