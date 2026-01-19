# Create Git commits

## Overview
Create a logical Git commit with proper summary. If multiple edits have occurred, group the edits logically into multiple commits.

## Steps

1. **Prepare changes and branch**
   - Read unstaged changes.
2. **Group unstaged changes**
   - Group unstaged changes by the folder where they occurred.
   - If there are multiple changes in a folder, categorize them based on the Commit Template below.
3. **Write a commit description for each group**
   - Write a clear commit summary using the provided commit template.
   - Ensure each commit message does not exceed 70 characters.
   - For each commit, include a brief body (under 70 characters) explaining the reason and method for the change.
4. **Provide a list of commits and ask for confirmation**
   - Provide a list of each commit.
   - Ask for confirmation in a way where the user needs to hit 'y' (for yes) or 'n' (for no).

## Commit Template
- [ ] "draft: <description>"
      For changes in the draft/ folder
      Replace <description> with the section edited and what was done
- [ ] "feat: <description>"
      For new features
      Replace <description> with the feature or script added
- [ ] "fix: <description>"
      For bug fixes
      Replace <description> with the bug that was resolved
- [ ] "docs: <description>"
      For documentation or README changes
      Replace <description> with what documentation was updated
- [ ] "perf: <description>"
      For code quality or performance improvements
      Replace <description> with a summary of the improvements made.

