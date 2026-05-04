s <- 10#3

# Values of Sigma1[1, 1]
s1 <- c(seq(0.1, s, by = 0.05), seq(s+1, 100, by = 1))

# The other parameters
Sigma1 <- Sigma2 <- matrix(c(s, 0.3, 0.3, 1), nrow = 2)
Sigma1[1, 1] <- NA

bet <- 0.74

# Kullback-Leibler divergence
kullback_leibler <- sapply(s1, function(s1) {
  Sigma1[1, 1] <- s1
  kld(Sigma1 = Sigma1, Sigma2 = Sigma2, beta1 = bet, beta2 = bet,
      distribution = "mggd")
})

# Table of the results
divS1 <- data.frame(
  s1 = s1,
  kullback_leibler = kullback_leibler
)

plot(kullback_leibler~s1, data = divS1, type = "b", pch = 16,
     xlab = substitute(Sigma[1][1]), ylab = "Divergence")
axis(side = 1, at = Sigma2[1, 1], cex.axis = 1.2)
