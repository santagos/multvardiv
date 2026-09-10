renyi_exetime <- readRDS("exetimes/renyi_2_1.rds")
kl_exetime <- readRDS("exetimes/kl_2_1.rds")

if (knitr::is_html_output()) {
  precision <- paste0("10<sup>", log10(renyi_exetime$eps), "</sup>")
} else {
  precision <- paste0("$10^{", log10(renyi_exetime$eps), "}$")
}

# Table of the execution times

library(kableExtra)
data.frame(precision, renyi_exetime[c(2, 4)], kl_exetime[c(2, 4)]) %>%
  kbl(
    col.names = c("Precision", "Number of iterations", "Execution time",
                  "Number of iterations", "Execution time"),
    digits = c(16, 0, 4, 0, 4), escape = FALSE
  ) %>%
  add_header_above(c(" " = 1, "Rényi divergence of order $\\\\beta=0.25$" = 2,
                     "Kullback-Leibler divergence" = 2), escape = FALSE)
