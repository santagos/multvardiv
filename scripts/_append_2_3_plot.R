library(microbenchmark)

# Load the execution times
renyi_exetime <- readRDS("exetimes/renyi_2_3.rds")
kl_exetime <- readRDS("exetimes/kl_2_3.rds")

S <- as.numeric(substring(levels(renyi_exetime$expr), 3))

# Plot the execution times among the wished precision
boxplot(renyi_exetime, main = "Rényi divergence - microbenchmark timings",
        xlab = "s", ylab = "Execution time (s)", names = S, at = log(S))

boxplot(kl_exetime, main = "Kullback-Leibler divergence - microbenchmark timings",
        xlab = "s", ylab = "Execution time (s)", names = S, at = log(S))
