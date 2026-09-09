# Parameters
nu <- 2
Sigma2 <- rbind(c(1, 0.3, 0.1), c(0.3, 1, 0.4), c(0.1, 0.4, 1))

# Values of the proportionality coefficient
S <- c(seq(0.1, 1, by = 0.1), seq(2, 70, by = 2))


# Rényi divergence
renyitimes <- iter <- renyidiv <- numeric(length = length(S))
for (i in 1:length(S)) {
  s <- S[i]
  renyitimes[i] <- system.time(
    d <- diststudent(nu1 = nu, Sigma1 = s*Sigma, nu2 = nu, Sigma2 = Sigma,
                     dist = "renyi", bet = 0.25)
  )["elapsed"]
  renyidiv[i] <- d
  iter[i] <- attr(d, "k")
}
renyi <- data.frame(s = S, renyi_iter = iter, renyi_exetime = renyitimes,
                    renyi_div = renyidiv)


# Kullback-Leibler divergence
kltimes <- iter <- kldiv <- numeric(length = length(S))
for (i in 1:length(S)) {
  s <- S[i]
  kltimes[i] <- system.time(
    d <- kld(nu1 = nu, Sigma1 = s*Sigma, nu2 = nu, Sigma2 = Sigma,
             distribution = "mtd")
  )["elapsed"]
  kldiv[i] <- d
  iter[i] <- attr(d, "k")
}
kl <- data.frame(s = S, kl_iter = iter, kl_exetime = kltimes,
                 kl_div = kldiv)


exetime <- merge(renyi, kl)


saveRDS(exetime, file = "renyikl_2_3.rds")
