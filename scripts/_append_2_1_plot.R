library(microbenchmark)

# Load the execution times
renyi_exetime <- readRDS("exetimes/renyi_2_1.rds")
kl_exetime <- readRDS("exetimes/kl_2_1.rds")

# Plot the execution times among the wished precision
boxplot(renyi_exetime$exetime, main = "Rényi divergence - microbenchmark timings",
        xlab = "Precision", ylab = "Execution time (s)",
        xaxt = "n", xlim = c(0.9, 16.1))
axis(1, at = -log10(renyi_exetime$epsilon) + 1,
     labels = parse(text = paste0("10^", log10(renyi_exetime$epsilon))))
axis(1, line = 1.2, tick = FALSE, at = -log10(renyi_exetime$epsilon) + 1,
     labels = paste0("(", sapply(renyi_exetime$div, attr, "k"), " it.)")
)

boxplot(kl_exetime$exetime, main = "Kullback-Leibler divergence - microbenchmark timings",
        xlab = "Precision", ylab = "Execution time (s)",
        xaxt = "n", xlim = c(0.9, 16.1))
axis(1, at = -log10(kl_exetime$epsilon) + 1,
     labels = parse(text = paste0("10^", log10(kl_exetime$epsilon))))
axis(1, line = 1.2, tick = FALSE, at = -log10(kl_exetime$epsilon) + 1,
     labels = paste0("(", sapply(kl_exetime$div, attr, "k"), " it.)")
)
