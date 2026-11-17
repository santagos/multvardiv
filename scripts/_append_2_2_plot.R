library(microbenchmark)

# Load the execution times
renyi_exetime <- readRDS("exetimes/renyi_2_2.rds")
kl_exetime <- readRDS("exetimes/kl_2_2.rds")

# Plot the execution times among the wished precision
boxplot(renyi_exetime, main = "Rényi divergence - microbenchmark timings",
        xlab = "Dimension", ylab = "Execution time (s)")

boxplot(kl_exetime, main = "Kullback-Leibler divergence - microbenchmark timings",
        xlab = "Dimension", ylab = "Execution time (s)")
