# Constants
dt <- 0.1
breed <- 0.8
prey_rate <- 0.4
pred_grow <- 0.5 * prey_rate
pred_deat <- 0.4
iter <- 1000

# Preallocation
x <- array(-9999, dim = iter)
y <- x
t <- x

# Initial conditions
t[1] <- 0
x[1] <- 4
y[1] <- 2

# Actual calculations
for (i in 2:iter) {
      t[i] <- t[(i-1)] + dt
      x[i] <- x[(i-1)] + dt * (x[(i-1)] * breed - x[(i-1)] * y[(i-1)] * prey_rate)
      y[i] <- y[(i-1)] + dt * (y[(i-1)] * x[(i-1)] * pred_grow - y[(i-1)] * pred_deat)
}

