# Load the execution times
renyi_exetime <- readRDS("exetimes/renyi_2_1.rds")
kl_exetime <- readRDS("exetimes/kl_2_1.rds")

# Plot the execution times among the wished precision
boxplot(renyi_exetime$exetime, main = "Rényi divergence - microbenchmark timings",
        xlab = "Precision", ylab = "Execution time (s)", xaxt = "n")
axis(1, at = -log10(renyi_exetime$epsilon) + 1,
     labels = parse(text = paste0("10^", log10(renyi_exetime$epsilon))))

boxplot(kl_exetime$exetime, main = "Kullback-Leibler divergence - microbenchmark timings",
        xlab = "Precision", ylab = "Execution time (s)", xaxt = "n")
axis(1, at = -log10(kl_exetime$epsilon) + 1,
     labels = parse(text = paste0("10^", log10(kl_exetime$epsilon))))
