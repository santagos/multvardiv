# The parameters
Sigma <- matrix(c(1, 0.3, 0.3, 1), nrow = 2)
bet <- 0.74

# Values of the proportionality coefficient
s <- c(seq(0.05, 1, by = 0.05), seq(2, 70, by = 2))

# Kullback-Leibler divergence
kullback_leibler <- sapply(s, function(s) {
  kld(Sigma1 = s*Sigma, Sigma2 = Sigma, beta1 = bet, beta2 = bet,
      distribution = "mggd")
})

# Table of the results
divSigma <- data.frame(
  facteur = s,
  kullback_leibler = kullback_leibler
)

plot(kullback_leibler~facteur, data = divSigma, type = "b", pch = 16,
     xlab = "s", ylab = "Divergence")
axis(side = 1, at = 1, labels = 1, cex.axis = 1.5)
