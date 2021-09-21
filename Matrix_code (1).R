# Basic Matrix Functions

# create matrix

J = matrix(c(8,1,3,4,2,3,4,4,2), byrow=T, nrow=3)
K = matrix(c(3,4,2,4,3,8,7,1,1), byrow=T, nrow=3)

# Add Matrix
J + K

# SubtractMatrix
J - K

#Multiply Scalar Matrix
l = 4
l*J

#Multiply matrices
J%*%K

#Divide Matrices
J%/%K

#Create the inverse
J_inv = solve(J)
J_inv

#Prove J_inv * J = I
J_inv %*% J 

J%*%J_inv

# Compute a determinant
# in a 2x2 matrix simply compute ad-bc
# e.g.
#     --     --
#     | 8    2 |
# Z=  |        |
#     | 3    1 |
#     --      --
#
# compute 8*1 - 2*3 = 2
Z = matrix( c(8,2,3,1), nrow = 2, byrow=T)
det(Z)

# Do All matrices have an inverse....
# No ..
# If a matrix is singular it will not have an inverse and its determinant is 0
# 
# Singular matrix example? 
Z = matrix( c(3,4,6,8), nrow = 2, byrow=T)
solve(Z) # Doesn't work ... why? 
# Becuase its singular. Calculate determinant by hand
3*8 - 6*4 #(ab-cd)
# The determinant is 0
det(Z)  

# More on matrices. 


#libraries needed
library(MBESS)

# COVARIANCE TO CORRELATION EXAMPLE

# Sample Covariance Matrix 
S = matrix(c(1,.1,1.6,.1,1,.2,1.6,.2,2), nrow=3,byrow=T)
S = matrix(c(504,360,180,360,360,0,180,0,720), nrow=3,byrow=T)
S

# Standard Deviation Matrix - easy to calculate
V = matrix(c(sqrt(504),0,0,0,sqrt(360),0,0,0,sqrt(720)), byrow=T, nrow=3)
V
solve(V)

t(diag(V))

# Get the correlation matrix using the pre-built R function 
rho = cov2cor(S)
rho 

cor2cov(rho,diag(V))

## Now we will use the calculations
rho = solve(V)%*%S%*%solve(V)
rho 

V%*%rho%*%V


### EIGENVALUES 

A= matrix (c(2,1,1,2), nrow = 2, byrow=T)
A

# What if we multiplied A by a vector v
#
#s.t. Av = ? 

v = c(.7071068,.7071068)

z =3*(A%*%v)
z= A%*%v
z2=3*v
z  
z2

A= matrix (c(2,1,1,2), nrow = 2, byrow=T)
A
eigen(A)

# Singular Value Decomposition 

U = svd(A)$u
V = svd(A)$v
D = svd(A)$d
U%*%diag(D)%*%V

