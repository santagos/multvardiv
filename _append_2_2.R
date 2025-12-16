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

# # Dim 5
# Sigma1 = rbind(c(1, 0.6, 0.2, 0, 0), c(0.6, 1, 0.3, 0, 0),
#                c(0.2, 0.3, 1, 0, 0), c(0, 0, 0, 1, 0),
#                c(0, 0, 0, 0, 1))
# Sigma2 = rbind(c(1, 0.3, 0.1, 0, 0), c(0.3, 1, 0.4, 0, 0),
#                c(0.1, 0.4, 1, 0, 0), c(0, 0, 0, 1, 0),
#                c(0, 0, 0, 0, 1))
# t5 <- system.time(
#   diststudent(nu1 = nu1, Sigma1 = Sigma1, nu2 = nu2, Sigma2 = Sigma2,
#               dist = "renyi", bet = 0.25)
# )

renyi_time2 <- times[2]
renyi_exetime <- data.frame(dim = 1:4, iter = iter, exetime = times/renyi_time2)


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

# # Dim 5
# Sigma1 = rbind(c(1, 0.6, 0.2, 0, 0), c(0.6, 1, 0.3, 0, 0),
#                c(0.2, 0.3, 1, 0, 0), c(0, 0, 0, 1, 0),
#                c(0, 0, 0, 0, 1))
# Sigma2 = rbind(c(1, 0.3, 0.1, 0, 0), c(0.3, 1, 0.4, 0, 0),
#                c(0.1, 0.4, 1, 0, 0), c(0, 0, 0, 1, 0),
#                c(0, 0, 0, 0, 1))
# t5 <- system.time(
#   diststudent(nu1 = nu1, Sigma1 = Sigma1, nu2 = nu2, Sigma2 = Sigma2,
#               dist = "renyi", bet = 0.25)
# )

kl_time2 <- times[2]
kl_exetime <- data.frame(dim = 1:4, iter = iter, exetime = times/kl_time2)


# Table of the execution times

library(kableExtra)
data.frame(renyi_exetime$dim, renyi_exetime[2:3], kl_exetime[2:3]) %>%
  kbl(col.names = c("Dimension", "Number of iterations", "Execution time",
                    "Number of iterations", "Execution time")) %>%
  add_header_above(c(" " = 1, "Rényi divergence" = 2,
                     "Kullback-Leibler divergence" = 2))
