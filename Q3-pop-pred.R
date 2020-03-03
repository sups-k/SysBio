## Equation For population with predation model

# dx/dtau = (alpha * x * (1-(x/K)) ) - (x/(1+x)) = f(x)

library(deSolve)

## Part 1
x <- seq(1, 100,1)
f1 <- (1.3 * x * (1-(x/20)) ) - (x/(1+x))
f2 <- (0.3 * x * (1-(x/20)) ) - (x/(1+x))
f3 <- (0.1 * x * (1-(x/20)) ) - (x/(1+x))
plot(x, f1, type = "l", xlab = "x", ylab = "f(x)")
lines(x, f2, col="red")
lines(x, f3, col="green")


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

# Plotting solution for u(tau)
plot(out, type = "l", xlab = "tau", ylab = "x(tau)")

# Yes, there is a difference in the steady state values.
# For x(0) = 1.2, the steady state value is 0
# For x(0) = 3.5, the steady state value is 16

#Print summary
print(out)