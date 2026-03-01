# Academic Paper Template for Claude Code

This is a template for academic projects that combines LaTeX, R, and Claude Code's AI into one integrated workflow. It's designed for anyone who wants to make their research process more efficient and reproducible – whether you're a PhD student just starting out or a senior academic looking to streamline existing workflows.

Have you ever felt frustrated by the disconnect between your draft (whether in Word or Overleaf) and running your analysis locally? Do you find yourself manually copying regression results into tables, hoping you don't make a typo? Or spent too much time writing commit messages and explaining your codebase to co-authors? If any of this sounds familiar, I think you'll find this template helpful. Everything lives in one place: your draft, your code, automated workflows, and Claude Code as an AI assistant to help you every step of the way.

Let's dive in!

## Why Claude Code?

Before I tell you why Claude Code, let me first highlight a few pain points that researchers like us commonly face. These are challenges I've personally encountered, and I suspect many of you have too.

**The Disconnect Between Draft and Code**

At the beginning of my PhD, I switched from Word to LaTeX for academic writing. The reasons were straightforward: LaTeX offers superior control and consistency over your documents, and ... well, my supervisor strongly recommended it. Let's just say it was a mix of recognizing the benefits and following good advice.

I quickly realized that the resulting documents just look more professional. The equations and citations are crisp, the formatting is consistent, and there's a level of polish that's hard to achieve in Word. And also the workflow became much smoother. Instead of scrolling through one giant document, I could create separate files for each chapter, giving me a better overview of my work. And once I set up the layout initially, all the formatting happens automatically. I just focus on writing, and LaTeX handles the rest.

Like many others, I started using LaTeX in Overleaf. Overleaf is an online LaTeX editor that runs in your browser, and it's genuinely amazing. It gives you all the benefits of LaTeX in a convenient interface and makes collaboration effortless. Need your supervisor's feedback? Just share the document. They can make edits, you can review them, and every change is tracked in the project history (we call this version control). For writing (especially collaborative writing) Overleaf is hard to beat.

But there's a major downside when you're doing empirical work: the disconnect between your writing and your code. Since Overleaf runs in the browser, everything has to be uploaded manually. You generate a new graph? Save it locally, then upload it to Overleaf. New regression results? Export the table, then upload it to Overleaf. Same for descriptive statistics, maps, or any other output from your analysis. It's tedious, and if you've done empirical research, you know exactly what I'm talking about.

**Reproducibility**

Another major pain point relates to reproducibility, which is a crucial aspect of academic research. In almost every project, you'll have co-authors who need to understand not only your code but also how it connects to your draft. When your project is split between Overleaf (for writing) and your local machine (for code), this relationship can become unclear and the workflow more error-prone. And if we think one step further: at some point, you'll want to create a replication package for your project. A third person (say, a reviewer or another researcher) will want to see exactly how your analysis runs, verify they get the same results, and ideally be able to regenerate your entire paper from scratch. This simply doesn't work when your draft lives in Overleaf while your code sits somewhere else entirely.

**Version Control and Collaborative Coding**

As a researcher working collaboratively, it's good practice to keep your co-authors well informed about your progress and past work on the project. This means frequent and precisely written git commits, thorough documentation, and generally spending a fair amount of time on what can feel like tedious housekeeping. At the same time, in the best case, we want to write good code: efficient, well-documented, and easily understandable for our co-authors. Part of the reason we strive for this is to reduce the documentation burden, but we also simply want to make our collaborators' lives easier. Both of these aspects require significant time and effort.

**The Solution**

The solution to these pain points? An all-in-one environment where your draft, data, and code live in the same place! And this is exactly where Claude Code comes in. I discovered the underlying concept through a post by Kevin A. Bryan (University of Toronto) about reproducible and efficient academic coding, which you can read [here](https://kevinbryanecon.com/techstack.html#starting). I definitely recommend checking it out!

So what is Claude Code? It's an AI assistant (built by Anthropic) that runs as an extension directly inside Visual Studio Code (VS Code). With Claude Code, you get an intelligent assistant that understands your entire project. The key difference from a standalone chat tool lies in context awareness: Claude Code can see all your files simultaneously – your LaTeX draft, your R code, your figures, everything. When you ask it to help with something, it already understands the context of your project without you having to explain anything.

And this is exactly the setup that addresses all the pain points I mentioned earlier. First, because everything lives in the same place, you can analyze data and generate outputs that automatically flow into your document – no manual uploads, no version mismatches. Second, your entire project (analysis, code, and draft) is in one location, making replication straightforward. A reviewer can see exactly how your analysis runs and regenerate your paper from scratch. Third, Claude Code can help with documentation: it can write commit messages, summarize changes, and explain your code, saving you considerable time. And fourth, it helps you write more efficient code by identifying inefficiencies and suggesting improvements, making your codebase more accessible to your co-authors.

Using Claude Code inside VS Code is fundamentally different from using Chat GPT or Claude.ai in a browser. With the browser version, you constantly need to copy your problem from your locally stored files into the browser, then manually provide context about your file structure, explain what you're working on, and paste the output back into your project. It's a tedious back-and-forth process. With Claude Code, the AI is already "inside" your project. Let me give you some examples for why this might be so useful:

**1. LaTeX formatting and equations.**
- You ran a nice model in R and now want to formally present the estimated model as "Equation 1" in your draft? For many of us, the struggle begins: How do I write Greek letters in LaTeX? How do I make subscripts? What about superscripts? With Claude Code, you simply point the AI to the line of code where you ran your model and say something like *"Please add the model I estimated here to my LaTeX document as an equation."* Within seconds, you'll have a properly formatted equation in your draft. This does not only apply to equations but to all kinds of LaTeX formatting challenges: tables, figures, citations, cross-references, you name it.

**2. Improving your writing.**
- You wrote a section and you're unsure how it sounds? I'm sure this happens to many non-native English speakers like me. Just highlight the section and ask Claude Code to improve clarity or fix ambiguities. The results are significantly better because the AI sees your citations, your data, and your analysis. It understands what you're actually trying to say within the context of your research.

**3. Updating regression tables.**
- Let's say you have new regression results. Remember how annoying it always is to manually update your LaTeX results table? And not only that, it is also extremely prone to mistakes and typos! With Claude Code (this is what I did for this template), you can ask it to help you build a system that automatically exports model results to a separate `.tex` file, which then gets automatically inserted into your draft. The result? A nice-looking table that will never need to be updated manually again. I'll show you how this works further down in this README (or check out `main-analysis.R` and `visualization.R` in the `code/` folder).

**4. Git commits and documentation.**
- You've been working on your project all day: fixing a bug in your analysis, updating a section in your draft, tweaking a figure. Now it's time to push your changes to Git for your collaborators. But wait: What exactly did you change? How should you group these changes into commits? Writing meaningful commit messages feels tedious, and you end up with a single messy commit that says "updates" – not exactly helpful for your future self or your co-authors. With Claude Code, you can invoke the `/commit` skill that automatically analyzes your changes, groups them logically by folder and type, and generates well-documented commits with clear descriptions. No more vague commit messages, no more forgetting what you changed.

**5. One-click paper generation.**
- You want to share your project with a collaborator or submit a replication package. Ideally, they should be able to regenerate all your outputs and compile your paper without needing to understand every technical detail of your setup. But explaining the exact sequence of scripts to run, which files to generate first, and how to compile the LaTeX document? That's a lot of documentation to write. With Claude Code, you can create automated tasks that run your entire workflow with a single command: execute your analysis scripts, generate your figures and tables, and compile your paper into a PDF. Your collaborator (or a reviewer) can reproduce your entire project without any manual intervention.

Those are just a few of the many ways Claude Code can significantly boost the efficiency of your academic workflow. There's really no limit to what you can do. The more you use it, the more ideas you'll get. I'm still discovering new possibilities every day. In the following sections, I'll explain what you need to get started, walk you through the structure of this template project, and provide a step-by-step guide to help you make everything work after cloning the repository.


## What you'll need to start

Before you can use this template, you'll need to install a few tools and create some accounts. I will not go into a lot of detail here as there are tons of documentations out there explaining how to download the respective tools.

**1. LaTeX Distribution**

Obviously we will need LaTeX to actually compile our documents. If you haven't installed it yet, download [MacTeX](https://tug.org/mactex/) for Mac or [MiKTeX](https://miktex.org/download) for Windows. The installation might take a while, but you only need to do this once.

**Important:** This template requires MacTeX (Mac) or MiKTeX (Windows). I've seen users run into issues with TinyTeX, which doesn't include all the packages needed and won't work with this template. Make sure that MacTeX or MiKTeX is properly configured and later detected by VS Code as your LaTeX distribution.

**2. Git**

Git is a version control system that tracks changes to your files. It is the basis of modern collaborative coding and reproducible research, letting you collaborate with others and sync your work across devices. You can find the download information on the [Git Website](https://git-scm.com/install/). Note that there are different ways to download it depending on your operating system. Personally, I use a Mac, so I downloaded Git via Homebrew.

**3. GitHub**

GitHub is a platform that hosts Git repositories online. It's where this template lives, and it's where you'll create your own repository for your project to keep it backed up and accessible from anywhere. While you'll start by cloning this template, you'll eventually want to create your own GitHub repository for your actual research project. Go to [github.com](https://github.com) and create a free account.

**4. VS Code**

Visual Studio Code is a free, open-source code editor by Microsoft that Claude Code runs inside. Download it from [code.visualstudio.com](https://code.visualstudio.com/). It's available for Mac, Windows, and Linux.

**5. Claude Code**

Claude Code is the AI assistant that powers this template's workflow. It's built by Anthropic and runs as an extension inside VS Code. You can install it from the [VS Code Marketplace](https://marketplace.visualstudio.com/items?itemName=Anthropic.claude-code) or directly from the Extensions panel inside VS Code (search for "Claude Code" by Anthropic). You'll need an Anthropic account to use it – sign up at [claude.ai](https://claude.ai).

**6. R (and/or Python)**

I assume that you're already using and have downloaded a coding language. Otherwise, you probably wouldn't be reading this seeking to boost the efficiency of your academic workflow. However, if you haven't set up a programming environment yet, I recommend working with [Python](https://www.python.org/downloads/) or [R](https://www.r-project.org/). Both are widely used in academic research, have extensive libraries for data analysis, and work seamlessly with VS Code. In order to make this template run, you will only need R.

*A quick note on my personal setup: Using Python inside VS Code feels completely natural. However, using R is a bit different. While R works perfectly fine with VS Code, I still prefer coding in [RStudio](https://posit.co/download/rstudio-desktop/) simply because I've been using it for years and am comfortable with its interface. This doesn't change any of the workflow within VS Code though. The R code is still saved in the same project folder, meaning it can always be referenced by Claude Code and all other files in the project. So feel free to use whichever R environment you prefer.*


## Project Structure

Let's now have a look at this repository and all the folders and files in here. While some of the descriptions below might not be intuitive yet, I think it's still valuable to provide this overview. You can always come back to this section after cloning the repo and trying things out to better understand what each file and folder is doing.

### `CLAUDE.md`

This is the heart of the AI configuration in Claude Code. It's a file that Claude Code reads automatically at the start of every session, giving the AI a complete picture of your project: its folder structure, writing style conventions, quality thresholds, the current state of each component, and a quick reference of all available skills. Think of it as a persistent briefing document that keeps Claude Code oriented no matter when you start a new conversation.

When you clone this template and start your own project, you'll customize `CLAUDE.md` with your project's specific details – the research question, institution, which files are authoritative, and the current status of each section. This means Claude Code will always know where you left off, even if you close VS Code and come back a week later.

**A note on context management.** While Claude Code can technically see your entire folder structure, loading every file into context for every session would be slow and expensive. `CLAUDE.md` solves this by giving the AI a compact, always-current summary of your project instead. But there's a subtlety: a good AI assistant doesn't just need to know the current state of your project – it needs to understand its trajectory. In research, you're constantly updating one part of the project while another is still catching up. If the AI only sees a snapshot, it may apply changes inconsistently. The "Current Project State" table in `CLAUDE.md` is designed for exactly this: it tracks not just what is done, but what is in progress and what is next. Update it at the end of every working session, and the AI will always understand where you're coming from and where you're headed.

**Keeping `CLAUDE.md` up to date.** You can always edit it manually. But the key automation is the `/commit` skill: every time you commit changes that include `.tex` section files, it automatically updates the Current Project State table to reflect the new status of those sections before staging. This means that as long as you use `/commit` regularly, `CLAUDE.md` largely keeps itself current.

### `.claude/`

This folder is where you customize how Claude Code behaves and create powerful automations for your workflow. There are three key components: **agents**, which are specialized AI subprocesses that focus on specific review tasks; **rules**, which define how the AI behaves when working with different file types; and **skills**, which let you create reusable workflows that you can trigger with a simple slash command. Let me explain each.

**`.claude/agents/`**

Agents are specialized AI subprocesses that Claude Code can invoke to handle focused review tasks. They run with a specific role and a targeted checklist, which makes their output much more reliable than asking a general-purpose AI to "review my paper." This template includes four agents:

- **proofreader** — Reviews `.tex` files for grammar, typos, inconsistent notation, LLM writing patterns (like em dashes used as fillers or hedging phrases), and LaTeX quality issues. Saves a detailed report to `quality_reports/`.
- **domain-reviewer** — Acts as a top-journal referee reviewing your paper's substantive correctness: identification strategy, econometric specification, citation fidelity, and logical flow between sections. Also saves a report to `quality_reports/`.
- **r-reviewer** — Reviews your `.R` scripts for code quality, reproducibility, figure generation standards, domain correctness (does the code match what the paper describes?), and professional polish. Saves a code review report.
- **verifier** — Runs end-to-end checks: compiles the LaTeX paper, executes R scripts, verifies that figures and tables were generated correctly, and checks cross-file consistency (do numbers in the text match the tables?). This agent actually runs commands, not just reads files.

The real power is that these agents are wired into an automated orchestrator loop (more on that in the "Using Claude Code" section below), so they run automatically after you make significant changes – not just when you remember to ask for a review.

**`.claude/rules/`**

Inside this folder, you can create Markdown files that define custom rules for how Claude Code behaves. The rules are scoped to specific file types using path patterns, so the AI automatically applies the right conventions depending on what you're working on. This template includes six rules:

- **latex-writing.md** — Active for all `.tex` files. Defines the academic writing style: formal prose, active voice, Oxford commas, no em dashes as sentence fillers, no LLM clichés ("Furthermore", "Moreover"), and LaTeX-specific formatting conventions.
- **r-code-conventions.md** — Active for all `.R` scripts. Defines code style: snake_case naming, verb-noun function names, relative paths only, section headers, and documentation standards.
- **quality-gates.md** — Active for `.tex` and `.R` files. Defines a scoring rubric with severity-weighted deductions (compilation failure = -100, undefined citation = -15, etc.) and thresholds: 80/100 to commit, 90/100 for a PR, 95/100 as an aspirational target.
- **orchestrator-protocol.md** — Defines the automated loop that runs after a plan is approved: implement → verify → review agents → fix → re-verify → score → present summary. Maximum 3 review-fix rounds before presenting results regardless.
- **plan-first-workflow.md** — For any non-trivial task, Claude Code enters plan mode first: explores the codebase, drafts a step-by-step plan, presents it to you for approval, and only starts implementing after you confirm.
- **knowledge-base.md** — A project-specific registry of variable names, notation conventions, and key concepts. Ensures Claude Code uses consistent terminology across your LaTeX and R files.

**`.claude/skills/`**

This folder contains reusable slash-command workflows. Instead of repeatedly explaining to Claude Code what you want it to do, you write the instructions once in a `SKILL.md` file and trigger them whenever you need them. Each skill lives in its own subfolder. This template ships with eight skills:

| Skill | What it does |
|-------|-------------|
| `/onboard` | Verifies your entire environment: R version, LaTeX distribution, required packages, and runs a full smoke test |
| `/compile-latex` | Builds the PDF via latexmk and reports any errors or warnings |
| `/commit` | Analyzes unstaged changes, groups them logically, and generates well-documented commit messages |
| `/lit-review [topic]` | Structured literature search with citation extraction and synthesis |
| `/research-ideation [topic]` | Generates research questions, testable hypotheses, and empirical strategies |
| `/interview-me [topic]` | Interactive interview to formalize your research ideas into a precise specification |
| `/validate-bib` | Cross-references citations in your `.tex` files against `references.bib` and flags missing or unused entries |
| `/devils-advocate` | Challenges your arguments with critical questions to identify weaknesses before submission |

To invoke a skill, simply type `/skill-name` in the Claude Code chat panel. For example, type `/commit` and Claude Code will analyze your uncommitted changes and propose well-structured commit messages.

Creating your own skill is straightforward: add a new folder inside `.claude/skills/` (e.g., `.claude/skills/improve-writing/`) and create a `SKILL.md` file inside it with instructions for what the AI should do when the skill is invoked. You've just built a reusable workflow.

### `.vscode/`

You might wonder why this folder is called `.vscode` when we're using Claude Code inside VS Code. This folder is traditionally used to store project-specific settings and tasks in VS Code. The key file here is `tasks.json`, which defines automated tasks you can run with a single command. Remember the "one-click paper generation" I mentioned earlier? This is where it happens.

Have a look at the `tasks.json` file. I've set up several tasks: `visualization` runs your figure-generating script, `main-analysis` runs your main analysis script, and `build-pdf` triggers a rebuild of your LaTeX document. But the real magic is the `full-workflow` task: it runs all three in sequence, meaning you can regenerate your entire paper (analysis, figures, tables, and the compiled PDF) with a single command. There's also a `clean-workflow` task that removes all generated outputs, useful when you want to start fresh or verify that your workflow reproduces everything correctly. To run these tasks, simply press `Cmd+Shift+P` (or `Ctrl+Shift+P` on Windows), type "Run Task," and select the task you want to execute.

### `code/`

This is where all your code is going to be saved. For this template, I only use R because I'm largely working with R myself. The main analysis (which is based on a simple example dataset that I also uploaded here) is stored in `main-analysis.R`, and the code that generates our graphs is stored in `visualization.R`. Of course, in your actual project, you can structure this folder however you like: add subfolders, use Python instead of R, or organize scripts by chapter or analysis type.

### `data/`

This is where all your data sits: the raw data, the transformed data, intermediate datasets, etc. Some people also like to save their graphs and figures here. However, I prefer to save them under `draft/figures/` as you'll see in a second, since they're directly tied to the document. For this template, I included an example dataset called `mtcars.csv`, which is a well-known example dataset from the R `library(datasets)`. This allows you to run the analysis scripts right away and see how everything connects.

Note that it's usually not a good idea to have your dataset uploaded to GitHub as I did here. In fact, most of the time this won't even work because GitHub doesn't allow uploading large data files, as it's designed for code, not datasets. Thus, it's common practice to exclude data files in your `.gitignore` file. You'll see that I've included how you would do this inside the `.gitignore` file (it's currently commented out). This way your data stays local while your code and draft are version-controlled.

Beyond version control, there's another important consideration: **data confidentiality**. In academic research, data is often sensitive or confidential. Claude Code respects your `.gitignore` file for AI context – files excluded from git are automatically hidden from Claude Code as well, so adding your `data/` folder to `.gitignore` both protects it from version control and keeps it out of the AI's context. If you want to be extra safe, the most secure approach is to store your data completely outside this repository, somewhere else on your local machine, and reference it using relative or configured paths in your R scripts.

### `draft/`

This is the heart of your paper and where your LaTeX document lives. Let me walk you through the key components:

**`draft/main.tex`**

- This is the main LaTeX file that compiles your entire paper. Think of it as the conductor of an orchestra: it doesn't contain the actual content, but it brings together all the pieces (the preamble, the abstract, and all section files). When you compile this file, LaTeX reads all the `\input{}` statements and assembles everything into your final PDF. If you want to change the order of sections or add new ones, this is where you do it.

**`draft/preamble/`**

- This folder contains your LaTeX preamble files, which essentially are the "settings" for your document. Here you'll find `packages.tex` (which loads all the LaTeX packages you need, like `amsmath` for equations, `booktabs` for tables, etc.) and `macros.tex` (where you can define custom commands and shortcuts). If you need to add a new package or create a custom LaTeX command, this is where you do it. Keeping the preamble in separate files keeps `main.tex` clean and readable.

**`draft/sections/`**

- This is where you actually write your paper. Each `.tex` file corresponds to a major section: `1-introduction.tex`, `2-theoretical-background.tex`, `3-data.tex`, and so on. Again, you can call those sections however you like. The point is that this modular approach is one of LaTeX's biggest advantages. Instead of scrolling through one giant document, you can work on individual sections. It also makes version control much cleaner. Each section has its own git history, so you can track changes to your introduction separately from changes to your results, data section, or any other part of your paper.

**`draft/tables/`**

- This folder holds your LaTeX tables. Remember the automated workflow I mentioned earlier? This is where your R scripts export their results. For example, `main-results.tex` contains a regression table that was automatically generated by `main-analysis.R`. When `main.tex` compiles, it pulls these tables in. You should never manually edit these files as they're meant to be regenerated every time your analysis runs. This ensures your paper always reflects your latest results. The folder itself is included in the GitHub repo (empty, with a `.gitkeep` file) so that the directory structure is visible after cloning, but its contents are git-ignored since they're generated output.

**`draft/figures/`**

- Similar to `tables/`, this is where your generated figures live. The `visualization.R` script saves plots here as PDFs (like `scatter_mpg_wt.pdf`), and `main.tex` includes them in the document. Using PDFs ensures higher-quality graphics. Like `tables/`, this folder is included in the repo (empty, with a `.gitkeep` file) so the structure is clear after cloning, but its contents are git-ignored.

**`draft/references.bib`**

- This is your BibTeX bibliography file where all your citations live. You can add entries manually by copying a BibTeX citation directly from Google Scholar (just click "Cite" under any paper, then click "BibTeX"). Alternatively, you can export them from a reference manager like Zotero. LaTeX and BibTeX handle all the formatting automatically based on your citation style.

**`draft/informs2014.bst`**

- This is the bibliography style file that determines how your citations and reference list are formatted. The `informs2014` style is the one I use, but you can swap it out for any other `.bst` file depending on your field or target journal.

**`draft/.latexmkrc`**

- This configuration file tells LaTeX where to store auxiliary files (like `.aux`, `.log`, `.bbl`) that are generated during compilation. I've set it up to put everything in `aux_files/` to keep the main draft folder clean. You probably won't need to touch this file, but it's nice to know what it does.

**`draft/aux_files/`**

- This folder stores all the messy intermediate files that LaTeX generates when compiling your document. You don't need to look in here as it's automatically managed. Like `tables/` and `figures/`, this folder is included in the repo (empty, with a `.gitkeep` file) so the directory structure is visible after cloning, but its contents are git-ignored since they're temporary files that can be regenerated.

**The main takeaway for `draft/`:** All your actual writing and content editing should occur within the files in `draft/sections/` (except for the title and the abstract, which are inside `draft/main.tex`). After setting up your project in the beginning, the rest of the subfolders are maintained and updated automatically by your R scripts and LaTeX compilation. The only file you'll occasionally update manually is `references.bib` when you're adding new literature to cite.

### `quality_reports/`

This folder is where Claude Code's review agents save their output. When the proofreader agent reviews a section, or the r-reviewer agent reviews a script, or the domain-reviewer agent runs a substantive check, their reports land here as Markdown files. This gives you a persistent, reviewable record of every quality check. The folder is tracked in git (via a `.gitkeep` file) but the reports themselves are listed in `.gitignore` since they're generated output.

### `.gitignore`

This file tells Git which files and folders to exclude from version control. It includes standard entries you'd find in any R project: R history files (`.Rhistory`), session data (`.RData`), RStudio-specific files (`.Rproj.user/`), cache directories, and temporary files. It also ignores `.DS_Store`, which is a system file that Macs create automatically.

Beyond these standard ignores, I've added project-specific entries:
- `draft/aux_files/*` — LaTeX auxiliary files we discussed earlier (the folder itself is tracked via `.gitkeep`, but its contents are ignored)
- `draft/main.synctex.gz` — LaTeX synchronization file
- `draft/main.pdf` — The compiled PDF (since it can be regenerated)
- `draft/figures/*` — Generated plots from `visualization.R` (folder tracked via `.gitkeep`, contents ignored)
- `draft/tables/*` — Generated LaTeX tables from `main-analysis.R` (folder tracked via `.gitkeep`, contents ignored)
- `data/` — Your research data (commented out in this template so you can see the example dataset)

The pattern here is that `aux_files/`, `figures/`, and `tables/` are kept in the repo as empty directories (using `.gitkeep` files) so the project structure is immediately visible after cloning. Only their generated contents are ignored. For `data/`, the reason for ignoring is different: datasets are often too large for GitHub, and more importantly, research data is frequently confidential. In your actual projects, you should uncomment the `data/` line to exclude your data from version control.



## Setting Up the Template

Now that you understand the structure, let's get this template up and running on your computer. Follow these steps:

### Step 1: Create Your Own Copy of this Repo

1. Click the green **"Use this template"** button at the top of this GitHub repository
2. Select **"Create a new repository"**
3. Choose a name for your project (e.g., `my-research-project`) and click **"Create repository"**
4. Open VS Code and press `Cmd+Shift+P` (Mac) or `Ctrl+Shift+P` (Windows/Linux) to open the command palette
5. Type "Git: Clone" and paste your new repository's URL
6. Choose a location on your computer where you want to save the project
7. Click "Open" when VS Code asks if you want to open the cloned repository

You now have your own independent copy of the template that you can freely modify, commit, and push to your GitHub.

### Step 2: Install the Required Extensions

There are three extensions you'll want to install. **LaTeX Workshop** provides syntax highlighting, auto-completion, PDF preview, and automatic compilation for LaTeX files – essential for seeing your compiled document while you're writing. **R** (by REditorSupport) gives you syntax highlighting and code execution support for R scripts, so you can run your analysis directly in VS Code. **Claude Code** (by Anthropic) is the AI assistant that powers this entire workflow.

**Important:** Make sure you've installed a LaTeX distribution (MacTeX or MiKTeX) and R as mentioned in the prerequisites above. The LaTeX and R extensions won't work without them.

1. Click on the Extensions icon in the left sidebar (or press `Cmd+Shift+X` on Mac / `Ctrl+Shift+X` on Windows)
2. Search for **"LaTeX Workshop"** and click "Install" on the extension by James Yu
3. Search for **"R"** and click "Install" on the extension by REditorSupport
4. Search for **"Claude Code"** and click "Install" on the extension by Anthropic

After installing Claude Code, you'll be prompted to sign in with your Anthropic account. Follow the authentication steps to connect the extension.

### Step 3: Adjust VS Code Settings

There is one setting you'll want to adjust to get the most out of this template.

**Enable Word Wrapping**

By default, VS Code doesn't automatically wrap long lines, which can make reading and editing LaTeX files difficult. Let's fix that:

1. Open Settings: `Cmd+,` (Mac) or `Ctrl+,` (Windows)
2. In the search bar, type "Word Wrap"
3. Find the "Editor: Word Wrap" setting and change it from "off" to "on"

This enables visual line wrapping without inserting actual line breaks in your files. Your LaTeX source will stay clean (no hard line breaks), but long paragraphs will wrap on your screen for better readability.

When Claude Code asks for permission to read or edit files, you can choose to allow actions automatically for trusted projects. The extension will prompt you the first time it wants to take an action, and you can approve on a per-action basis or configure trust settings in the extension's settings panel.

### Step 4: Check Your Setup with the Onboarding Skill

In the next step (Step 5), we'll run the code and generate the PDF I prepared for this template. But first, let's make sure you have everything you need: R installed, a LaTeX distribution (MacTeX or MiKTeX) properly configured, and the required R packages. Instead of checking all of this manually, we'll let Claude Code do it for us. This way we get a great first taste of what Claude Code can do.

I've created an onboarding skill that automatically verifies your entire environment setup. This skill checks whether R and LaTeX are installed, verifies that all required R and LaTeX packages are available, runs your R scripts, and compiles the PDF as a smoke test to confirm everything works. To run it, you'll need to open Claude Code's chat panel. Here's how:

1. Click the **Claude Code icon** in the left sidebar of VS Code (it looks like the Claude logo) to open the chat panel
2. In the chat input at the bottom, type `/onboard` and press Enter
3. Claude Code will check your setup and may ask to run commands in the terminal. Approve the actions when prompted.
4. Claude Code will check whether R and LaTeX are installed, verify that all required packages are available, and run a full smoke test of your pipeline.

Based on the results:
- **If everything is installed and configured correctly:** You'll see a confirmation that your environment is ready. You can proceed to the next step.
- **If something is missing or misconfigured:** Claude Code will either attempt to install it for you automatically, or provide you with clear instructions on how to fix it yourself. Follow those instructions, then run `/onboard` again to verify.

Don't worry if the Claude Code chat feels unfamiliar – I'll explain how to use it in more detail in the "Using Claude Code" section further below. For now, just follow the steps above to get your environment ready.

### Step 5: Generate the Draft Automatically

Now let's generate the PDF. If you were to compile `draft/main.tex` right now (i.e., save the document, which generates the PDF due to the LaTeX Workshop extension), you'd run into an error. Why? Because `main.tex` has dependencies that don't exist yet. It tries to include tables from `draft/tables/` and figures from `draft/figures/` – but those folders are empty. The tables and figures are generated by our R scripts, so we need to run those first before LaTeX can compile successfully.

Let me briefly explain what the R scripts do:

**`main-analysis.R` - Automatic Table Generation**

This script performs a simple linear regression analysis on the mtcars dataset and automatically exports the results as LaTeX tables. The magic happens through the `modelsummary` package, which converts R regression objects directly into publication-ready LaTeX code. When this script runs, it creates `draft/tables/` and generates two `.tex` files: `summary-statistics.tex` (descriptive statistics) and `main-results.tex` (regression coefficients with standard errors). These files are already referenced in `main.tex` via `\input{}` statements, so they automatically appear in your compiled PDF. The power of this approach: whenever you update your analysis, just re-run the script and your paper updates automatically. No manual copy-pasting, no typos.

**`visualization.R` - Automatic Figure Generation**

This script creates plots using `ggplot2` and saves them as PDFs. It creates `draft/figures/` and generates scatter plots like `scatter_mpg_wt.pdf` and `scatter_mpg_hp.pdf`. Just like the tables, these figures are already referenced in your LaTeX document via `\includegraphics{}` commands.

**Running the Full Workflow**

Instead of running each script manually and then compiling LaTeX, we'll use the automated task I set up in `.vscode/tasks.json`. Remember the "one-click paper generation" I mentioned earlier? This is exactly that.

1. Press `Cmd+Shift+P` (Mac) or `Ctrl+Shift+P` (Windows) to open the command palette
2. Type "Tasks: Run Task" and select it
3. Choose **`full-workflow`** from the list

This task runs `visualization.R`, then `main-analysis.R`, and finally triggers a LaTeX compilation. All in sequence, with a single command! This is the replication power I talked about: anyone can regenerate your entire paper from scratch without understanding the technical details.

**Check your project folder on the left.** You should now see that `main.pdf` has appeared in the `draft/` folder, and the `tables/` and `figures/` folders (which were empty after cloning) now contain your generated outputs. **Your paper has been generated!** It includes all sections, automatically inserted tables, figures, citations, and cross-references.

### Step 6: Start Writing and See Live Updates

Now that everything is compiled and working, let's see how the day-to-day writing workflow looks like.

Open any section file in `draft/sections/` (for example, `1-introduction.tex`). Make a small change: add a word, write a sentence, whatever you like. Then save the file with `Cmd+S` (Mac) or `Ctrl+S` (Windows). You'll see that the PDF updates automatically! LaTeX Workshop detects your changes and recompiles the document in the background.

The best way to experience this is to have your source file and the compiled PDF open side by side:

1. Open a section file (e.g., `draft/sections/1-introduction.tex`)
2. Click the "Split Editor Right" button in the top-right corner (or press `Cmd+\` on Mac / `Ctrl+\` on Windows)
3. In the new panel, open `draft/main.pdf`

Now you can write in the left panel, save your changes, and immediately see the updated PDF on the right. Try it out, it's a very satisfying workflow!

**A note on auxiliary files:** You'll notice that compilation creates some extra files: `draft/aux_files/` (containing `.aux`, `.log`, `.bbl`, etc.) and `draft/main.synctex.gz`. Don't worry about these as they're temporary build artifacts that LaTeX needs for cross-references, bibliography, and syncing clicks between source and PDF. They're excluded from git via `.gitignore` so they won't clutter your repository's history.

## Using Claude Code

Now that you've set up the template and compiled your document, let's take a closer look at how to use Claude Code. You've already had a first taste when you ran the `/onboard` skill earlier – now let me give you an overview of all the ways you can interact with the AI.

### Opening the Claude Code Panel

The main way to interact with Claude Code is through its chat panel inside VS Code. You can open it by clicking the **Claude Code icon** in of VS Code (usually somwhere on the top right).

This opens a chat interface where you can ask questions, request code changes, get explanations, or ask for help with LaTeX formatting.

### Plan Mode: Think Before You Act

One of the most powerful features of Claude Code in this template is **plan mode**. Before making non-trivial changes, Claude Code will automatically enter plan mode: it explores the relevant files, drafts a step-by-step plan, and presents it to you for approval before touching anything. This prevents the AI from making large changes that go in the wrong direction.

For example, if you say "restructure my results section and align it with the regression tables," Claude Code will first read your current results section, the regression tables, and any related sections, then propose a plan showing exactly what it intends to change. You approve the plan, and only then does it start editing.

This behavior is governed by the `plan-first-workflow.md` rule in `.claude/rules/`. You can adjust when plan mode kicks in by editing that file – for instance, you might want to skip it for quick, single-file edits.

### The Orchestrator Loop: Automated Quality Control

After a plan is approved and implemented, Claude Code doesn't just stop. The **orchestrator protocol** automatically runs a quality loop:

1. **Implement** — Execute the plan steps
2. **Verify** — Compile the paper, run R scripts, check that outputs were generated
3. **Review** — Run the appropriate review agents (proofreader for `.tex` files, r-reviewer for `.R` files)
4. **Fix** — Apply fixes in order of severity (critical → major → minor)
5. **Re-verify** — Confirm the fixes are clean
6. **Score** — Apply the quality-gates rubric (80/100 = commit threshold)
7. **Report** — Present a summary with the score and any remaining issues

This loop runs a maximum of 3 rounds, then presents results regardless. The result is that significant edits come back not just completed but reviewed and scored, with a clear summary of what was done and what (if anything) still needs attention.

### Asking Questions About Specific Code

The real power comes from asking questions about specific parts of your project:

**Target a specific line or selection:**
1. Highlight the code or text you want to ask about in the editor
2. Open the Claude Code chat panel
3. The selected code can be referenced in your message using `@Selection` or by simply describing what you highlighted
4. Ask a question or give an instruction. For example: *"Can you explain what this regression model does?"* or *"Improve the clarity of this paragraph"*

**Reference specific files:**

You can explicitly reference files in your questions using the `@` symbol:
- Type `@` in the chat to see a list of files in your project
- Select the files you want to reference
- Example: *"Look at `@main-analysis.R` and add all equations that have been estimated formally to `@draft/sections/4-empirical-approach.tex`"*

This is incredibly powerful because Claude Code can see multiple files simultaneously and understand how they relate to each other.

### Using Skills

You've already used a skill when you ran `/onboard` earlier! Skills are reusable workflows that you launch by typing `/` in the Claude Code chat panel. Typing `/` will show you all available skills.

Here's the full list of skills included in this template:

| Skill | When to use |
|-------|------------|
| `/onboard` | Check your environment setup when you first clone the repo |
| `/compile-latex` | Build the PDF and get a clean error report |
| `/commit` | Generate well-documented commit messages for your unstaged changes |
| `/lit-review [topic]` | Search for and synthesize literature on a specific topic |
| `/research-ideation [topic]` | Brainstorm research questions and empirical strategies |
| `/interview-me [topic]` | Have Claude Code interview you to formalize your research ideas |
| `/validate-bib` | Find missing, unused, or malformed citations |
| `/devils-advocate` | Get critical questions to stress-test your arguments |

Another powerful skill is `/commit`. This skill automatically analyzes your uncommitted changes, groups them logically by folder and type, and generates well-documented commit messages following a standardized template. The AI will propose commits with clear descriptions – all you need to do is confirm and then push to your repository.

### Using Agents

While skills are workflows you invoke manually, **agents** are specialized subprocesses that Claude Code invokes automatically as part of the orchestrator loop. But you can also call them directly when you want a focused review:

- *"Run the proofreader agent on `@draft/sections/3-data.tex`"*
- *"Run the r-reviewer agent on `@code/main-analysis.R`"*
- *"Run the domain-reviewer on the full paper"*

Each agent saves a detailed report to `quality_reports/`, so you have a written record of every review. The verifier agent is especially useful before committing – it runs your entire pipeline end-to-end and confirms that everything compiles and generates correctly.

### Conclusion

The same rules that apply to any AI prompting apply here: be specific, provide context, and iterate if needed. But with Claude Code, you can be even more specific by using `@` to reference exactly the files you want the AI to consider. The AI has access to your entire project, so it understands the relationships between your LaTeX draft, R code, data, and figures.

And it's not just about editing. Claude Code helps across your entire workflow: onboarding new collaborators to your project (just like the `/onboard` skill did for you), writing well-documented commit messages automatically, reviewing code quality through specialized agents, and much more. The possibilities are limitless, and the more you use Claude Code, the more use cases you'll discover for your own workflow. Experiment and see what works best for you!


## Next Steps

Now that you have the template running and know how to use Claude Code to help you work, the best way to truly understand it is to start experimenting. Here are a few things you could try:

- **Add a new section**: Create a new file in `draft/sections/` (e.g., `7-conclusion.tex`), write some content, and add it to `main.tex` using `\input{sections/7-conclusion}`
- **Add a citation**: Find a paper on Google Scholar, copy its BibTeX entry, paste it into `references.bib`, and cite it in your text using `\citep{citation-key}`. Then run `/validate-bib` to confirm everything is wired up correctly.
- **Create a new table**: Pick another dataset from `library(datasets)`, run a simple analysis in R, use `modelsummary` to export it as a LaTeX table, and include it in your draft. That's a tough one, so try to use Claude Code for assistance!
- **Convert an equation from a paper**: Open any academic paper online and pick a formula it contains (could be a model they estimated). Take a screenshot of it and ask Claude Code to insert it into your draft as a properly formatted LaTeX equation.
- **Commit your changes**: Now that you've made some changes, push them to your own GitHub repository! Open the Claude Code chat panel, type `/commit`, and let Claude Code analyze your changes. It will group them logically and propose well-documented commit messages. When it asks for confirmation, approve, then push to your repository. Your first automated commit!
- **Run a code review**: Say *"Run the r-reviewer agent on `@code/main-analysis.R`"* in the Claude Code chat. The R script in this template is intentionally simple, but you'll get a feel for how the agent reviews code quality, checks for issues, and suggests improvements. Imagine running this on your actual analysis code!
- **Create your own skill**: Try creating a new skill! For example, create a folder `.claude/skills/improve-writing/` and add a `SKILL.md` file that instructs Claude Code to enhance clarity, fix typos, and improve academic tone when invoked. Then test it by typing `/improve-writing` in the chat. You just built your own reusable workflow!
- **Explore the other tasks**: Have a look at the other tasks in `.vscode/tasks.json`. Try running `clean-workflow` (via `Cmd+Shift+P` → "Tasks: Run Task") and see what happens (it removes all generated outputs). Then run `full-workflow` again to regenerate everything. This shows you how easy it is to start fresh and verify that your entire paper reproduces correctly.

The more you experiment, the more comfortable you'll become with this automated workflow. Don't be afraid to break things. If things get out of control, you can simply recover the initial state of the project from git. And remember, whenever you run into trouble or have questions, just ask Claude Code for help. That's what it's there for.


## Final Thoughts

I spent quite some time putting this template together and tried to make it as comprehensive as possible. However, this workflow intersects several tools and concepts: Git and GitHub for collaborative work with version control, LaTeX (which can look scary if you've only worked in Word), and Claude Code as an AI assistant. Everyone comes to this with different backgrounds: some of you might be familiar with Git but new to LaTeX, others might know LaTeX well but have never used version control, and some might be new to everything. Then there are those who know all these tools but simply didn't realize you could put them together like this.

Naturally, it's very difficult to make this guide comprehensive for everyone. And if you have questions about any file or functionality in this template, guess what: just ask Claude Code! It has full context of this repository and can give you an exact explanation of how everything works. With that being said, if you feel like I missed anything important or something is unclear, please let me know and I'll update this repository. I would be super happy if people helped make this template even better through feedback or contributions.

With that being said, happy coding and good luck with your research project!

## Acknowledgments

A special thanks to [Bobbie Krijger](https://www.linkedin.com/in/bobbiekrijger/), who helped me bring this template to the next level. I presented an early prototype to her, and she immediately got hooked on this new workflow – just like I already was. She dove into learning about the workflow and contributed significantly to polishing this template, especially when it came to incorporating the custom skills and automated tasks. You can check out her work [here on Github](https://github.com/bobbiejk).

I also want to credit [Pedro Sant'Anna](https://github.com/pedrohcgs), whose [Claude Code workflow repository](https://github.com/pedrohcgs/claude-code-my-workflow/tree/main) was a major source of inspiration for the agents, rules, and skills in this template. His setup was designed for lecture slides, so quite a bit of adaptation was needed to fit an empirical research context, but it provided a very helpful foundation.

## Contact

I hope that whoever picks up this workflow really sees an improvement in their working structure and efficiency. If so, I'd of course be keen to hear about it – feel free to star this repo or contact me via [LinkedIn](https://www.linkedin.com/in/octavianciupitu/)!
