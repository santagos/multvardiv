library(microbenchmark)

# Load the execution times
renyi_exetime <- readRDS("exetimes/renyi_2_1.rds")
kl_exetime <- readRDS("exetimes/kl_2_1.rds")

if (knitr::is_html_output()) {
  precision <- paste0("10<sup>", log10(renyi_exetime$epsilon), "</sup>")
} else {
  precision <- paste0("$10^{", log10(renyi_exetime$epsilon), "}$")
}

# Display the table of execution time among the whished precision
library(kableExtra)
renyi <- summary(renyi_exetime$exetime)[-8]
renyi$expr <- as.numeric(as.character(renyi$expr))
kl <- summary(kl_exetime$exetime)[-8]
kl$expr <- as.numeric(as.character(kl$expr))
merge(renyi, kl, by = "expr", sort = FALSE) |>
  kbl(col.names = c("Whished precision", rep(c(
    "Minimum", "1st quartile", "Mean", "Median", "3rd quartile", "Maximum"),
    2)
  ), digits = c(15, rep(2, 12))) |>
  add_header_above(c(" " = 1,
                     "Rényi divergence of order β=0.25" = 6,
                     "Kullback-Leibler divergence" = 6))
