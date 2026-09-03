nu1 <- 2
nu2 <- 4

# Renyi divergence

times <- iter <- numeric(4)

# Dim 1
Sigma1 <- 0.2
Sigma2 <- 0.3
times[1] <- system.time(
  d <- diststudent(nu1 = nu1, Sigma1 = Sigma1, nu2 = nu2, Sigma2 = Sigma2,
                   dist = "renyi", bet = 0.25)
)["elapsed"]
iter[1] <- attr(d, "k")

# Dim 2
Sigma1 = rbind(c(1, 0.2), c(0.2, 1))
Sigma2 = rbind(c(1, 0.3), c(0.3, 1))
times[2] <- system.time(
  d <- diststudent(nu1 = nu1, Sigma1 = Sigma1, nu2 = nu2, Sigma2 = Sigma2,
                   dist = "renyi", bet = 0.25)
)["elapsed"]
iter[2] <- attr(d, "k")

# Dim 3
Sigma1 = rbind(c(1, 0.6, 0.2), c(0.6, 1, 0.3), c(0.2, 0.3, 1))
Sigma2 = rbind(c(1, 0.3, 0.1), c(0.3, 1, 0.4), c(0.1, 0.4, 1))
times[3] <- system.time(
  d <- diststudent(nu1 = nu1, Sigma1 = Sigma1, nu2 = nu2, Sigma2 = Sigma2,
                   dist = "renyi", bet = 0.25)
)["elapsed"]
iter[3] <- attr(d, "k")

# Dim 4
Sigma1 = rbind(c(1, 0.6, 0.2, 0), c(0.6, 1, 0.3, 0),
               c(0.2, 0.3, 1, 0), c(0, 0, 0, 1))
Sigma2 = rbind(c(1, 0.3, 0.1, 0), c(0.3, 1, 0.4, 0),
               c(0.1, 0.4, 1, 0), c(0, 0, 0, 1))
times[4] <- system.time(
  d <- diststudent(nu1 = nu1, Sigma1 = Sigma1, nu2 = nu2, Sigma2 = Sigma2,
                   dist = "renyi", bet = 0.25)
)["elapsed"]
iter[4] <- attr(d, "k")

# Dim 5
Sigma1 = rbind(c(1, 0.6, 0.2, 0, 0), c(0.6, 1, 0.3, 0, 0),
               c(0.2, 0.3, 1, 0, 0), c(0, 0, 0, 1, 0),
               c(0, 0, 0, 0, 1))
Sigma2 = rbind(c(1, 0.3, 0.1, 0, 0), c(0.3, 1, 0.4, 0, 0),
               c(0.1, 0.4, 1, 0, 0), c(0, 0, 0, 1, 0),
               c(0, 0, 0, 0, 1))
times[5] <- system.time(
  d <- diststudent(nu1 = nu1, Sigma1 = Sigma1, nu2 = nu2, Sigma2 = Sigma2,
                   dist = "renyi", bet = 0.25)
)["elapsed"]
iter[5] <- attr(d, "k")

renyi_times <- times
renyi_iter <- iter
renyi_t3 <- renyi_times[3]
renyi_exetime <- data.frame(dim = 1:5, iter = renyi_iter, exetime = renyi_times/renyi_t3)


# Kullback-Leibler divergence

nu1 <- 2
nu2 <- 4

times <- iter <- numeric(4)

# Dim 1
Sigma1 <- 0.2
Sigma2 <- 0.3
times[1] <- system.time(
  d <- kld(nu1 = nu1, Sigma1 = Sigma1, nu2 = nu2, Sigma2 = Sigma2,
           distribution = "mtd")
)["elapsed"]
iter[1] <- attr(d, "k")

# Dim 2
Sigma1 = rbind(c(1, 0.2), c(0.2, 1))
Sigma2 = rbind(c(1, 0.3), c(0.3, 1))
times[2] <- system.time(
  d <- kld(nu1 = nu1, Sigma1 = Sigma1, nu2 = nu2, Sigma2 = Sigma2,
           distribution = "mtd")
)["elapsed"]
iter[2] <- attr(d, "k")

# Dim 3
Sigma1 = rbind(c(1, 0.6, 0.2), c(0.6, 1, 0.3), c(0.2, 0.3, 1))
Sigma2 = rbind(c(1, 0.3, 0.1), c(0.3, 1, 0.4), c(0.1, 0.4, 1))
times[3] <- system.time(
  d <- kld(nu1 = nu1, Sigma1 = Sigma1, nu2 = nu2, Sigma2 = Sigma2,
           distribution = "mtd")
)["elapsed"]
iter[3] <- attr(d, "k")

# Dim 4
Sigma1 = rbind(c(1, 0.6, 0.2, 0), c(0.6, 1, 0.3, 0),
               c(0.2, 0.3, 1, 0), c(0, 0, 0, 1))
Sigma2 = rbind(c(1, 0.3, 0.1, 0), c(0.3, 1, 0.4, 0),
               c(0.1, 0.4, 1, 0), c(0, 0, 0, 1))
times[4] <- system.time(
  d <- kld(nu1 = nu1, Sigma1 = Sigma1, nu2 = nu2, Sigma2 = Sigma2,
           distribution = "mtd")
)["elapsed"]
iter[4] <- attr(d, "k")

# Dim 5
Sigma1 = rbind(c(1, 0.6, 0.2, 0, 0), c(0.6, 1, 0.3, 0, 0),
               c(0.2, 0.3, 1, 0, 0), c(0, 0, 0, 1, 0),
               c(0, 0, 0, 0, 1))
Sigma2 = rbind(c(1, 0.3, 0.1, 0, 0), c(0.3, 1, 0.4, 0, 0),
               c(0.1, 0.4, 1, 0, 0), c(0, 0, 0, 1, 0),
               c(0, 0, 0, 0, 1))
times[5] <- system.time(
  d <- kld(nu1 = nu1, Sigma1 = Sigma1, nu2 = nu2, Sigma2 = Sigma2,
           distribution = "mtd")
)["elapsed"]
iter[5] <- attr(d, "k")

kl_times <- times
kl_iter <- iter
kl_t3 <- kl_times[3]
kl_exetime <- data.frame(dim = 1:5, iter = kl_iter, exetime = kl_times/kl_t3)


# Table of the execution times

library(kableExtra)
data.frame(renyi_exetime$dim, renyi_exetime[2:3], kl_exetime[2:3]) %>%
  kbl(col.names = c("Dimension", "Number of iterations", "Execution time",
                    "Number of iterations", "Execution time"),
      digits = c(0, 0, 3, 0, 3)) %>%
  add_header_above(c(" " = 1, "Rényi divergence of order $\\\\beta=0.25$" = 2,
                     "Kullback-Leibler divergence" = 2))
