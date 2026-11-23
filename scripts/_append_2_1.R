library(microbenchmark)


# Successive values of the precision
epsilon <- c(1, 1e-1, 1e-2, 1e-3, 1e-4, 1e-5, 1e-6, 1e-7, 1e-8, 1e-9,
             1e-10, 1e-11, 1e-12, 1e-13, 1e-14, 1e-15)


# Renyi divergence

nu1 <- 2
nu2 <- 4

Sigma1 = rbind(c(1, 0.6, 0.2), c(0.6, 1, 0.3), c(0.2, 0.3, 1))
Sigma2 = rbind(c(1, 0.3, 0.1), c(0.3, 1, 0.4), c(0.1, 0.4, 1))

expr <- parse(text = paste0(
  "drenyi_", -log10(epsilon), " <- diststudent(nu1 = nu1, Sigma1 = Sigma1, nu2 = nu2, Sigma2 = Sigma2, ",
  "dist = 'renyi', bet = 0.25, eps = ", epsilon, ")"
)) |>
  as.list()
names(expr) <- -log10(epsilon)

renyi_exetime <- microbenchmark(list = expr, times = 30)
levels(renyi_exetime$expr) <- epsilon
drenyi <- lapply(paste0("drenyi_", -log10(epsilon)), get)
names(drenyi) <- -log10(epsilon)


# Kullback-Leibler divergence

expr <- parse(text = paste0(
  "dkl_", -log10(epsilon), " <- kld(nu1 = nu1, Sigma1 = Sigma1, nu2 = nu2, Sigma2 = Sigma2, ",
  "distribution = 'mtd', eps = ", epsilon, ")"
)) |>
  as.list()
names(expr) <- -log10(epsilon)

kl_exetime <- microbenchmark(list = expr, times = 30)
levels(kl_exetime$expr) <- epsilon
dkl <- lapply(paste0("dkl_", -log10(epsilon)), get)
names(dkl) <- -log10(epsilon)


# Save the execution times
saveRDS(list(exetime = renyi_exetime, div = drenyi, epsilon = epsilon),
        file = "exetimes/renyi_2_1.rds")
saveRDS(list(exetime = kl_exetime, div = dkl, epsilon = epsilon),
        file = "exetimes/kl_2_1.rds")
