# Grace Jenkins
r <- 0.1
k <- 60
dt <- 1
it <- 1000
pop <- array(0, dim = c(it))
pop[1] <- 2
for (i in 2:it){
  pop[i] <- pop[(i-1)]+dt * r * pop[(i-1)]* (k-pop[(i-1)])/k
}
plot(pop)
