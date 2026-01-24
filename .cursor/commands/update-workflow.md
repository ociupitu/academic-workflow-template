# Update workflow

## Overview

Check whether all the scripts under `code/` are incorporated in the workflow and that all dependencies of the document can be created when executing `/.vscode/tasks.json`

## Guidelines
- Do not check whether files are actually existing; it just need to check what input files are created such that `/.vscode/tasks.json` lays out the correct sequence of running `code/`. 
- Only make changes when new code changes the workflow; do not make the `/.vscode/tasks.json` more efficient if there is no bug.

## Rules
1. Familiarize with the input and the output files in each script in `code/`
2. Familiarize with each input file in `draft/main.tex` or `draft/sections/`, such as figures and tables, that are created in `code/`
3. Update steps in `.vscode/tasks.json` such that missing scripts are incorporated and the total workflow can be run
4. Inform user about the changes that are made in `.vscode/tasks.json`

