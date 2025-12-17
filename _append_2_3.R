# Rényi divergence

# Degrees of freedom
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

# Degrees of freedom
nu <- 2
Sigma2 <- matrix(c(1, 0.3, 0.1, 0.3, 1, 0.4, 0.1, 0.4, 1), nrow = 3)

# Values of the proportionality coefficient
S <- c(seq(0.1, 1, by = 0.1), seq(2, 70, by = 2))

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


# Plot of the execution times
exetime <- merge(renyi, kl)

par(mfrow = c(2, 2), mar = c(4.1, 4.1, 3.1, 2.1))
plot(renyi_iter~s, data = exetime, type = "b", pch = 16,
     xlab = "s", ylab = "Number of iterations")
plot(kl_iter~s, data = exetime, type = "b", pch = 16,
     xlab = "s", ylab = "Execution time")
plot(renyi_div~s, data = exetime, type = "b", pch = 16,
     xlab = "s", ylab = "Computed divergence")

par(mfrow = c(2, 2), mar = c(4.1, 4.1, 3.1, 2.1))
plot(kl_iter~s, data = exetime, type = "b", pch = 16,
     xlab = "s", ylab = "Number of iterations")
plot(kl_exetime~s, data = exetime, type = "b", pch = 16,
     xlab = "s", ylab = "Execution time")
plot(kl_div~s, data = exetime, type = "b", pch = 16,
     xlab = "s", ylab = "Computed divergence")

# legend("topleft", legend = c("Rényi", "Kullback-Leibler"), col = 1:2, pch = 16)
# matplot(x = exetime$kl_div,
#         y = cbind(exetime$renyi_exetime, exetime$kl_exetime), type = "bb",
#         pch = 16, lty = 1, xlab = "Divergence", ylab = "Execution time")
# legend("topleft", legend = c("Rényi", "Kullback-Leibler"), col = 1:2, pch = 16)
