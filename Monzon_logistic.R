# Constants
grow_rate <- 0.2
dt <- 0.1
K <- 60
iter <- round(1000/dt)

# Preallocation
x <- array(-9999, dim = iter)
y <- x
t <- x

# Initial conditions
t[1] <- 0
x[1] <- 2 #initial pop

#Actual calculations
for (i in 2:iter) {
  t[i] <- t[(i-1)] + dt
  x[i] <- x[(i-1)]+dt*(grow_rate*x[(i-1)]*(K-x[(i-1)])/K)
}

plot(t,x, type = "l", ylab = "Population Size", xlab = "Time", ylim = c(0,80), xlim = c(0,60))

