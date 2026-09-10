# Load the execution times
exetime <- readRDS("exetimes/renyikl_2_3.rds")


# Plot the execution times among the proportionality coefficients

par(mfrow = c(2, 2))
plot(renyi_iter~s, data = exetime, type = "b", pch = 16,
     xlab = "s", ylab = "Number of iterations")
plot(renyi_exetime~s, data = exetime, type = "b", pch = 16,
     xlab = "s", ylab = "Execution time (s)")
plot(renyi_div~s, data = exetime, type = "b", pch = 16,
     xlab = "s", ylab = "Computed divergence")

par(mfrow = c(2, 2))
plot(kl_iter~s, data = exetime, type = "b", pch = 16,
     xlab = "s", ylab = "Number of iterations")
plot(kl_exetime~s, data = exetime, type = "b", pch = 16,
     xlab = "s", ylab = "Execution time (s)")
plot(kl_div~s, data = exetime, type = "b", pch = 16,
     xlab = "s", ylab = "Computed divergence")
