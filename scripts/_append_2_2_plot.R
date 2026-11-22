library(microbenchmark)

# Load the execution times
renyi_exetime <- readRDS("exetimes/renyi_2_2.rds")
kl_exetime <- readRDS("exetimes/kl_2_2.rds")

dims <- as.numeric(substring(levels(renyi_exetime$exetimes$expr), 11))
renyi_k <- sapply(renyi_exetime$div, attr, "k")
kl_k <- sapply(kl_exetime$div, attr, "k")

# Plot the execution times among the wished precision
boxplot(renyi_exetime$exetimes,
        main = "Rényi divergence - microbenchmark timings",
        xlab = "", ylab = "Execution time (s)",
        names = paste0("\n", "Dimension ", dims, "\n(", renyi_k, " iterations)"))

boxplot(kl_exetime$exetimes,
        main = "Kullback-Leibler divergence - microbenchmark timings",
        xlab = "", ylab = "Execution time (s)",
        names = paste0("\n", "Dimension ", dims, "\n(", kl_k, " iterations)"))
