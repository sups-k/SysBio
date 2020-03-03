rm(list=ls())

library(rootSolve)

## Example 1:
fun1 <- function(x) {
  x^2 -4
}
uni = uniroot(fun1, c(0,3))
multi = multiroot(fun1, c(-3,3))
print(uni$root)
print(multi$root)

## Example 2:
fun2 <- function(x) {
  cos(2*x)^3
}
uni = uniroot.all(fun2, c(0,8))
print(uni)
x = seq(0,8,0.1)
plot(x, (cos(2*x)^3), type = "l")
segments(-1,0,9,0)

## Example 3: A cubic function
model = function(x){
  F1 <- x[1] + x[2] + x[3]^3 -12
  F2 <- x[1]^2 - x[2] + x[3] -2
  F3 <- 2*x[1] - x[2]^2 + x[3] -1
  c(F1 = F1, F2 = F2, F3 = F3)
}
ss = multiroot(f=model, start=c(1,1,1))
print(ss)