# Load the execution times
renyi_exetime <- readRDS("exetimes/renyi_2_2.rds")
kl_exetime <- readRDS("exetimes/kl_2_2.rds")

# Display the table of execution time among the dimension
library(kableExtra)
merge(renyi_exetime[c(1, 2, 4)], kl_exetime[c(1, 2, 4)], by = "dim") %>%
  kbl(col.names = c("Dimension", "Number of iterations", "Execution time",
                    "Number of iterations", "Execution time"),
      digits = c(0, 0, 3, 0, 3)) %>%
  add_header_above(c(" " = 1, "Rényi divergence of order $\\\\beta=0.25$" = 2,
                     "Kullback-Leibler divergence" = 2), escape = FALSE)
