# Academic Paper Template for Cursor

This is a template for academic projects that combines LaTeX, R, and Cursor's AI into one integrated workflow. It's designed for anyone who wants to make their research process more efficient and reproducible – whether you're a PhD student just starting out or a senior academic looking to streamline existing workflows.

Have you ever felt frustrated by the disconnect between your draft (whether in Word or Overleaf) and running your analysis locally? Do you find yourself manually copying regression results into tables, hoping you don't make a typo? Or spent too much time writing commit messages and explaining your codebase to co-authors? If any of this sounds familiar, I think you'll find this template helpful. Everything lives in one place: your draft, your code, automated workflows, and Cursor's AI assistant to help you every step of the way.

Let's dive in!

## Why Cursor?

Before I tell you why Cursor, let me first highlight a few pain points that researchers like us commonly face. These are challenges I've personally encountered, and I suspect many of you have too.

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

The solution to these pain points? An all-in-one environment where your draft, data, and code live in the same place! And this is exactly where Cursor comes in. I discovered it through a post by Kevin A. Bryan (University of Toronto) about reproducible and efficient academic coding, which you 
can read [here](https://kevinbryanecon.com/techstack.html#starting). I definitely recommend checking 
it out!

So what is Cursor? It's essentially VS Code on steroids. Or more formally, Cursor is a Visual Studio Code (VS Code) fork that includes built-in AI (VS Code + AI = Cursor). With this built-in AI, you get an intelligent assistant that understands your entire project. The key difference lies in context awareness: the AI can see all your files simultaneously – your LaTeX draft, your R code, your figures, everything. When you ask it to help with something, it already understands the context of your project without you having to explain anything.

And this is exactly the setup that addresses all the pain points I mentioned earlier. First, because everything lives in the same place, you can analyze data and generate outputs that automatically flow into your document – no manual uploads, no version mismatches. Second, your entire project (analysis, code, and draft) is in one location, making replication straightforward. A reviewer can see exactly how your analysis runs and regenerate your paper from scratch. Third, Cursor's AI can help with documentation: it can write commit messages, summarize changes, and explain your code, saving you considerable time. And fourth, it helps you write more efficient code by identifying inefficiencies and suggesting improvements, making your codebase more accessible to your co-authors.

Using the Cursor AI is fundamentally different from using ChatGPT in a browser. With ChatGPT, you constantly need to copy your problem from your locally stored files into the browser, then manually provide context about your file structure, explain what you're working on, and paste the output back into your project. It's a tedious back-and-forth process. With Cursor, the AI is already "inside" your project. Let me give you some examples for why this might be so useful:

**1. LaTeX formatting and equations.**
- You ran a nice model in R and now want to formally present the estimated model as "Equation 1" in your draft? For many of us, the struggle begins: How do I write Greek letters in LaTeX? How do I make subscripts? What about superscripts? With Cursor, you simply point the AI to the line of code where you ran your model and say something like *"Please add the model I estimated here to my LaTeX document as an equation."* Within seconds, you'll have a properly formatted equation in your draft. This does not only apply to equations but to all kinds of LaTeX formatting challenges: tables, figures, citations, cross-references, you name it.

**2. Improving your writing.**
- You wrote a section and you're unsure how it sounds? I'm sure this happens to many non-native English speakers like me. Just highlight the section and ask Cursor to improve clarity or fix ambiguities. The results are significantly better because the AI sees your citations, your data, and your analysis. It understands what you're actually trying to say within the context of your research.

**3. Updating regression tables.**
- Let's say you have new regression results. Remember how annoying it always is to manually update your LaTeX results table? And not only that, it is also extremely prone to mistakes and typos! With Cursor (this is what I did for this template), you can ask it to help you build a system that automatically exports model results to a separate `.tex` file, which then gets automatically inserted into your draft. The result? A nice-looking table that will never need to be updated manually again. I'll show you how this works further down in this README (or check out `main-analysis.R` and `visualization.R` in the `code/` folder).

**4. Git commits and documentation.**
- You've been working on your project all day: fixing a bug in your analysis, updating a section in your draft, tweaking a figure. Now it's time to push your changes to Git for your collaborators. But wait: What exactly did you change? How should you group these changes into commits? Writing meaningful commit messages feels tedious, and you end up with a single messy commit that says "updates" – not exactly helpful for your future self or your co-authors. With Cursor, you can create a custom command that automatically analyzes your changes, groups them logically by folder and type, and generates well-documented commits with clear descriptions. No more vague commit messages, no more forgetting what you changed.

**5. One-click paper generation.**
- You want to share your project with a collaborator or submit a replication package. Ideally, they should be able to regenerate all your outputs and compile your paper without needing to understand every technical detail of your setup. But explaining the exact sequence of scripts to run, which files to generate first, and how to compile the LaTeX document? That's a lot of documentation to write. With Cursor, you can create automated tasks that run your entire workflow with a single command: execute your analysis scripts, generate your figures and tables, and compile your paper into a PDF. Your collaborator (or a reviewer) can reproduce your entire project without any manual intervention.

Those are just a few of the many ways Cursor can significantly boost the efficiency of your academic workflow. There's really no limit to what you can do. The more you use it, the more ideas you'll get. I'm still discovering new possibilities every day. In the following sections, I'll explain what you need to get started, walk you through the structure of this template project, and provide a step-by-step guide to help you make everything work after cloning the repository.


## What you'll need to start

Before you can use this template, you'll need to install a few tools and create some accounts. I will not got into a lot of detail here as there a tons of documentations out there explaining how to download the respective tools.

**1. LaTeX Distribution**

Obviously we will need LaTeX to actually compile our documents. If you haven't installed it yet, download [MacTeX](https://tug.org/mactex/) for Mac or [MiKTeX](https://miktex.org/download) for Windows. The installation might take a while, but you only need to do this once.

**Important:** This template requires MacTeX (Mac) or MiKTeX (Windows). I've seen users run into issues with TinyTeX, which doesn't include all the packages needed and won't work with this template. Make sure that MacTeX or MiKTeX is properly configured and later detected by Cursor as your LaTeX distribution.

**2. Git**

Git is a version control system that tracks changes to your files. It is the basis of modern collaborative coding and reproducible research, letting you collaborate with others and sync your work across devices. You can find the download information on the [Git Website](https://git-scm.com/install/). Note that there are different ways to download it depending on your operation system. Personally, I use a Mac, so I downloaded Git via Homebrew.

**3. GitHub**

GitHub is a platform that hosts Git repositories online. It's where this template lives, and it's where you'll create your own repository for your project to keep it backed up and accessible from anywhere. While you'll start by cloning this template, you'll eventually want to create your own GitHub repository for your actual research project. Go to [github.com](https://github.com) and create a free account.

**4. Cursor**

No need to introduce Cursor again. We will download it at [cursor.com](https://cursor.com/download) and start our efficient workflow here. You can use your GitHub account to sign in.

At the time of writing this, Cursor offers a free plan, as well as a 7-day trial for the Pro plan. For getting started with this template, the free plan should be more than enough. If you later start to need more AI usage, I recommend you start to explore the paid plans. So far, the Pro plan has been sufficient for everything I have ever needed. 

**5. R (and/or Python)**

I assume that you're already using and have downloaded a coding language. Otherwise, you probably wouldn't be reading this seeking to boost the efficiency of your academic workflow. However, if you haven't set up a programming environment yet, I recommend working with [Python](https://www.python.org/downloads/) or [R](https://www.r-project.org/). Both are widely used in academic research, have extensive libraries for data analysis, and work seamlessly with Cursor. In order to make this template I provide run, you will only need R.

*A quick note on my personal setup: Using Python inside Cursor feels completely natural because it works just like VS Code. However, using R is a bit different. While R works perfectly fine with Cursor, I still prefer coding in [RStudio](https://posit.co/download/rstudio-desktop/) simply because I've been using it for years and am comfortable with its interface. This doesn't change any of the workflow within Cursor though. The R code is still saved in the same project folder, meaning it can always be referenced by Cursor and all other files in the project. So feel free to use whichever R environment you prefer.*


## Project Structure

Let's now have a look at this GitHub repository and all the folders and files in here. While some of the descriptions below might not be intuitive yet, I think it's still valuable to provide this overview. You can always come back to this section after cloning the repo and trying things out to better understand what each file and folder is doing.

### `.cursor/`

I think this might be one of the coolest things you can do with Cursor. Inside this folder, you can customize how the AI assistant behaves and create powerful automations for your workflow. There are two key components: **rules**, which shape how the AI responds when working with different file types, and **commands**, which let you create custom workflows that you can trigger with a simple command. Let me explain both.

**`.cursor/rules`**

Inside this folder, you can create `.mdc` files that define custom rules for how the AI assistant behaves. Have a look at the `latex.mdc` file I created here: I set it up to tell Cursor that it's a scientific writing assistant focused on improving clarity and maintaining formal academic tone when working with LaTeX files.

The nice thing is that you can create many different rules that automatically become active for different cases. For example, you could have specific rules for `.tex` files, others for your `.py` files, and yet others for `.R` scripts. So you could define your LaTeX cursor rules as *"You are a writing assistant that improves writing quality and ensures proper academic style,"* and your R cursor rules as *"You are a coding expert specialized in statistical modeling and data analysis,"* and the AI output will always adjust to those rules depending on which type of file you're working on. It's incredibly powerful for tailoring the AI to your specific workflow. For more information about the power of Cursor Rules, check out the [official documentation](https://cursor.com/docs/context/rules).

There's also a `security.mdc` file included in this template. This rule is set to `alwaysApply: true`, meaning it's active regardless of which file you're working on. It prevents the AI from editing critical configuration files (like `.cursorignore` and `.gitignore`), ensures the AI respects the files you've marked as off-limits in `.cursorignore`, and stops the AI from accessing files outside your repository. This is particularly important for academic research where you might have confidential data. The security rule adds an extra layer of protection to ensure the AI doesn't accidentally access or suggest changes to sensitive files.

**`.cursor/commands`**

This folder contains custom commands. Those are reusable workflows that you can invoke directly from the chat. Instead of repeatedly explaining to the AI what you want it to do, you write the instructions once and then trigger them whenever you need them. This is where those automations I mentioned earlier come to life.

Have a look at the `commit.md` file I created here. Remember how I mentioned earlier that writing meaningful commit messages can feel tedious, especially after a long day of work? This command solves that problem. It instructs Cursor to analyze your unstaged changes, group them logically by folder and type, and generate well-documented commits following a standardized template. The best part? Since this command lives in your repository, all your collaborators will use the same commit structure, making your project's version history consistent and easy to navigate.

There's also the `onboard.md` command, which helps new collaborators get started quickly. When someone joins your project, they simply run `/onboard` and Cursor automatically checks whether they have the required software installed (R, LaTeX) and whether all necessary packages are available. If something is missing, it either installs it automatically or provides clear instructions. No more lengthy setup guides or "it works on my machine" problems.

Then there's the `review-code.md` command. As I mentioned at the beginning, we want to write good code. It should be efficient, well-documented, and easily understandable for our co-authors. This command helps you achieve that by running a comprehensive code review checklist: it checks for logic errors, evaluates code quality and structure, identifies potential security vulnerabilities, and verifies that your code is properly documented. It's like having a second pair of eyes on your code before you share it with your collaborators.

Lastly, there's the `update-workflow.md` command, which helps keep your automated workflow in sync with your code. As your project evolves, you might add new analysis scripts or modify existing ones, and it's easy to forget to update the workflow tasks accordingly. This command automatically checks whether all scripts in `code/` are properly incorporated into `.vscode/tasks.json` and ensures that all dependencies (tables, figures, etc.) required by your LaTeX document can be generated when running the workflow. 

For more information about Cursor Commands, check out the [official documentation](https://cursor.com/docs/context/commands).

### `.vscode/`

You might wonder why this folder is called `.vscode` when we're using Cursor. Remember, Cursor is a fork of VS Code, so it inherits the same configuration system. This folder is traditionally used to store project-specific settings and tasks in VS Code, and Cursor uses it in exactly the same way. The key file here is `tasks.json`, which defines automated tasks you can run with a single command. Remember the "one-click paper generation" I mentioned earlier? This is where it happens.

Have a look at the `tasks.json` file. I've set up several tasks: `visualization` runs your figure-generating script, `main-analysis` runs your main analysis script, and `build-pdf` triggers a rebuild of your LaTeX document. But the real magic is the `full-workflow` task: it runs all three in sequence, meaning you can regenerate your entire paper (analysis, figures, tables, and the compiled PDF) with a single command. There's also a `clean-workflow` task that removes all generated outputs, useful when you want to start fresh or verify that your workflow reproduces everything correctly. To run these tasks, simply press `Cmd+Shift+P` (or `Ctrl+Shift+P` on Windows), type "Run Task," and select the task you want to execute.

### `code/`

This is where all your code is going to be saved. For this template, I only use R because I'm largely working with R myself. The main analysis (which is based on a simple example dataset that I also uploaded here) is stored in `main-analysis.R`, and the code that generates our graphs is stored in `visualization.R`. Of course, in your actual project, you can structure this folder however you like: add subfolders, use Python instead of R, or organize scripts by chapter or analysis type.

### `data/`

This is where all your data sits: the raw data, the transformed data, intermediate datasets, etc. Some people also like to save their graphs and figures here. However, I prefer to save them under `draft/figures/` as you'll see in a second, since they're directly tied to the document. For this template, I included an example dataset called `mtcars.csv`, which is a well-known example dataset from the R `library(datasets)`. This allows you to run the analysis scripts right away and see how everything connects.

Note that it's usually not a thing to have your dataset uploaded to GitHub as I did here. In fact, most of the time this won't even work because GitHub doesn't allow uploading large data files, as it's designed for code, not datasets. Thus, it's common practice to exclude data files in your `.gitignore` file. You'll see that I've included how you would do this inside the `.gitignore` file (it's currently commented out). This way your data stays local while your code and draft are version-controlled.

Beyond version control, there's another important consideration: **data confidentiality**. In academic research, data is often sensitive or confidential, and you don't want to accidentally share it with AI models. To prevent Cursor's AI from accessing your data, I've set up a `.cursorignore` file that excludes the `data/` folder. This means the AI won't read, index, or include your data files in its context – even if you have them open in the editor.

If you want to be extra safe, the most secure approach is to store your data completely outside this repository, somewhere else on your local machine. You can then reference that location in your R scripts using absolute paths. This way, there's no chance of your data ever being exposed to AI models or accidentally committed to GitHub.

### `draft/`

This is the heart of your paper and where your LaTeX document lives. Let me walk you through the key components:

**`draft/main.tex`**

- This is the main LaTeX file that compiles your entire paper. Think of it as the conductor of an orchestra: it doesn't contain the actual content, but it brings together all the pieces (the preamble, the abstract, and all section files). When you compile this file, LaTeX reads all the `\input{}` statements and assembles everything into your final PDF. If you want to change the order of sections or add new ones, this is where you do it.

**`draft/preamble/`**

- This folder contains your LaTeX preamble files, which essentially are the "settings" for your document. Here you'll find `packages.tex` (which loads all the LaTeX packages you need, like `amsmath` for equations, `booktabs` for tables, etc.) and `macros.tex` (where you can define custom commands and shortcuts). If you need to add a new package or create a custom LaTeX command, this is where you do it. Keeping the preamble in separate files keeps `main.tex` clean and readable.

**`draft/sections/`**

- This is where you actually write your paper. Each `.tex` file corresponds to a major section: `1-introduction.tex`, `2-theoretical-background.tex`, `3-data.tex`, and so on. Again, you can call those sections however you like. The point is that this modular approach is one of LaTeX's biggest advantages. Instead of scrolling through one giant document, you can work on individual sections. It also makes version control much cleaner. This way each section has its own git history, so you can track changes to your introduction separately from changes to your results, data section, or any other part of your paper.

**`draft/tables/`**

- This folder holds your LaTeX tables. Remember the automated workflow I mentioned earlier? This is where your R scripts export their results. For example, `main-results.tex` contains a regression table that was automatically generated by `main-analysis.R`. When `main.tex` compiles, it pulls these tables in. You should never manually edit these files as they're meant to be regenerated every time your analysis runs. This ensures your paper always reflects your latest results. Note that this folder doesn't exist in the GitHub repo (yet). After you clone it, it will be automatically created when you run `main-analysis.R` for the first time.

**`draft/figures/`**

- Similar to `tables/`, this is where your generated figures live. The `visualization.R` script saves plots here as PDFs (like `scatter_mpg_wt.pdf`), and `main.tex` includes them in the document. Using PDFs ensures higher-quality graphics. This folder also doesn't exist in the GitHub repo and will be automatically created when you run `visualization.R` for the first time.

**`draft/references.bib`**

- This is your BibTeX bibliography file where all your citations live. You can add entries manually by copying a BibTeX citation directly from Google Scholar (just click "Cite" under any paper, then click "BibTeX"). Alternatively, you can export them from a reference manager like Zotero. LaTeX and BibTeX handle all the formatting automatically based on your citation style.

**`draft/informs2014.bst`**

- This is the bibliography style file that determines how your citations and reference list are formatted. The `informs2014` style is the one I use, but you can swap it out for any other `.bst` file depending on your field or target journal.

**`draft/.latexmkrc`**

- This configuration file tells LaTeX where to store auxiliary files (like `.aux`, `.log`, `.bbl`) that are generated during compilation. I've set it up to put everything in `aux_files/` to keep the main draft folder clean. You probably won't need to touch this file, but it's nice to know what it does. 

**`draft/aux_files/`**

- This folder stores all the messy intermediate files that LaTeX generates when compiling your document. You don't need to look in here as it's automatically managed. Just like `tables/` and `figures/`, this folder doesn't exist in the GitHub repo and will be automatically created by LaTeX when you compile your document for the first time. We never push these to git since they're temporary files that can be regenerated and would just clutter the repository. That's why we add them to `.gitignore`.

**The main takeaway for `draft/`:** All your actual writing and content editing should occur within the files in `draft/sections/` (except for the title and the abstract, which are inside `draft/main.tex`) . After setting up your project in the beginning, the rest of the subfolders are maintained and updated automatically by your R scripts and LaTeX compilation. The only file you'll occasionally update manually is `references.bib` when you're adding new literature to cite.

### `.gitignore`

This file tells Git which files and folders to exclude from version control. It includes standard entries you'd find in any R project: R history files (`.Rhistory`), session data (`.RData`), RStudio-specific files (`.Rproj.user/`), cache directories, and temporary files. It also ignores `.DS_Store`, which is a system file that Macs create automatically.

Beyond these standard ignores, I've added project-specific entries:
- `draft/aux_files/` - LaTeX auxiliary files we discussed earlier
- `draft/main.synctex.gz` - LaTeX synchronization file
- `draft/main.pdf` - The compiled PDF (since it can be regenerated)
- `draft/figures/` - Generated plots from `visualization.R`
- `data/` - Your research data (commented out in this template so you can see the example dataset)

These are files we don't want cluttering up our Git history since they can be regenerated anytime. For `data/`, the reason is different: datasets are often too large for GitHub, and more importantly, research data is frequently confidential. In your actual projects, you should uncomment the `data/` line to exclude your data from version control.

One important thing to know: Cursor also respects your `.gitignore` for AI indexing, meaning files ignored by Git are automatically hidden from the AI too (unless you specifically tell it to look at them). This is convenient, but sometimes you need more control, which brings us to `.cursorignore`.

### `.cursorignore`

As briefly introduced in the `data/` section above, this file gives you explicit control over which files Cursor's AI can access. You'll notice that `data/` appears in both `.gitignore` and `.cursorignore`. Why both?

Here's the key difference: files in `.gitignore` are hidden from AI indexing by default, but you can still force the AI to look at them by tagging them with `@` in your prompt. Files in `.cursorignore`, on the other hand, are completely blocked. You cannot reference them with `@` mentions at all. This makes `.cursorignore` the secure choice for truly confidential data. Having `data/` in both files means it's excluded from version control AND fully protected from AI access, even if you accidentally try to reference it.

Another thing you'll find in the file is a `!draft/` line with an exclamation mark. This is a negation pattern that re-includes the `draft/` folder for AI access. Since Cursor respects `.gitignore`, our generated files in `draft/` (like tables and figures) would normally be hidden from the AI. But we actually want the AI to see these files for context when helping us write. The `!draft/` pattern overrides the default, ensuring the AI has full context of your paper while still keeping your data private.

To summarize: `.gitignore` is for version control (with AI hiding as a side effect), while `.cursorignore` is specifically for fine-tuning AI access – allowing you to both exclude files (like `data/`) and re-include files (like `draft/`) as needed. For more detailed information on ignore patterns and syntax, check out the [official Cursor documentation on ignore files](https://cursor.com/docs/context/ignore-files).


## Setting Up the Template

Now that you understand the structure, let's get this template up and running on your computer. Follow these steps:

### Step 1: Create Your Own Copy of this Repo

1. Click the green **"Use this template"** button at the top of this GitHub repository
2. Select **"Create a new repository"**
3. Choose a name for your project (e.g., `my-research-project`) and click **"Create repository"**
4. Open Cursor and press `Cmd+Shift+P` (Mac) or `Ctrl+Shift+P` (Windows/Linux) to open the command palette
5. Type "Git: Clone" and paste your new repository's URL
6. Choose a location on your computer where you want to save the project
7. Click "Open" when Cursor asks if you want to open the cloned repository

You now have your own independent copy of the template that you can freely modify, commit, and push to your GitHub.

### Step 2: Install the Required Extensions

There are two extensions you'll want to install. **LaTeX Workshop** provides syntax highlighting, auto-completion, PDF preview, and automatic compilation for LaTeX files – essential for seeing your compiled document while you're writing. **R** (by REditorSupport) gives you syntax highlighting and code execution support for R scripts, so you can run your analysis directly in Cursor.

**Important:** Make sure you've installed a LaTeX distribution (MacTeX or MiKTeX) and R as mentioned in the prerequisites above. The extensions won't work without them.

1. Click on the Extensions icon in the left sidebar (or press `Cmd+Shift+X` on Mac / `Ctrl+Shift+X` on Windows)
2. Search for "LaTeX Workshop" and click "Install" on the extension by James Yu
3. Search for "R" and click "Install" on the extension by REditorSupport

### Step 3: Adjust Cursor Settings

There are two settings you'll want to adjust to get the most out of this template.

**Enable Word Wrapping**

By default, Cursor doesn't automatically wrap long lines, which can make reading and editing LaTeX files difficult. Let's fix that:

1. Open Settings: `Cmd+,` (Mac) or `Ctrl+,` (Windows)
2. In the search bar, type "Word Wrap"
3. Find the "Editor: Word Wrap" setting and change it from "off" to "on"

This enables visual line wrapping without inserting actual line breaks in your files. Your LaTeX source will stay clean (no hard line breaks), but long paragraphs will wrap on your screen for better readability.

**Set Up the Terminal Command Allowlist**

Remember the automated commit command I mentioned earlier? For it to work smoothly, Cursor needs permission to run certain terminal commands automatically. By default, Cursor asks for confirmation before running any terminal command, which would interrupt the automated workflow. If you don't set up the allowlist, the AI will ask you in the chat each time it wants to run a command. When it does, it will also offer to add that command to the allowlist permanently – but it's much more efficient to set everything up upfront. The allowlist tells Cursor which commands are safe to run without asking.

1. Open Settings: `Cmd+,` (Mac) or `Ctrl+,` (Windows)
2. In the search bar, type "allowlist"
3. Find "Cursor > Terminal > Command Allowlist"
4. Click "Add Item" and add each of these commands:
   - `git status`
   - `git add`
   - `git commit`
   - `git diff`

With these commands allowlisted, the automated commit command can now analyze your changes, stage files, and create commits without interrupting you for permission at every step.

### Step 4: Check Your Setup with the Onboarding Command

In the next step (Step 5), we'll run the code and generate the PDF I prepared for this template. But first, let's make sure you have everything you need: R installed, a LaTeX distribution (MacTeX or MiKTeX) properly configured, and the required R packages. Instead of checking all of this manually, we'll let Cursor do it for us. This way we get a great first taste of what Cursor's AI can do.

I've created an onboarding command that automatically verifies your entire environment setup. This command checks whether R, Python, and LaTeX are installed, verifies that LaTeX is correctly configured (e.g., that MacTeX is in your PATH and being used instead of TinyTeX), and confirms that all required R and Python packages are available. To run it, you'll need to open Cursor's AI chat pane. Here's how:

1. Press `Cmd+L` (Mac) or `Ctrl+L` (Windows) to open the AI chat pane on the right side of your screen
2. In the chat input at the bottom, type `/onboard` and press Enter
3. You'll see a message explaining that Cursor will check your setup and may ask to run commands. Click "Run" when prompted
4. Cursor will now check whether R, Python, and LaTeX are installed, verify LaTeX configuration (ensuring MacTeX or MiKTeX is in PATH), and check whether all required packages are available

Based on the results:
- **If everything is installed and configured correctly:** You'll see a confirmation that your environment is ready. You can proceed to the next step.
- **If something is missing or misconfigured:** Cursor will either attempt to install it for you automatically, or provide you with clear instructions on how to fix it yourself. Follow those instructions, then run `/onboard` again to verify.

Don't worry if the AI chat feels unfamiliar – I'll explain how to use Cursor's AI in more detail in the "Using Cursor's AI" section further below. For now, just follow the steps above to get your environment ready.

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

**Check your project folder on the left.** You should now see that `main.pdf` has appeared in the `draft/` folder, along with the newly created `tables/` and `figures/` folders containing your generated outputs. **Your paper has been generated!** It includes all sections, automatically inserted tables, figures, citations, and cross-references.

### Step 6: Start Writing and See Live Updates

Now that everything is compiled and working, let's see how the day-to-day writing workflow looks like.

Open any section file in `draft/sections/` (for example, `1-introduction.tex`). Make a small change: add a word, write a sentence, whatever you like. Then save the file with `Cmd+S` (Mac) or `Ctrl+S` (Windows). You'll see that the PDF updates automatically! LaTeX Workshop detects your changes and recompiles the document in the background.

The best way to experience this is to have your source file and the compiled PDF open side by side:

1. Open a section file (e.g., `draft/sections/1-introduction.tex`)
2. Click the "Split Editor Right" button in the top-right corner (or press `Cmd+\` on Mac / `Ctrl+\` on Windows)
3. In the new panel, open `draft/main.pdf`

Now you can write in the left panel, save your changes, and immediately see the updated PDF on the right. Try it out, it's a very satisfying workflow!

**A note on auxiliary files:** You'll notice that compilation creates some extra files: `draft/aux_files/` (containing `.aux`, `.log`, `.bbl`, etc.) and `draft/main.synctex.gz`. Don't worry about these as they're temporary build artifacts that LaTeX needs for cross-references, bibliography, and syncing clicks between source and PDF. They're excluded from git via `.gitignore` so they won't clutter your repository's history.

## Using Cursor's AI

Now that you've set up the template and compiled your document, let's take a closer look at how to use Cursor's AI. You've already had a first taste when you ran the `/onboard` command earlier – now let me give you an overview of all the ways you can interact with the AI.

### Opening the AI Chat Panel

The main way to interact with Cursor's AI is through the chat panel. You can open it by:
- Clicking the chat icon in the top-right corner of Cursor, or
- Using the keyboard shortcut: `Cmd+L` (Mac) or `Ctrl+L` (Windows)

This opens a chat interface where you can ask questions, request code changes, get explanations, or ask for help with LaTeX formatting.

### Choosing Your AI Model

In the prompt input box at the bottom of the chat panel, you'll see a dropdown showing the current model. Click on it to select which AI model you want to use. Cursor supports multiple models (like GPT-5.2, Claude Sonnet, etc.). Different models have different strengths. Some are better for code, others for writing. Experiment to see which works best for your needs.

### Choosing Your AI Mode

Cursor offers different interaction modes that change how the AI responds. You can select these modes using the dropdown next to the chat input:

- **Agent** (default): The AI can directly edit files and run commands. Use this when you want the AI to make changes automatically – for example, when you ask it to update a table or fix formatting.

- **Plan**: The AI first creates a step-by-step plan before executing. Use this for complex tasks where you want to review the approach first, like restructuring multiple sections or implementing a new feature.

- **Debug**: The AI focuses on analyzing errors, understanding code issues, and suggesting fixes. Use this when you encounter errors or when something isn't working as expected.

- **Ask**: The AI provides information and explanations without making any changes. Use this when you want to understand how something works, get explanations, or ask questions without modifying your files.

### Asking Questions About Specific Code

The real power comes from asking questions about specific parts of your project:

**Target a specific line or selection:**
1. Highlight the code or text you want to ask about
2. Press `Cmd+L` (Mac) or `Ctrl+L` (Windows)
3. The selected code is automatically included as context in your question
4. Ask a question to the AI or tell it what to do! For example: *"Can you explain what this regression model does?"* or *"Improve the clarity of this paragraph"*

**Reference specific files:**

You can explicitly reference files in your questions using the `@` symbol:
- Type `@` in the chat to see a list of files in your project
- Select the files you want to reference
- Example: *"Look at `@main-analysis.R` and add all equations that have been estimated formally to `@draft/sections/4-empirical-approach.tex`"*

This is incredibly powerful because the AI can see multiple files simultaneously and understand how they relate to each other.

### Using Cursor Commands

You've already used a Cursor command when you ran `/onboard` earlier! Commands are reusable workflows that you can launch by typing `/` in the AI chat panel. These commands are stored in the `.cursor/commands` folder, and typing `/` will display all available commands.

Another powerful command I've created is `/commit`. This command automatically analyzes your uncommitted changes, groups them logically by folder and type, and generates well-documented commit messages following a standardized template. The AI will propose commits with clear descriptions – all you need to do is confirm by typing "y" and then push to your repository. I'll ask you to try this out in the "Next Steps" section below.

**Note:** Remember that commands like `/commit` need certain terminal commands to be allowlisted (as we set up earlier) so they can run without interruption. 

### Inline Editing with Cmd+K

For quick edits directly in your file, use `Cmd+K` (Mac) or `Ctrl+K` (Windows):
1. Highlight the text you want to edit
2. Press `Cmd+K` / `Ctrl+K`
3. Describe the change you want (e.g., *"make this more concise"* or *"fix LaTeX formatting"*)
4. The AI will suggest an edit inline that you can accept, reject, or modify

This is perfect for quick fixes without opening the full chat panel.


### Conclusion

The same rules that apply to any AI prompting apply here: be specific, provide context, and iterate if needed. But with Cursor, you can be even more specific by using `@` to reference exactly the files you want the AI to consider. The AI has access to your entire project, so it understands the relationships between your LaTeX draft, R code, data, and figures.

And it's not just about editing. Cursor's AI helps across your entire workflow: onboarding new collaborators to your project (just like the `/onboard` command did for you), writing well-documented commit messages automatically, reviewing code quality, and much more. The possibilities are limitless, and the more you use Cursor, the more use cases you'll discover for your own workflow. Experiment and see what works best for you!


## Next Steps

Now that you have the template running and know how to use the AI to help you work, the best way to truly understand it is to start experimenting. Here are a few things you could try:

- **Add a new section**: Create a new file in `draft/sections/` (e.g., `7-conclusion.tex`), write some content, and add it to `main.tex` using `\input{sections/7-conclusion}`
- **Add a citation**: Find a paper on Google Scholar, copy its BibTeX entry, paste it into `references.bib`, and cite it in your text using `\citep{citation-key}`.
- **Create a new table**: Pick another dataset from `library(datasets)`, run a simple analysis in R, use `modelsummary` to export it as a LaTeX table, and include it in your draft. That's a tough one, so try to use the AI for assistance!
- **Convert an equation from a paper**: Open any academic paper online and pick a formula it contains (could be a model they estimated). Take a screenshot of it and ask the AI to insert it into your draft as a properly formatted LaTeX equation.
- **Commit your changes**: Now that you've made some changes, push them to your own GitHub repository! Open the AI chat (`Cmd+L` / `Ctrl+L`), type `/commit`, and let the AI analyze your changes. It will group them logically and propose well-documented commit messages. When it asks for confirmation, type "y" for yes, and then push to your repository. Your first automated commit!
- **Try the code review command**: Run `/review-code` in the chat and point it at `@code/main-analysis.R`. The R script in this template is intentionally simple, but you'll get a feel for how the AI reviews code quality, checks for issues, and suggests improvements. Imagine running this on your actual analysis code!
- **Create your own command**: Try creating a new command! For example, create a file called `improve-writing.md` in `.cursor/commands/` that instructs the AI to enhance clarity, fix typos, and improve academic tone when you select a section. Then test it by selecting some text and running `/improve-writing`. You just built your own reusable workflow!
- **Explore the other tasks**: Have a look at the other tasks in `.vscode/tasks.json`. Try running `clean-workflow` (via `Cmd+Shift+P` → "Tasks: Run Task") and see what happens (it removes all generated outputs). Then run `full-workflow` again to regenerate everything. This shows you how easy it is to start fresh and verify that your entire paper reproduces correctly.

The more you experiment, the more comfortable you'll become with this automated workflow. Don't be afraid to break things. If things get out of control, you can simply recover the initial state of the project from git. And remember, whenever you run into trouble or have questions, just ask Cursor for help. That's what it's there for.


## Final Thoughts

I spent quite some time putting this template together and tried to make it as comprehensive as possible. However, this workflow intersects several tools and concepts: Git and GitHub for collaborative work with version control, LaTeX (which can look scary if you've only worked in Word), and Cursor as a new platform. Everyone comes to this with different backgrounds: some of you might be familiar with Git but new to LaTeX, others might know LaTeX well but have never used version control, and some might be new to everything. Then there are those who know all these tools but simply didn't realize you could put them together like this.

Naturally, it's very difficult to make this guide comprehensive for everyone. And if you have questions about any file or functionality in this template, guess what: just ask Cursor! It has full context of this repository and can give you an exact explanation of how everything works. With that being said, if you feel like I missed anything important or something is unclear, please let me know and I'll update this repository. I would be super happy if people helped make this template even better through feedback or contributions. 

With that being said, happy coding and good luck with your research project!

## Acknowledgments

A special thanks to [Bobbie Krijger](https://www.linkedin.com/in/bobbiekrijger/), who helped me bring this template to the next level. I presented an early prototype to her, and she immediately got hooked on this new workflow – just like I already was. She dove into learning about Cursor and contributed significantly to polishing this template, especially when it came to incorporating the custom commands and automated tasks. You can check out her work [here on Github](https://github.com/bobbiejk).

## Contact

I hope that whoever picks up this workflow really sees an improvement in their working structure and efficiency. If so, I'd of course be keen to hear about it – feel free to star this repo or contact me via [Linked In](https://www.linkedin.com/in/octavianciupitu/)!