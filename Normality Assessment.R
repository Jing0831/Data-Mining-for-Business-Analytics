n1=rnorm(100,0,1)
mean(n1)
n2=rexp(100,.2)
#create 2 vectors to compare
#Graph 1
hist(n1)

#Graph 2
hist(n2)

#qqplot
#qqnorm(n1) #compare to normal distribution, should be on the line if normal distributed
#Graph 3
qqnorm(n1)
qqline(n1)

#Graph 4
qqnorm(n2)
qqline(n2)

#p-test (Ho/Ha)
library (nortest)

shapiro.test(n1)#3000 observations limited
ad.test(n1)

iris
summary(iris)

mtcars
summary(mtcars)
# some summary data maybe be meaningless(categorical)
# summary can't tell everything, may tell you something wrong, look at data!
table(mtcars$am)
table(mtcars$am, mtcars$cyl)
# rows: am=0/1; columns cy1 = 4/6/8
nrow(mtcars)
ncol(mtcars)

