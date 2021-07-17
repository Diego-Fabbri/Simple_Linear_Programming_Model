
        #Set your own working directory
setwd("C:/Users/diego/Documents/R/Projects/GitHub_Projects/Optimization/Simple LP instance")

# Import lpSolve package
library(lpSolve)

# Set objective function's coefficients  
f.obj <- c(-10,-1,0,0,0)

# Matrix corresponding to constraints' coefficients 
# Do not consider the non-negative constraint; it is automatically assumed
A <- matrix(c(1, 1, 1, 0, 0,
              1, 0, 0, 1, 0,
            0.5, 1, 0, 0, 1), nrow = 3, byrow = TRUE)


# Set unequality signs
f.dir <- c("=",
           "=",
           "=")

# Set right hand side coefficients
B <- c(10,6,8)

# Objective Function (z)
z <- lp("min", f.obj, A, f.dir, B)
z

# Variables final values
solution <- lp("min", f.obj, A, f.dir, B)$solution
solution

#Model Summary
for(i in 1:ncol(A)){
  print(paste("x[",i,"] = ",solution[i]))
}
z
          