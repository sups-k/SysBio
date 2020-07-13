# Define initial values
R0 = 1000
M0 = 10

# Define parameters
f = 0.01
g = 2

Rn_1 = R0
Mn_1 = M0
Rn = c() # Rn as a vector
Mn = c() # Mn as a vector

# Range of n values for which we have to calculate Rn and Mn
n = seq(1,10,1)

# Iterative process to calculate Rn and Mn
for (i in n) {
  Rn = c(Rn, (1-f)*Rn_1 + Mn_1)
  Mn = c(Mn, g*f*Rn_1)
  Rn_1 = Rn[i]
  Mn_1 = Mn[i]
}
