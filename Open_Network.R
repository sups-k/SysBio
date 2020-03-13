## Equations for a hypothetical open network

# d[A]/dt = k1 - k2*[A] - k3 * [A] * [B]
# d[B]/dt = k2*[A] - k3 * [A] * [B]
# d[C]/dt = k3 * [A] * [B] - k4 * [C]
# d[D]/dt = k3 * [A] * [B] - k5 * [D]

library(deSolve)

# Define network with time, initial values, parameters

open_net = function(t, init, para){
  k1 <- para[1]
  k2 <- para[2]
  k3 <- para[3]
  k4 <- para[4]
  k5 <- para[5]
  A <- init[1]
  B <- init[2]
  C <- init[3]
  D <- init[4]
  dA <- k1 - (k2 * A) - (k3 * A * B) # dA here refers to d[A]/dt
  dB <- (k2 * A) - (k3 * A * B) # dB here refers to d[B]/dt
  dC <- (k3 * A * B) - (k4 * C) # dC here refers to d[C]/dt
  dD <- (k3 * A * B) - (k5 * D) # dD here refers to d[D]/dt
  list(c(dA, dB, dC, dD)) # function automatically returns dM, dB, dL as a list
}

# Give initial values
init <- c(0, 0, 0, 0) # mM
# Change initial values and plot the graphs

# Give parameter values - k1, k2, k3, k4, k5 - rates of reactions
para <- c(3, 2, 2.5, 3, 4)

# Time range for solution
t <- seq(0, 4, 0.1)

## Part a
# Calling ODE function
out <- ode(y = init, times = t, func = open_net, parms = para)

# Plotting solutions

plot(out[,1], out[,2], type = "l", xlab = "Time in seconds", ylab = "Concentration in mM", ylim = c(0,1), col = "blue")
par(new = TRUE)
plot(out[,1], out[,3], type = "l", xlab = "Time in seconds", ylab = "Concentration in mM", ylim = c(0,1), col = "red")
par(new = TRUE)
plot(out[,1], out[,4], type = "l", xlab = "Time in seconds", ylab = "Concentration in mM", ylim = c(0,1), col = "green")
par(new = TRUE)
plot(out[,1], out[,5], type = "l", xlab = "Time in seconds", ylab = "Concentration in mM", ylim = c(0,1), col = "orange", bty = 'L')
par(xpd = T, mar = par()$mar + c(2,2,0,-2))
legend("bottomright", c("a(t)", "b(t)", "c(t)", "d(t)"), col = c("blue", "red", "green", "orange"), cex = 0.6, lwd = 2, lty = 1)
par(mar=c(5, 4, 4, 2) + 0.1)

#Print summary
print(out)
