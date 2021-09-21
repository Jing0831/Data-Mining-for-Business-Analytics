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

display_pc <- function(pca, cutoff=.5, rnd=4) {
  m = as.table(round(pca$var$cor, rnd))
  m[abs(m) < cutoff] = 0
  print(m, zero.print=".")
}