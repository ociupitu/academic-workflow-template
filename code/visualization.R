library(datasets)
library(modelsummary)
library(ggplot2)

# If you run this script in R Studio, run this setwd() command (uncomment the line).
# setwd("~/academic-project-template-cursor")

# However, if you run this script inside Cursor (with the project template open), you do not need the setwd() command because the root directory is set automatically.

dir.create("draft/figures", showWarnings = FALSE)

mtcars <- mtcars

# Arrow style for axis lines to match the provided aesthetic
axis_arrow <- grid::arrow(length = unit(6, "pt"), type = "closed")

plot_wt <- ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point(color = "black", size = 2.6) +
  labs(
    x = "Weight (1000 lbs)",
    y = "Miles per Gallon (mpg)"
  ) +
  scale_x_continuous(expand = expansion(mult = c(0.02, 0.02))) +
  scale_y_continuous(expand = expansion(mult = c(0.02, 0.02))) +
  theme_minimal(base_family = "Times", base_size = 13) +
  theme(
    legend.position   = "none",
    axis.line.x       = element_line(colour = "gray25", linewidth = 0.6, arrow = axis_arrow),
    axis.line.y       = element_line(colour = "gray25", linewidth = 0.6, arrow = axis_arrow),
    axis.ticks        = element_line(colour = "gray25"),
    axis.text.x       = element_text(colour = "gray25", family = "Times", size = 16),
    axis.text.y       = element_text(colour = "gray25", family = "Times", size = 16),
    text              = element_text(family = "Times", size = 13),
    panel.grid        = element_blank()
  )

ggsave("draft/figures/scatter_mpg_wt.pdf", plot = plot_wt, width = 6, height = 4)


plot_hp <- ggplot(mtcars, aes(x = hp, y = mpg)) +
  geom_point(color = "black", size = 2.6) +
  labs(
    x = "Gross Horsepower (hp)",
    y = "Miles per Gallon (mpg)"
  ) +
  scale_x_continuous(expand = expansion(mult = c(0.02, 0.02))) +
  scale_y_continuous(expand = expansion(mult = c(0.02, 0.02))) +
  theme_minimal(base_family = "Times", base_size = 13) +
  theme(
    legend.position   = "none",
    axis.line.x       = element_line(colour = "gray25", linewidth = 0.6, arrow = axis_arrow),
    axis.line.y       = element_line(colour = "gray25", linewidth = 0.6, arrow = axis_arrow),
    axis.ticks        = element_line(colour = "gray25"),
    axis.text.x       = element_text(colour = "gray25", family = "Times", size = 16),
    axis.text.y       = element_text(colour = "gray25", family = "Times", size = 16),
    text              = element_text(family = "Times", size = 13),
    panel.grid        = element_blank()
  )

ggsave("draft/figures/scatter_mpg_hp.pdf", plot = plot_hp, width = 6, height = 4)
