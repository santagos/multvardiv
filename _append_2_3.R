# Rényi divergence

# Degrees of freedom
nu <- 2
Sigma2 <- rbind(c(1, 0.3, 0.1), c(0.3, 1, 0.4), c(0.1, 0.4, 1))

# Values of the proportionality coefficient
S <- c(seq(0.1, 1, by = 0.1), seq(2, 70, by = 2))

# Rényi divergence
times <- iter <- numeric(length = length(S))
for (i in 1:length(S)) {
  s <- S[i]
  times[i] <- system.time(
    d <- diststudent(nu1 = nu, Sigma1 = s*Sigma, nu2 = nu, Sigma2 = Sigma,
                     dist = "renyi", bet = 0.25)
  )["elapsed"]
  iter[i] <- attr(d, "k")
}

# Plot of the execution times
renyi_exetime <- data.frame(s = S, iter = iter, exetime = times)
plot(exetime~s, data = renyi_exetime, type = "b", pch = 16,
     xlab = "s", ylab = "Execution time")
axis(side = 1, at = 1, labels = 1, cex.axis = 1.5)


# Kullback-Leibler divergence

# Degrees of freedom
nu <- 2
Sigma2 <- matrix(c(1, 0.3, 0.1, 0.3, 1, 0.4, 0.1, 0.4, 1), nrow = 3)

# Values of the proportionality coefficient
S <- c(seq(0.1, 1, by = 0.1), seq(2, 50, by = 2))

# Kullback-Leibler divergence
times <- iter <- numeric(length = length(S))
for (i in 1:length(S)) {
  s <- S[i]
  times[i] <- system.time(
    d <- kld(nu1 = nu, Sigma1 = s*Sigma, nu2 = nu, Sigma2 = Sigma,
             distribution = "mtd")
  )["elapsed"]
  iter[i] <- attr(d, "k")
}

# Plot of the execution times
kl_exetime <- data.frame(s = S, iter = iter, exetime = times)
plot(exetime~s, data = kl_exetime, type = "b", pch = 16,
     xlab = "s", ylab = "Execution time")
axis(side = 1, at = 1, labels = 1, cex.axis = 1.5)
