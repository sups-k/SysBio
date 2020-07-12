## Equation For population with predation model

# dx/dtau = (alpha * x * (1-(x/K)) ) - (x/(1+x)) = f(x)

library(deSolve)

## Part 1
x <- seq(0, 100, 1)
f1 <- (1.3 * x * (1-(x/20)) ) - (x/(1+x)) # alpha = 1.3
f2 <- (0.3 * x * (1-(x/20)) ) - (x/(1+x)) # alpha = 0.3
f3 <- (0.1 * x * (1-(x/20)) ) - (x/(1+x)) # alpha = 0.1
plot(x, f1, type = "l", xlab = "x", ylab = "f(x)", ylim = c(-100, 100), col = "blue")
lines(x, f2, col="red", ylim = c(-100, 6))
lines(x, f3, col="green", ylim = c(-100,6))

# Run this part only after plotting to know how many values are intersecting
vals = f1 == f2 & f1 == f3 # logical vector
f = f1 # contains all values of f1
f <- f[vals] # selects only intersection of f1, f2, f3
x_f <- x[vals] # selects only x values of intersection of f1, f2, f3

#################### ALL WRONG BELOW ##### code is right ###############
# # Mark the fixed points on the graph
# 
# # First Point
# abline(v = x_f[1], col = "cyan") # v for vertical line
# abline(h = f[1], col = "cyan") # h for horizontal line
# text(7,-10, paste("(", x_f[1], ", ", f[1], ")"), col = "cyan")
# 
# # Second Point
# abline(v = x_f[2], col = "pink") # v for vertical line
# abline(h = f[2], col = "pink") # h for horizontal line
# text(30,-10, paste("(", x_f[2], ", ", f[2], ")"), col = "pink")
###########################################################

# From the graph, we can see no fixed points because none of the functions
# reach steady state. They all intersect at carrying capacity. To reach steady
# state, the graph must be parallel to x-axis.

## Part 2
# Define model function with tau, initial values, parameter

pop = function(t, init, para){
  K <- 20
  alpha <- para
  x <- init
  dx <- (alpha * x * (1-(x/K)) ) - (x/(1+x)) # dx here refers to dx/dtau
  list(dx) # function automatically returns dx as a list
}

# Give initial value - x(tau = 0)
#init <- 1.2
init <- 3.5 # Give in second round

# Give parameter value -  alpha = growth rate
para <- 0.3

# Tau range for solution - till 100
tau <- seq(0, 100, 0.0001)

# Calling ODE function
out <- ode(y = init, times = tau, func = pop, parms = para)

# Plotting solution for x(tau)
plot(out, type = "l", xlab = "tau", ylab = "x(tau)")

# Yes, there is a difference in the steady state values.
# For x(0) = 1.2, the steady state value is 0
# For x(0) = 3.5, the steady state value is 16
# A steady state value of 0 means with the initial population 1.2 and alpha = 0.3,
# the population cannot be sustained and dies out.
# With initial population 3.5, alpha can sustain it and the population
# grows and lives.
