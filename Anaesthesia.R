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

# Give initial value - M(0), B(0), L(0) in mg
init <- c(M = 315, B = 0, L = 0)

# Give parameter values - e, c, delta - rates per hour
para <- c(e = 0.5, c = 0.3, delta = 0.4)

# Time range for solution - in hours
t <- seq(0, 24, 0.1)

## Part a
# Calling ODE function
out <- ode(y = init, times = t, func = ana, parms = para)

# Plotting solution for muscle
plot(out[,1], out[,2], type = "l", xlab = "Time in hours", ylab = "M(t) in mg")

# Plotting solution for blood
plot(out[,1], out[,3], type = "l", xlab = "Time in hours", ylab = "B(t) in mg")

## Part b
# Time when half of injected amount into muscle goes to blood
# i.e., B(t) = M(0)/2 so find t
Bt = init[1]/2

vals = out[,3] <= Bt # logical vector
Bt_all = out[,3] # contains all values of B(t)
Bt_all <- Bt_all[vals] # selects only those values of B(t) which are <= M(0)/2

Bt = max(Bt_all)
entry = out[out[,3]==Bt,]

abline(v = entry[1], col = "cyan") # v for vertical line
text(3,3, paste("Time = ", entry[1]))

# Part c: Plotting solution for liver - When delta tends to 0
model2 = function(t, init, para2){
  e = para2[1]
  c = para2[2]
  d = para2[3]
  
  M = init[1]
  B = init[2]
  L = init[3]
  
  dM = -e * M
  dB = (e * M) - (c * B)
  dL = (c * B) - (d * L)
  
  list(c(dM, dB, dL))
}
para2 = c(e = 0.5, c = 0.3, d = 0.000000000001) # e, c, d
out2 = ode(t = t, y = init, func = model2, parms = para2)

# Plot liver levels
plot(out2[,1], out2[,4], xlab = "Time in hours", ylab = "L(t) in mg", type = "l")

Lt = max(out2[,4])

abline(h = Lt, col = "cyan") # v for vertical line
text(10,10, paste("Anaesthesia in mg = ", Lt))