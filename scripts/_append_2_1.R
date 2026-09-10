# Successive values of the precision
epsilon <- c(1, 1e-1, 1e-2, 1e-3, 1e-4, 1e-5, 1e-6, 1e-7, 1e-8, 1e-9,
             1e-10, 1e-11, 1e-12, 1e-13, 1e-14, 1e-15)


# Renyi divergence

nu1 <- 2
nu2 <- 4

times <- iter <- numeric(4)

Sigma1 = rbind(c(1, 0.6, 0.2), c(0.6, 1, 0.3), c(0.2, 0.3, 1))
Sigma2 = rbind(c(1, 0.3, 0.1), c(0.3, 1, 0.4), c(0.1, 0.4, 1))

times <- iter <- numeric(length = length(epsilon))
for (i in 1:length(epsilon)) {
  eps <- epsilon[i]
  times[i] <- system.time(
    d <- diststudent(nu1 = nu1, Sigma1 = Sigma1, nu2 = nu2, Sigma2 = Sigma2,
                     dist = "renyi", bet = 0.25, eps = eps)
  )["elapsed"]
  iter[i] <- attr(d, "k")
}

renyi_exetime6 <- times[7]
renyi_exetime <- data.frame(eps = epsilon, iter = iter,
                            exetime = times, exetnorm = times/renyi_exetime6)


# Kullback-Leibler divergence

times <- iter <- numeric(length = length(epsilon))
for (i in 1:length(epsilon)) {
  eps <- epsilon[i]
  times[i] <- system.time(
    d <- kld(nu1 = nu1, Sigma1 = Sigma1, nu2 = nu2, Sigma2 = Sigma2,
             distribution = "mtd", eps = eps)
  )["elapsed"]
  iter[i] <- attr(d, "k")
}

kl_exetime6 <- times[7]
kl_exetime <- data.frame(eps = epsilon, iter = iter,
                         exetime = times, exetnorm = times/kl_exetime6)


# Save the execution times
saveRDS(renyi_exetime, file = "exetimes/renyi_2_1.rds")
saveRDS(kl_exetime, file = "exetimes/kl_2_1.rds")
