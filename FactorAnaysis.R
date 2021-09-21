#use the bfi data set
# type 
?bfi
data(bfi)
view(bfi)
# Test correlation matrix to see if the offdiagonals are greater than 0. 
# H0: Correlations are not greater than 0. 
# ha: Correlations are greater than 0 
# you can run this test to see 
# Example of zero correlation matrix:  cortest.bartlett(matrix(c(1,.02,.05,.02,1,.04,.05,.04,1), nrow=3, byrow=T), n = 30 )
library(psych)
#Remove rows with missing values and keep only complete cases
bfi_data=bfi[complete.cases(bfi),]#remove all the NA
cormat = cor(bfi_data[,c(-26,-27,-28)]) #not relevant
cortest.bartlett(cormat, n=nrow(bfi_data)) # p value <0.05
# Reject H0. 
library(GPArotation)

#Factor analysis of the data
factors_data <- fa(r = cormat, nfactors = 6)
factors_data

f = factanal(bfi_data[,c(-26,-27,-28)],factors=5, rotation="none")
# factors=5 just try a number
print(f,cutoff=.4)


f = factanal(bfi_data[,c(-26,-27,-28)],factors=5, rotation="varimax")
print(f,cutoff=.4)# cutoff=.35 is also a good try

f = factanal(bfi_data[,c(-26,-27,-28)],factors=5, rotation="promax")
print(f,cutoff=.35)

#Examine number of loadings(how many factors we should choose)


f = factanal(bfi_data[,c(-26,-27,-28)],factors=4, rotation="promax")
print(f,cutoff=.4)


f = factanal(bfi_data[,c(-26,-27,-28)],factors=5, rotation="promax")
# Almost everything is included, and nothing belongs to two different factors
print(f,cutoff=.4)


f = factanal(bfi_data[,c(-26,-27,-28)],factors=6, rotation="promax")
print(f,cutoff=.4)

factor.stats(cormat,f)


f = fa(cormat, nfactors=5, fm="pa", rotate="promax")
print(f, cutoff=.3)
#"N4" belongs to Factor1, since it make more sense and have greater value.

# For homework
use columns O:AG , drugs