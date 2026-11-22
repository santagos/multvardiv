library(microbenchmark)


nu1 <- 2
nu2 <- 4

# Renyi divergence

times <- iter <- numeric(4)

# Dim 1
Sigma1_1 <- 0.2
Sigma1_2 <- 0.3

# Dim 2
Sigma2_1 = rbind(c(1, 0.2), c(0.2, 1))
Sigma2_2 = rbind(c(1, 0.3), c(0.3, 1))

# Dim 3
Sigma3_1 = rbind(c(1, 0.6, 0.2), c(0.6, 1, 0.3), c(0.2, 0.3, 1))
Sigma3_2 = rbind(c(1, 0.3, 0.1), c(0.3, 1, 0.4), c(0.1, 0.4, 1))

# Dim 4
Sigma4_1 = rbind(c(1, 0.6, 0.2, 0), c(0.6, 1, 0.3, 0),
                 c(0.2, 0.3, 1, 0), c(0, 0, 0, 1))
Sigma4_2 = rbind(c(1, 0.3, 0.1, 0), c(0.3, 1, 0.4, 0),
                 c(0.1, 0.4, 1, 0), c(0, 0, 0, 1))

# Dim 5
Sigma5_1 = rbind(c(1, 0.6, 0.2, 0, 0), c(0.6, 1, 0.3, 0, 0),
                 c(0.2, 0.3, 1, 0, 0), c(0, 0, 0, 1, 0),
                 c(0, 0, 0, 0, 1))
Sigma5_2 = rbind(c(1, 0.3, 0.1, 0, 0), c(0.3, 1, 0.4, 0, 0),
                 c(0.1, 0.4, 1, 0, 0), c(0, 0, 0, 1, 0),
                 c(0, 0, 0, 0, 1))


expr <- parse(text = paste0(
  "drenyi", 1:5, " <- diststudent(nu1 = nu1, Sigma1 = ",
  "Sigma", 1:5, "_1, nu2 = nu2, Sigma2 = ",
  "Sigma", 1:5, "_2, dist = 'renyi', bet = 0.25, eps = 1e-3)"
)) |>
  as.list()
names(expr) <- paste0("dim", 1:5)

renyi_exetime <- microbenchmark(list = expr, times = 30)
levels(renyi_exetime$expr) <- paste("Dimension", 1:5)


expr <- parse(text = paste0(
  "dkl", 1:5, " <- kld(nu1 = nu1, Sigma1 = ",
  "Sigma", 1:5, "_1, nu2 = nu2, Sigma2 = ",
  "Sigma", 1:5, "_2, distribution = 'mtd', eps = 1e-3)"
)) |>
  as.list()
names(expr) <- paste0("dim", 1:5)

kl_exetime <- microbenchmark(list = expr, times = 30)
levels(kl_exetime$expr) <- paste("Dimension", 1:5)


# Save the execution times
saveRDS(renyi_exetime, file = "exetimes/renyi_2_2.rds")
saveRDS(kl_exetime, file = "exetimes/kl_2_2.rds")
