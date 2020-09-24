#Sophia Bakar
#September 21st, 2020
#Logistic Growth Model Assignment

#constants
r <- 0.1
K <- 80
deltat <- 1
iter <- 100

# Pre-allocation 
p <- array(1000, dim = iter)
t <- p

#initial conditions
p[1] <- 10
t[1] <- 0

for(i in 2:iter){
  t[i] <- t[(i-1)] + deltat
  p[i] <- p[i-1] + (deltat*(r*p[i-1]*((K-p[i-1])/K)))
}


plot(t,p,type = "l", xlim = c(0,100),ylim = c(0,100))

