library(microbenchmark)

# Load the execution times
renyi_exetime <- readRDS("exetimes/renyi_2_2.rds")
kl_exetime <- readRDS("exetimes/kl_2_2.rds")

# Display the table of execution time among the dimension
library(kableExtra)
merge(summary(renyi_exetime)[-8], summary(kl_exetime)[-8], by = "expr") |>
  kbl(col.names = c("Dimension", rep(c(
    "Minimum", "1st quartile", "Mean", "Median", "3rd quartile", "Maximum"),
    2)
  )) |>
  add_header_above(c(" " = 1,
                     "Rényi divergence of order β=0.25" = 6,
                     "Kullback-Leibler divergence" = 6))
