s <- 3

# Values of Sigma1[1, 1]
s1 <- c(seq(0.1, s, by = 0.05), seq(s+1, 70, by = 1))

# The other parameters
nu <- 1
Sigma1 <- Sigma2 <- matrix(c(s, 0.3, 0.3, 1), nrow = 2)
Sigma1[1, 1] <- NA

# Renyi divergence, beta = 0.25
b <- 0.25
renyi_0_25 <- sapply(s1, function(s1) {
  Sigma1[1, 1] <- s1
  diststudent(nu1 = 1, Sigma1 = Sigma1, nu2 = 1, Sigma2 = Sigma2,
              dist = "renyi", bet = b)
})

# Renyi divergence, beta = 1.5
b <- 1.5
renyi_1_5 <- sapply(s1, function(s1) {
  Sigma1[1, 1] <- s1
  diststudent(nu1 = 1, Sigma1 = Sigma1, nu2 = 1, Sigma2 = Sigma2,
              dist = "renyi", bet = b)
})

# Battacharyya divergence
bhattacharyya <- sapply(s1, function(s1) {
  Sigma1[1, 1] <- s1
  diststudent(nu1 = 1, Sigma1 = Sigma1, nu2 = 1, Sigma2 = Sigma2,
              dist = "bhattacharyya")
})

# Hellinger divergence
hellinger <- sapply(s1, function(s1) {
  Sigma1[1, 1] <- s1
  diststudent(nu1 = 1, Sigma1 = Sigma1, nu2 = 1, Sigma2 = Sigma2,
              dist = "hellinger")
})

# Kullback-Leibler divergence
kullback_leibler <- sapply(s1, function(s1) {
  Sigma1[1, 1] <- s1
  kld(Sigma1 = Sigma1, Sigma2 = Sigma2, distribution = "mcd")
})

# Table of the results
divS1 <- data.frame(
  s1 = s1,
  renyi_0_25 = renyi_0_25,
  renyi_1_5 = renyi_1_5,
  bhattacharyya = bhattacharyya,
  hellinger = hellinger,
  kullback_leibler = kullback_leibler
)

plot(renyi_0_25~s1, data = divS1, type = "b", pch = 16,
     xlab = substitute(Sigma[1][1]), ylab = "Divergence")
axis(side = 1, at = Sigma2[1, 1], cex.axis = 1.2)

plot(renyi_1_5~s1, data = divS1, type = "b", pch = 16,
     xlab = substitute(Sigma[1][1]), ylab = "Divergence")
axis(side = 1, at = Sigma2[1, 1], cex.axis = 1.2)

plot(bhattacharyya~s1, data = divS1, type = "b", pch = 16,
     xlab = substitute(Sigma[1][1]), ylab = "Divergence")
axis(side = 1, at = Sigma2[1, 1], cex.axis = 1.2)

plot(hellinger~s1, data = divS1, type = "b", pch = 16,
     xlab = substitute(Sigma[1][1]), ylab = "Divergence")
axis(side = 1, at = Sigma2[1, 1], cex.axis = 1.2)

plot(kullback_leibler~s1, data = divS1, type = "b", pch = 16,
     xlab = substitute(Sigma[1][1]), ylab = "Divergence")
axis(side = 1, at = Sigma2[1, 1], cex.axis = 1.2)
