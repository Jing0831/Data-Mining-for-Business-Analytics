# PCA MODULE
#Use houses dataset
# Pace, R. Kelley and Ronald Barry, "Sparse Spatial Autoregressions" Statistics and Probability Letters, 33 (1997) 291-297.
source(PCA_functions.R)

library(FactoMineR)
library(factoextra)

cadata_fixed <- read.table("~/Downloads/Data sets/cadata_fixed.txt", quote="\"", comment.char="")
names(cadata_fixed) = c("median_house_value", "median_income", "housing_median_age", "total_rooms", "total_bedrooms", "population", "households", "latitude", "longitude")

nrow(cadata_fixed)
summary(cadata_fixed)

pca_result = PCA(cadata_fixed)
summary(pca_result)
fviz_screeplot(pca_result, ncp=10)
eigen(cor(cadata_fixed))$values

# Get the communalities
communality(pca_result)
#Nicely display the PC's
display_pc(pca_result)

