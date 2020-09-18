# Constants
dt <- 0.001
breed <- 0.6
prey_rate <- 0.3
pred_grow <- 0.20 * prey_rate
pred_deat <- 0.5
iter <- round(100/dt)

# Preallocation
x <- array(-9999, dim = iter)
y <- x
t <- x

# Initial conditions
t[1] <- 0
x[1] <- 6 # initial prey
y[1] <- 2 # initial pred

# Actual calculations
for (i in 2:iter) {
      t[i] <- t[(i-1)] + dt
      x[i] <- x[(i-1)] + dt * (x[(i-1)] * breed - x[(i-1)] * y[(i-1)] * prey_rate)
      y[i] <- y[(i-1)] + dt * (y[(i-1)] * x[(i-1)] * pred_grow - y[(i-1)] * pred_deat)
}

plot(t,x, type = "l", ylab = "prey population", xlab = "time")
plot(t,y, type = "l", ylab = "predator population", xlab = "time")
