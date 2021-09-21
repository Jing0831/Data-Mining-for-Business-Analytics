# R Code for Linear Algebra 

A = matrix(c(3,2,1,6,4,2,8,1,3), nrow=3, byrow=T)
B = matrix(c(3,2,4,1), nrow=2, byrow=T)
C = matrix(c(1,5,9), nrow=1,byrow=T)

# Norm of a vector
norm(C, "O")  # computes the "one" norm, maximum absoluet column sum
norm(C, "I")  # computes the "Infinity" norm or maximum absolute row sum
norm(C, "F")  # computes the "Frobenius norm, or Euclidean Distance
norm(C, "M")  # computes the  maximum modulus of all elements
norm(C, "2")  # computes the "spectral or 2-norm which is the larges singular value decomposition

# Normalized Vector
C / norm(C,"F")


# Inner Product 
x = c(1,3,5)
y = t(c(2,4,6))
y%*%x


# Transpose of a matrix
A = matrix(c(3,5,7,2,6,9,1,8,6), nrow=3, byrow=T)
C = matrix(c(5,1,2), nrow=1,byrow=T)

t(A)
t(C)

# Matrix Addition and Subtraction
A = matrix(c(3,5,7,2,6,9,1,8,6), nrow=3, byrow=T)
B = matrix(c(4,2,3,5,2,1,6,7,8), nrow=3, byrow=T)

A+B
A-B

# Scalar Multiplication
A = matrix(c(3,5,7,2,6,9,1,8,6), nrow=3, byrow=T)
lambda = 3
lambda*
  
# Matrix Multiplication
A = matrix (c(2,3,5,10), nrow=2, byrow=T)
B = matrix (c(1,3,4,5), nrow=2, byrow=T)

A%*%B


# Module 1.2

# Linear Independence

# Rank of Matrix
A = matrix(c(3,6,9,9,18,27,5,15,3), nrow=3, byrow=T)
B = matrix(c(1,7,11,13,2,5), nrow=2, byrow=T)
C = matrix(c(8,12,2,8), nrow=2, byrow=T)

matrixcalc::matrix.rank(A)  # value is 2 linear indpendent rows
rankMatrix(B)  # value is 2 linear indpendent rows - Use rankMatrix for non square matrix
matrixcalc::matrix.rank(C)  # value is 2 linear indpendent rows

# determinant
A = matrix(c(2,5,7,4), nrow=2, byrow=T)
det(A)

# Orthogonal Matrix
A = matrix(c(1/3,-2/3,2/3,2/3,-1/3,-2/3,2/3,2/3,1/3),nrow=3, byrow=T)
At = t(A)
A %*%At

# Matrix Inverse
A = matrix(c(4,3,3,2), byrow=T, nrow=2)
solve(A)
A%*%solve(A)

#singular matrix
A = matrix(c(1,2,2,4), byrow=T, nrow=2)
det(A)
solve(A) # returns an error. 


# Matrix Division
A = matrix(c(2,3,5,10), byrow=T, nrow=2)
B = matrix(c(1,3,4,5), byrow=T, nrow=2)
B_inv = solve(B)
B_inv
A%*%B_inv

# trace of a matrix
A = matrix(c(4,6,7,8,1,3,3,8,6), byrow=T, nrow=2)
matrixcalc::matrix.trace(A)
tr(A)  # from the psych package


# Covariance to Correlation
S = matrix(c(504,360,180,360,360,0,180,0,720), nrow=3, byrow=T)
V =  diag(x = sqrt(diag(S)), nrow = nrow(S), ncol = ncol(S))
V  # Standard deviation matrix
V_inv = solve(V)

rho = V_inv %*% S %*% V_inv
rho

#check to see if we can get S back 
V%*%rho%*%V

# eigen values and eigenvectors
S = matrix(c(2,1,1,2), byrow=T, nrow=2)
eigen(S)

S%*%eigen(S)$vectors[,1]   # A(Nu)
eigen(S)$values[1] * eigen(S)$vectors[,1]

S%*%eigen(S)$vectors[,2]   # A(Nu)
eigen(S)$values[2] * eigen(S)$vectors[,2]

# Singular value decomposition
A = matrix(c(2,1,1,2), byrow=T, nrow=2)
svd(A)


# use direct computation

E = eigen(A)
U = E$vectors
d = diag(E$values)
V = t(U)
U
d
V
(U)%*%d%*%(V)
