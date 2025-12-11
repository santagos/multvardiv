# The parameters
Sigma <- matrix(c(1, 0.3, 0.3, 1), nrow = 2)

# Values of the proportionality coefficient
s <- c(seq(0.05, 1, by = 0.05), seq(2, 70, by = 2))

# Renyi divergence, beta = 0.25
b <- 0.25
renyi_0_25 <- sapply(s, function(s) {
  diststudent(nu1 = 1, Sigma1 = s*Sigma, nu2 = 1, Sigma2 = Sigma,
              dist = "renyi", bet = b)
})

# Renyi divergence, beta = 1.5
b <- 1.5
renyi_1_5 <- sapply(s, function(s) {
  diststudent(nu1 = 1, Sigma1 = s*Sigma, nu2 = 1, Sigma2 = Sigma,
              dist = "renyi", bet = b)
})

# Battacharyya divergence
bhattacharyya <- sapply(s, function(s) {
  diststudent(nu1 = 1, Sigma1 = s*Sigma, nu2 = 1, Sigma2 = Sigma,
              dist = "bhattacharyya")
})

# Hellinger divergence
hellinger <- sapply(s, function(s) {
  diststudent(nu1 = 1, Sigma1 = s*Sigma, nu2 = 1, Sigma2 = Sigma,
              dist = "hellinger")
})

# Kullback-Leibler divergence
kullback_leibler <- sapply(s, function(s) {
  kld(Sigma1 = s*Sigma, Sigma2 = Sigma, distribution = "mcd")
})

# Table of the results
divSigma <- data.frame(
  facteur = s,
  renyi_0_25 = renyi_0_25,
  renyi_1_5 = renyi_1_5,
  bhattacharyya = bhattacharyya,
  hellinger = hellinger,
  kullback_leibler = kullback_leibler
)

plot(renyi_0_25~facteur, data = divSigma, type = "b", pch = 16,
     xlab = "s", ylab = "Divergence")
axis(side = 1, at = 1, labels = 1, cex.axis = 1.5)

plot(renyi_1_5~facteur, data = divSigma, type = "b", pch = 16,
     xlab = "s", ylab = "Divergence")
axis(side = 1, at = 1, labels = 1, cex.axis = 1.5)

plot(bhattacharyya~facteur, data = divSigma, type = "b", pch = 16,
     xlab = "s", ylab = "Divergence")
axis(side = 1, at = 1, labels = 1, cex.axis = 1.5)

plot(hellinger~facteur, data = divSigma, type = "b", pch = 16,
     xlab = "s", ylab = "Divergence")
axis(side = 1, at = 1, labels = 1, cex.axis = 1.5)

plot(kullback_leibler~facteur, data = divSigma, type = "b", pch = 16,
     xlab = "s", ylab = "Divergence")
axis(side = 1, at = 1, labels = 1, cex.axis = 1.5)
