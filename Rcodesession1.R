a=6
a
c(8,2,3,4,5)

Myvector <- c(7,8,4,3,5,1)
Myvector


myMatrix <- matrix( c(7,8,1,3,2,1,4,5,6), nrow= 3 , ncol= 3 , byrow=FALSE  )
myMatrix

A <- matrix( c(7,8,1,3,2,1,4,5,6), nrow= 3 , ncol= 3 , byrow=FALSE  )
A

B <- matrix( c(1,2,2,3,2,2,1,6,7), nrow= 3 , ncol= 3 , byrow=FALSE  )
B

B[2,1]

A*B  # NOT MATRIX MULTIPLICATION
A%*%B  # MATRIX MULTIPICATION

#Find Inverse

solve(A)

solve(A)%*%A   # Yields Identity matrix I

#Transpose
t(A)

t(t(Myvector))  #Transpose of Transpose yields same item

#Determinant 

det(A)

det (matrix ( c(2,1,1,2), nrow=2, ncol=2))

#TRACE OF MATRIX

matrix.trace(A)
matrix.rank(A)
# EXAMPLE
C <- A%*%B
C


# MULTIPLY BY SCALAR
B
2*B
B/2
# COVARAINCE MATRIX
cov(A)
S <- cov(A)
S

# CORRELATION MATRIX FROM COVARAINCE MATRIX

cov2cor(S)

E<-eigen(S)

E$values
E$values[1]


