s <- 3

# Values of Sigma1[1, 1]
s1 <- c(seq(0.1, s, by = 0.05), seq(s+1, 70, by = 1))

# The other parameters
nu <- 1
Sigma1 <- Sigma2 <- matrix(c(s, 0.3, 0.3, 1), nrow = 2)
Sigma1[1, 1] <- NA

# Values of lambda*nu1/nu2
invS2 <- solve(Sigma2)
lambdanu <- sapply(s1, function(s) {
  Sigma1[1, 1] <- s
  sort(eigen(Sigma1 %*% invS2, only.values = TRUE)$values, decreasing = FALSE)
})
ln1 <- lambdanu[1, ]
lnp <- lambdanu[2, ]

# Renyi divergence, beta = 0.25
b <- 0.25
renyi_0_25 <- sapply(s1, function(s1) {
  Sigma1[1, 1] <- s1
  diststudent(nu1 = nu, Sigma1 = Sigma1, nu2 = nu, Sigma2 = Sigma2,
              dist = "renyi", bet = b)
})

# Renyi divergence, beta = 1.5
b <- 1.5
renyi_1_5 <- sapply(s1, function(s1) {
  Sigma1[1, 1] <- s1
  diststudent(nu1 = nu, Sigma1 = Sigma1, nu2 = nu, Sigma2 = Sigma2,
              dist = "renyi", bet = b)
})

# Battacharyya divergence
bhattacharyya <- sapply(s1, function(s1) {
  Sigma1[1, 1] <- s1
  diststudent(nu1 = nu, Sigma1 = Sigma1, nu2 = nu, Sigma2 = Sigma2,
              dist = "bhattacharyya")
})

# Hellinger divergence
hellinger <- sapply(s1, function(s1) {
  Sigma1[1, 1] <- s1
  diststudent(nu1 = nu, Sigma1 = Sigma1, nu2 = nu, Sigma2 = Sigma2,
              dist = "hellinger")
})

# Kullback-Leibler divergence
kullback_leibler <- sapply(s1, function(s1) {
  Sigma1[1, 1] <- s1
  kld(Sigma1 = Sigma1, Sigma2 = Sigma2, nu1 = nu, nu2 = nu,
      distribution = "mtd")
})

# Table of the results
divS1 <- data.frame(
  s1 = s1, ln1 = ln1, lnp = lnp,
  renyi_0_25 = renyi_0_25,
  renyi_1_5 = renyi_1_5,
  bhattacharyya = bhattacharyya,
  hellinger = hellinger,
  kullback_leibler = kullback_leibler
)

# plot(ln1~s1, data = divS1, type = "b", pch = 16,
#      xlab = substitute(Sigma[1][1]), ylab = "lambda1 * nu1/nu2")
# axis(side = 1, at = Sigma2[1, 1], labels = substitute(Sigma[1][1]), cex.axis = 1.5)
# 
# plot(lnp~s1, data = divS1, type = "b", pch = 16,
#      xlab = substitute(Sigma[1][1]), ylab = "lambdap * nu1/nu2")
# axis(side = 1, at = Sigma2[1, 1], labels = substitute(Sigma[1][1]), cex.axis = 1.5)

plot(renyi_0_25~s1, data = divS1, type = "b", pch = 16,
     xlab = substitute(Sigma[1][1]), ylab = "Divergence")
axis(side = 1, at = Sigma2[1, 1], labels = substitute(Sigma[1][1]), cex.axis = 1.5)

plot(renyi_1_5~s1, data = divS1, type = "b", pch = 16,
     xlab = substitute(Sigma[1][1]), ylab = "Divergence")
axis(side = 1, at = Sigma2[1, 1], labels = substitute(Sigma[1][1]), cex.axis = 1.5)

plot(0, 0, type = "n", bty = "n", xaxt = "n", yaxt = "n", xlab = "", ylab = "")
plot(bhattacharyya~s1, data = divS1, type = "b", pch = 16,
     xlab = substitute(Sigma[1][1]), ylab = "Divergence")
axis(side = 1, at = Sigma2[1, 1], labels = substitute(Sigma[1][1]), cex.axis = 1.5)

plot(hellinger~s1, data = divS1, type = "b", pch = 16,
     xlab = substitute(Sigma[1][1]), ylab = "Divergence")
axis(side = 1, at = Sigma2[1, 1], labels = substitute(Sigma[1][1]), cex.axis = 1.5)

plot(kullback_leibler~s1, data = divS1, type = "b", pch = 16,
     xlab = substitute(Sigma[1][1]), ylab = "Divergence")
axis(side = 1, at = Sigma2[1, 1], labels = substitute(Sigma[1][1]), cex.axis = 1.5)
