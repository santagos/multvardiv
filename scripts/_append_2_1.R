# Successive values of the precision
epsilon <- c(1, 1e-1, 1e-2, 1e-3, 1e-4, 1e-5, 1e-6, 1e-7, 1e-8, 1e-9,
             1e-10, 1e-11, 1e-12, 1e-13, 1e-14, 1e-15)


# Renyi divergence

nu1 <- 2
nu2 <- 4

Sigma1 = rbind(c(1, 0.6, 0.2), c(0.6, 1, 0.3), c(0.2, 0.3, 1))
Sigma2 = rbind(c(1, 0.3, 0.1), c(0.3, 1, 0.4), c(0.1, 0.4, 1))

expr <- parse(text = paste0(
  "drenyi <- diststudent(nu1 = nu1, Sigma1 = Sigma1, nu2 = nu2, Sigma2 = Sigma2, ",
  "dist = 'renyi', bet = 0.25, eps = ", epsilon, ")"
)) |>
  as.list()
names(expr) <- -log10(epsilon)

times <- vector("list", length = length(epsilon))
iter <- numeric(length = length(epsilon))

renyi_exetime <- microbenchmark(list = expr)


# Kullback-Leibler divergence

expr <- parse(text = paste0(
  "dkl <- kld(nu1 = nu1, Sigma1 = Sigma1, nu2 = nu2, Sigma2 = Sigma2, ",
  "distribution = 'mtd', eps = ", epsilon, ")"
)) |>
  as.list()
names(expr) <- -log10(epsilon)

times <- vector("list", length = length(epsilon))
iter <- numeric(length = length(epsilon))

kl_exetime <- microbenchmark(list = expr)


# Save the execution times
saveRDS(list(exetime = renyi_exetime, epsilon = epsilon),
        file = "exetimes/renyi_2_1.rds")
saveRDS(list(exetime = kl_exetime, epsilon = epsilon),
        file = "exetimes/kl_2_1.rds")
