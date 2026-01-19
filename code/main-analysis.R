library(datasets)
library(modelsummary)
library(data.table)

# If you run this script in R Studio, run this setwd() command (uncomment the line).
# setwd("~/academic-project-template-cursor")

# However, if you run this script inside Cursor (with the project template open), you do not need the setwd() command because the root directory is set automatically.


# This is a built-in dataset in R that contains information about different car models.
# The data was extracted from the 1974 Motor Trend US magazine.

# mtcars <- datasets::mtcars        # we can get this dataset from datasets package
mtcars <- fread("data/mtcars.csv")  # or we can read it from a CSV file

# Meaning of the columns in the dataset:
# - mpg: Miles/(US) gallon
# - cyl: Number of cylinders
# - disp: Displacement (cu.in.)
# - hp: Gross horsepower
# - drat: Rear axle ratio
# - wt: Weight (1000 lbs)
# - qsec: 1/4 mile time
# - vs: Engine (0 = V-shaped, 1 = straight)
# - am: Transmission (0 = automatic, 1 = manual)
# - gear: Number of forward gears


################################
### Summary Statistics Table ###
################################

# First, let's create some summary statistics for the dataset. For simplicity,
# we will only focus on the the variables mpg, wt, and hp.

stats_mpg <- c(
  Mean = mean(mtcars$mpg),
  SD   = sd(mtcars$mpg),
  Min  = min(mtcars$mpg),
  Max  = max(mtcars$mpg)
)

stats_wt <- c(
  Mean = mean(mtcars$wt),
  SD   = sd(mtcars$wt),
  Min  = min(mtcars$wt),
  Max  = max(mtcars$wt)
)

stats_hp <- c(
  Mean = mean(mtcars$hp),
  SD   = sd(mtcars$hp),
  Min  = min(mtcars$hp),
  Max  = max(mtcars$hp)
)

# Next, create a LaTeX table and save it to draft/tables:

# --- Helper to format numbers. We want to keep only two decimal places. ---
fmt <- function(x) sprintf("%.2f", x)

# --- Build LaTeX lines (using raw strings R"()" to avoid escaping backslashes) ---
lines <- c(
  R"(\begin{table}[htbp])",
  R"(\centering)",
  R"(\caption{Summary Statistics of the Model Variables})",
  R"(\label{tab:summary_statistics})",
  R"(\begin{threeparttable})",
  R"(\smaller)",
  R"(\begin{tabular}{@{}p{4cm}p{6cm}>{\centering\arraybackslash}p{1.1cm}>{\centering\arraybackslash}p{1.1cm}>{\centering\arraybackslash}p{1.1cm}>{\centering\arraybackslash}p{1.1cm}@{}})",
  R"(\toprule)",
  R"(\addlinespace)",
  R"(Variables & Definition & Mean & SD & Min & Max \\)",
  R"(\addlinespace)",
  R"(\midrule)",
  R"(\addlinespace)",
  R"(\textbf{Dependent Variable} & & & & & \\)",
  R"(\addlinespace)",
  
  sprintf(
    R"($mpg_{i}$ & Car efficiency in miles per (US) gallon & %s & %s & %s & %s \\)",
    fmt(stats_mpg["Mean"]), fmt(stats_mpg["SD"]),
    fmt(stats_mpg["Min"]),  fmt(stats_mpg["Max"])
  ),
  
  R"(\addlinespace)",
  R"(\textbf{Independent Variables} & & & & & \\)",
  R"(\addlinespace)",
  
  sprintf(
    R"($wt_{i}$ & Car weight in 1000 lbs & %s & %s & %s & %s \\)",
    fmt(stats_wt["Mean"]), fmt(stats_wt["SD"]),
    fmt(stats_wt["Min"]),  fmt(stats_wt["Max"])
  ),

  R"(\addlinespace)",
  
  sprintf(
    R"($hp_{i}$ & Gross horsepower & %s & %s & %s & %s \\)",
    fmt(stats_hp["Mean"]), fmt(stats_hp["SD"]),
    fmt(stats_hp["Min"]),  fmt(stats_hp["Max"])
  ),
  
  R"(\addlinespace)",
  R"(\bottomrule)",
  R"(\end{tabular})",
  R"(\begin{tablenotes}[flushleft])",
  R"(\item Note: \textit{Add note here.})",
  R"(\end{tablenotes})",
  R"(\end{threeparttable})",
  R"(\end{table})"
)


# --- write to file ---
dir.create("draft/tables", recursive = TRUE, showWarnings = FALSE)
writeLines(lines, "draft/tables/summary-statistics.tex")



##################################
### Linear Regression Analysis ###
##################################

# Now let's try to explain the miles per gallon (mpg) based on the car's weight (wt)
# and horsepower (hp). We'll create two linear regression models:
model1 <- lm(mpg ~ wt, data = mtcars)
# summary(model1)

model2 <- lm(mpg ~ wt + hp, data = mtcars)
# summary(model2)


# Create LaTeX table and save it to draft/tables:

# --- Helper to extract coefficients, standard errors, and significance stars ---
star_suffix <- function(p) {
  if (p < 0.01) {
    "$^{***}$"
  } else if (p < 0.05) {
    "$^{**}$"
  } else if (p < 0.10) {
    "$^{*}$"
  } else {
    ""
  }
}

# --- Helper to format numbers with three decimal places ---
fmt_num <- function(x) sprintf("%.3f", x)

# --- Helper to get coefficient, standard error, and significance stars for a term ---
get_coef <- function(model, term) {
  cf <- summary(model)$coefficients
  if (!term %in% rownames(cf)) return(list(coef = "", se = ""))
  est <- cf[term, "Estimate"]
  se  <- cf[term, "Std. Error"]
  p   <- cf[term, "Pr(>|t|)"]
  coef_str <- paste0(fmt_num(est), star_suffix(p))
  se_str   <- paste0("(", fmt_num(se), ")")
  list(coef = coef_str, se = se_str)
}

# intercept
m1_int <- get_coef(model1, "(Intercept)")
m2_int <- get_coef(model2, "(Intercept)")

# weight
m1_wt  <- get_coef(model1, "wt")
m2_wt  <- get_coef(model2, "wt")

# horsepower
m1_hp  <- get_coef(model1, "hp")   # will be "" for model 1
m2_hp  <- get_coef(model2, "hp")

# observations
n1 <- nobs(model1)
n2 <- nobs(model2)

# ---------- build LaTeX exactly in your style ----------
lines <- c(
  R"(\begin{table}[htbp])",
  R"(\centering)",
  R"(\caption{Linear Regression Results})",
  R"(\label{tab:main_results})",
  R"(\begin{threeparttable})",
  R"(\footnotesize)",
  R"(\renewcommand{\arraystretch}{1.2})",
  R"(\begin{tabular}{@{}l>{\centering\arraybackslash}p{4cm}>{\centering\arraybackslash}p{4cm}@{}})",
  R"(\toprule)",
  R"(& \multicolumn{2}{c}{$mpg_{i}$} \\)",
  R"(\cmidrule(lr){2-3})",
  R"(& Model 1 & Model 2 \\)",
  R"(\addlinespace)",
  R"(\midrule)",
  R"(\addlinespace)",
  
  sprintf(R"($wt_{i}$        & %s & %s \\)", m1_wt$coef,  m2_wt$coef),
  sprintf(R"(                & %s        & %s       \\)",  m1_wt$se,   m2_wt$se),
  
  R"(\addlinespace)",
  
  sprintf(R"($hp_{i}$        & %s & %s \\)", m1_hp$coef,  m2_hp$coef),
  sprintf(R"(                & %s        & %s        \\)", m1_hp$se,   m2_hp$se),
  
  R"(\addlinespace)",
  
  sprintf(R"($Intercept$     & %s & %s \\)", m1_int$coef, m2_int$coef),
  sprintf(R"(                & %s        & %s       \\)",  m1_int$se,  m2_int$se),
  
  R"(\addlinespace)",
  R"(\midrule)",
  R"(\addlinespace)",
  
  sprintf(R"(Observations & %d & %d \\)", n1, n2),
  
  R"(\addlinespace)",
  R"(\bottomrule)",
  R"(\end{tabular})",
  
  R"(\begin{tablenotes}[flushleft])",
  R"(\item Note: Standard errors are in parentheses. $^{*} p < 0.1$; $^{**} p < 0.05$; $^{***} p < 0.01$.)",
  R"(\end{tablenotes})",
  
  R"(\end{threeparttable})",
  R"(\end{table})"
)


# --- write to file ---
dir.create("draft/tables", recursive = TRUE, showWarnings = FALSE)
writeLines(lines, "draft/tables/main-results.tex")
