nu <- 2#5

# Values of nu1
nu1 <- c(seq(0.1, nu, by = 0.1), seq(nu+1, 20, by = 1))

# Fixed values of the other parameters
nu2 <- nu
Sigma <- matrix(c(1, 0.3, 0.3, 1), nrow = 2)

# Values of lambda*nu1/nu2
nulambda <- nu1/nu2

# Rényi divergence, beta = 0.25
b <- 0.25
renyi_0_25 <- sapply(nu1, function(nu) {
  diststudent(nu1 = nu, Sigma1 = Sigma,
              nu2 = nu2, Sigma2 = Sigma,
              dist = "renyi", bet = b)
})

# Rényi divergence, beta = 1.5
b <- 1.5
renyi_1_5 <- sapply(nu1, function(nu) {
  diststudent(nu1 = nu, Sigma1 = Sigma,
              nu2 = nu2, Sigma2 = Sigma,
              dist = "renyi", bet = b)
})

# Battacharyya divergence
bhattacharyya <- sapply(nu1, function(nu) {
  diststudent(nu1 = nu, Sigma1 = Sigma,
              nu2 = nu2, Sigma2 = Sigma,
              dist = "bhattacharyya")
})

# Hellinger divergence
hellinger <- sapply(nu1, function(nu) {
  diststudent(nu1 = nu, Sigma1 = Sigma,
              nu2 = nu2, Sigma2 = Sigma,
              dist = "hellinger")
})

# Kullback-Leibler divergence
kullback_leibler <- sapply(nu1, function(nu) {
  kld(Sigma1 = Sigma, Sigma2 = Sigma,
      nu1 = nu, nu2 = nu2,
      distribution = "mtd")
})

# Table of the results
divnu <- data.frame(
  nu1 = nu1,
  nulambda = nulambda,
  renyi_0_25 = renyi_0_25,
  renyi_1_5 = renyi_1_5,
  bhattacharyya = bhattacharyya,
  hellinger = hellinger,
  kullback_leibler = kullback_leibler
)

plot(renyi_0_25~nu1, data = divnu, type = "b", pch = 16,
     xlab = substitute(nu[1]), ylab = "Divergence", ylim = c(0, 0.6))
axis(side = 1, at = nu2, cex = 1.2)

plot(renyi_1_5~nu1, data = divnu, type = "b", pch = 16,
     xlab = substitute(nu[1]), ylab = "Divergence", ylim = c(0, 0.6))
axis(side = 1, at = nu2, cex = 1.2)

plot(bhattacharyya~nu1, data = divnu, type = "b", pch = 16,
     xlab = substitute(nu[1]), ylab = "Divergence", ylim = c(0, 0.6))
axis(side = 1, at = nu2, cex = 1.2)

plot(hellinger~nu1, data = divnu, type = "b", pch = 16,
     xlab = substitute(nu[1]), ylab = "Divergence", ylim = c(0, 0.6))
axis(side = 1, at = nu2, cex = 1.2)

plot(kullback_leibler~nu1, data = divnu, type = "b", pch = 16,
     xlab = substitute(nu[1]), ylab = "Divergence", ylim = c(0, 0.6))
axis(side = 1, at = nu2, cex = 1.2)
