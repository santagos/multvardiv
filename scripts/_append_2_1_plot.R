# Load the execution times
renyi_exetime <- readRDS("exetimes/renyi_2_1.rds")
kl_exetime <- readRDS("exetimes/kl_2_1.rds")

# Plot the execution times among the wished precision
plot(exetime~eps, data = renyi_exetime, type = "b", log = "x",
     pch = 16, xaxt = "n", xlab = "Precision", ylab = "Execution time")
axis(1, at = renyi_exetime$eps, labels = parse(text = paste0("10^", log10(renyi_exetime$eps))))
plot(exetime~eps, data = kl_exetime, type = "b", log = "x",
     pch = 16, xaxt = "n", xlab = "Precision", ylab = "Execution time")
axis(1, at = kl_exetime$eps, labels = parse(text = paste0("10^", log10(kl_exetime$eps))))
