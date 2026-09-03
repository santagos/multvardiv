bet <- 0.74

# Values of beta1
beta1 <- c(seq(0.05, bet, by = 0.01), seq(bet+1, 22, by = 2))

# Fixed values of the other parameters
beta2 <- bet
Sigma <- matrix(c(1, 0.3, 0.3, 1), nrow = 2)

# Kullback-Leibler divergence
kullback_leibler <- sapply(beta1, function(b) {
  kld(Sigma1 = Sigma, Sigma2 = Sigma,
      beta1 = b, beta2 = beta2,
      distribution = "mggd")
})

# Table of the results
divbeta <- data.frame(
  beta1 = beta1,
  kullback_leibler = kullback_leibler
)

plot(kullback_leibler~beta1, data = divbeta, type = "b", pch = 16,
     xlab = substitute(beta[1]), ylab = "Divergence", ylim = c(-0.1, 4))
axis(side = 1, at = beta2, cex.axis = 1.2)
