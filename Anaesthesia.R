## Equations For Amount of Anaesthesia in Muscle, Blood, Liver
# Muscle:
# dM/dt = -e*M

# Blood:
# dB/dt = e*M - c*B

# Liver:
# dL/dt = c*B - delta*L

library(deSolve)

# Define anaesthesia model function with time, initial values, parameters

ana = function(t, init, para){
  M <- init[1]
  B <- init[2]
  L <- init[3]
  e <- para[1]
  c <- para[2]
  delta <- para[3]
  dM <- -e*M # dM here refers to dM/dt
  dB <- e*M - c*B # dB here refers to dB/dt
  dL <- c*B - delta*L # dL here refers to dL/dt
  list(c(dM, dB, dL)) # function automatically returns dM, dB, dL as a list
}

# Give initial value
init <- c(315, 0, 0) # mg

# Give parameter values - e, c, delta - rates per hour
#para <- c(0.5, 0.3, 0.4)
para <- c(0.5, 0.3, 0.000001) # Part c: delta tends to 0

# Time range for solution
t <- seq(0, 24, 0.1)

## Part a
# Calling ODE function
out <- ode(y = init, times = t, func = ana, parms = para)

# Plotting solution for muscle
x=out[,1]
y=out[,2]
plot(x, y, type = "l", xlab = "Time in hours", ylab = "M(t) in mg")

# Plotting solution for blood
x=out[,1]
y=out[,3]
plot(x, y, type = "l", xlab = "Time in hours", ylab = "B(t) in mg")
## Part b
abline(v=1.4)

# Part c: Plotting solution for liver
x=out[,1]
y=out[,4]
plot(x, y, type = "l", xlab = "Time in hours", ylab = "L(t) in mg")

#Print summary
print(out)
