library(microbenchmark)

# Parameters
nu <- 2
Sigma <- rbind(c(1, 0.3, 0.1), c(0.3, 1, 0.4), c(0.1, 0.4, 1))

# Values of the proportionality coefficient
S <- c(0.1, 0.5, 1, 5, 10, 20, 30)


# Rényi divergence
expr <- parse(text = paste0(
  "diststudent(nu1 = nu, Sigma1 = ", S, "*Sigma, nu2 = nu, Sigma2 = Sigma, ",
  "dist = 'renyi', bet = 0.25)"
)) |>
  as.list()
names(expr) <- S

renyi_exetime <- microbenchmark(list = expr, times = 30)
levels(renyi_exetime$expr) <- paste0("s=", S)


# Kullback-Leibler divergence
expr <- parse(text = paste0(
  "kld(nu1 = nu, Sigma1 = ", S, "*Sigma, nu2 = nu, Sigma2 = Sigma, ",
  "distribution = 'mtd')"
)) |>
  as.list()
names(expr) <- S

kl_exetime <- microbenchmark(list = expr, times = 30)
levels(kl_exetime$expr) <- paste0("s=", S)


# Save the execution times
saveRDS(renyi_exetime, file = "exetimes/renyi_2_3.rds")
saveRDS(kl_exetime, file = "exetimes/kl_2_3.rds")
