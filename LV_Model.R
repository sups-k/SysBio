## Equations For Lotka-Volterra predator-prey model

# du/dtau = u*(1-v)
# dv/dtau = alpha*v*(u-1)

library(deSolve)

# Define Lotka-Volterra model function with tau, initial values, parameter

pp1 = function(t, init, para1){
  u <- init[1]
  v <- init[2]
  alpha <- para1
  du <- u*(1-v) # du here refers to du/dtau
  dv <- alpha*v*(u-1) # dv here refers to dv/dtau
  list(c(du, dv)) # function automatically returns du, dv as a list
}

pp2 = function(t, init, para2){
  u <- init[1]
  v <- init[2]
  alpha <- para2
  du <- u*(1-v) # du here refers to du/dtau
  dv <- alpha*v*(u-1) # dv here refers to dv/dtau
  list(c(du, dv)) # function automatically returns du, dv as a list
}

pp3 = function(t, init, para3){
  u <- init[1]
  v <- init[2]
  alpha <- para3
  du <- u*(1-v) # du here refers to du/dtau
  dv <- alpha*v*(u-1) # dv here refers to dv/dtau
  list(c(du, dv)) # function automatically returns du, dv as a list
}

pp4 = function(t, init, para4){
  u <- init[1]
  v <- init[2]
  alpha <- para4
  du <- u*(1-v) # du here refers to du/dtau
  dv <- alpha*v*(u-1) # dv here refers to dv/dtau
  list(c(du, dv)) # function automatically returns du, dv as a list
}
# Give initial values - u(tau), v(tau)
init <- c(1.3, 1.3) # dimensionless

# Give parameter value -  alpha = positive rate constant
para1 <- 0.1
para2 <- 1 # Next function call change alpha to 1
para3 <- 10 # Next function call change alpha to 10
para4 <- 100 # Next function call change alpha to 100

# Tau range for solution - till 100
tau <- seq(0, 100, 0.0001)

## Part 1
# Calling ODE function
out1 <- ode(y = init, times = tau, func = pp1, parms = para1)
out2 <- ode(y = init, times = tau, func = pp2, parms = para2)
out3 <- ode(y = init, times = tau, func = pp3, parms = para3)
out4 <- ode(y = init, times = tau, func = pp4, parms = para4)

# Plotting solution for u(tau)
plot(out1[,1], out1[,2], type = "l", xlab = "tau", ylab = "u(tau)")
plot(out2[,1], out2[,2], type = "l", xlab = "tau", ylab = "u(tau)")
plot(out3[,1], out3[,2], type = "l", xlab = "tau", ylab = "u(tau)")
plot(out4[,1], out4[,2], type = "l", xlab = "tau", ylab = "u(tau)")

# Plotting solution for v(tau)
plot(out1[,1], out1[,3], type = "l", xlab = "tau", ylab = "v(tau)")
plot(out2[,1], out2[,3], type = "l", xlab = "tau", ylab = "v(tau)")
plot(out3[,1], out3[,3], type = "l", xlab = "tau", ylab = "v(tau)")
plot(out4[,1], out4[,3], type = "l", xlab = "tau", ylab = "v(tau)")

# Plotting u(tau) vs v(tau)
plot(out1[,2], out1[,3], type = "l", xlab = "u(tau)", ylab = "v(tau)")
lines(out2[,2], out2[,3])
lines(out3[,2], out3[,3])
lines(out4[,2], out4[,3])

#Print summary
print(out)

# Part 2: Linearise and find eigen values at fixed points (0,0) and (1,1)

# du/dt = u(1-v) = f
# dv/dt = a*v*(u-1) = g

# del f / del u = (1-v) = a11
# del f / del v = -u = a12
# del g / del u = a*v = a21
# del g / del v = a*(u-1) = a22

# For operating point (0,0):
# a11 = 1-0 = 1
# a12 = 0
# a21 = 0
# a22 = -a = -0.1
# du'/dt = u'
# dv'/dt = -0.1*v'

# For operating point (1,1):
# a11 = 1-1 = 0
# a12 = -1
# a21 = a = 0.1
# a22 = 0
# du'/dt = -v'
# dv'/dt = 0.1*u'

library(rootSolve)
lambdas <- eigen(jacobian.full(y = c(0,0), func = pp1, parms = para1))$values
print(lambdas)
print("Since 1 eigen value is positive and the other is negative and both are real, (0,0) is a saddle point")
lambdas <- eigen(jacobian.full(y = c(1,1), func = pp1, parms = para1))$values
print(lambdas)
print("Since both eigen value are imaginary, (1,1) is a centre")

## Without using rootSolve
# a11 = 1
# a12 = 0
# a21 = 0
# a22 = -0.1
# 
# eigen1 = ((a11 + a22)/2) + sqrt( ( ((a11 + a22)^2) / 2) - (a11*a22 - a21*a12) + 0i)
# eigen2 = ((a11 + a22)/2) - sqrt( ( ((a11 + a22)^2) / 2) - (a11*a22 - a21*a12) + 0i)