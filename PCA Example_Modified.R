# PCA MODULE
# Use houses dataset
# Pace, R. Kelley and Ronald Barry, "Sparse Spatial Autoregressions" Statistics and Probability Letters, 33 (1997) 291-297.

library(FactoMineR)
library(factoextra)
source("http://blogs.5eanalytics.com/RCode/PCA_functions.R")

cadata_fixed <- read.table("~/Downloads/Data sets/cadata_fixed.txt", quote="\"", comment.char="")
housing <- read.csv("C:/Users/acsazp/Downloads/housing.csv")
cadata_fixed = housing

nrow(cadata_fixed)
summary(cadata_fixed)
boxplot(cadata_fixed)
pca_result = PCA(cadata_fixed, scale.unit=T, graph=T, ncp=10)
pca_result$eig
pca_result$var
pca_result$var$coord



summary(pca_result)
fviz_screeplot(pca_result, ncp=10)
# Get the communalities
communality(pca_result)
#Nicely display the PC's
display_pc(pca_result,cutoff = .2)

pca_result$var
#Rotation 

#varimax Rotation and place back 
loadings.pcarot= varimax(pca_result$var$coord)$loadings
pca_result$var$coord = loadings.pcarot
plot(pca_result, choix  ="var")
display_pc(pca_result)

#compute 
pca_result$var$coord[,1:3] # show 3 dimensions 
PC = as.matrix(cadata_fixed) %*% as.matrix(pca_result$var$coord[,1:4])
colnames(PC) = c("SIZE", "LOCATION", "INCOME", "MHV")
cadata_fixed =cbind(cadata_fixed, PC)
cor(cadata_fixed, use="pairwise.complete.obs")
summary(pca_result)

pca_result$var$contrib
