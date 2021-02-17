# Code for the logistic growth model
r <- 0.01 # growth rate
K <- 80 # carrying capacity
p0 <- 5 # inital population
time <- 1000 # run <time> units
dt <- 1 # time step

# Logistic growth model:
# dP/dt = r ((K-p)/K) P

t <- (c(1:(time/dt)))*dt
p <- array(-9, dim = c(time/dt))
p[1] <- p0
for (i in 1:(nrow(p)-1)) {
      p[i+1] <- p[i] + (dt * (p[i] * r * (K-p[i]) / K))
}

plot(t, p, type = "p", col = "blue", xlim = c(0,time), xlab = "Time (units)", ylab = "population")

# compare to the analytic solution:
p_ana <- K / (1+((K/p0)-1)*exp(-r*tim))
lines(t,p_ana)
# Here, you see an example of truncation error, if you use a dt>>1 and rounding error with dt<<1.
