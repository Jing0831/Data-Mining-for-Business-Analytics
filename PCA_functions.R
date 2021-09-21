## Five Element Analytics
## Author: Alex Pelaez
## Date Revised: 01-02-2019
##
## TO USE THIS
## Use the PCA function from FactomineR package and 
## pass in the pca object into Pass in a vector
## Result will be the vector of min_max_normalization
#
# Example:
## 			
#Usage: communality(data)

#Example: p = PCA(houses) 
#        communality(p)

communality <- function(pca) {
  pca2 = pca$var$cor^2
  p=ncol(pca2)
  n=nrow(pca2)
  m = matrix(c(0), ncol=p,nrow=n)
  colnames(m) = colnames(pca2)
  rownames(m) = rownames(pca2)
  for (i in 1:n){
    m[i,1] = pca2[i,1]
    for (j in 2:p) {
      m[i,j] = m[i,j-1] + pca2[i,j]
    }
  }
  round(m,4) 
}

# Example:
## 			
#Usage: display_pc(p, cutoff, rnd)
# p - pca object
# cutoff - cutoff value
# rnd - rounding significant digits
#
#Example: p = PCA(houses) 
#        display_pc(p, .5, 4)


display_pc <- function(pca, cutoff=.5, rnd=4) {
  m = as.table(round(pca$var$cor, rnd))
  m[abs(m) < cutoff] = 0
  print(m, zero.print=".")
}