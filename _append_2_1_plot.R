readRDS("renyi_2_1.rds")
readRDS("kl_2_1.rds")

plot(exetime~eps, data = renyi_exetime, type = "b", log = "x",
     pch = 16, xaxt = "n", xlab = "Precision", ylab = "Execution time")
axis(1, at = epsilon, labels = parse(text = paste0("10^", log10(epsilon))))
plot(exetime~eps, data = kl_exetime, type = "b", log = "x",
     pch = 16, xaxt = "n", xlab = "Precision", ylab = "Execution time")
axis(1, at = epsilon, labels = parse(text = paste0("10^", log10(epsilon))))
