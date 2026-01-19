# Setting Up This Project

## Overview
Comprehensive onboarding process to get a new developer up and running quickly. 

## Onboarding Guidelines

**Always start with this standardized message:**

"I'm going to check your environment setup now. This will involve running some commands to verify that required software (R, Python, LaTeX) is installed and properly configured. I may also need to check for required packages. When I ask to run commands, please click 'Run' to allow me to proceed. I will only check your setup and won't modify any of your project files."

Verify the environment setup by running commands in the terminal or Cursor. Cursor-specific settings (like extensions) have to be done by the user manually. If any required software or packages are missing, attempt to install them automatically using the terminal or Cursor. If automatic installation fails or isn't possible, provide clear manual instructions to the user. Display all output and results in the chat only – do not modify any files in the project. 

If all checklist points are fulfilled, tell the user to continue with running the entire workflow using `Ctrl+Shift+P` on Windows and `Cmd+Shift+P` on Mac, search for Tasks: Run Task, and run the `full-workflow`. The user can also find this workflow in @.vscode/tasks.json.

## Steps 
1. **Environment setup**
   - Confirm that required software is installed: R, Python, and LaTeX.
   - Verify that LaTeX is correctly configured: 
     - On Mac: Check that `which pdflatex` returns `/Library/TeX/texbin/pdflatex` (MacTeX). If it shows a different path (like `/usr/local/bin/pdflatex`), MacTeX may not be in PATH. Provide instructions to add `export PATH="/Library/TeX/texbin:$PATH"` to `~/.zshrc` or offer to fix it automatically.
     - On Windows: Check that `where pdflatex` (Command Prompt) or `Get-Command pdflatex` (PowerShell) points to MiKTeX installation (typically in `C:\Program Files\MiKTeX\...`). If MiKTeX is installed but not found, provide instructions to add it to PATH or offer to fix it automatically.
   - Confirm that required packages of R and Python are installed given code/

## Onboarding Checklist
- [ ] Development environment ready