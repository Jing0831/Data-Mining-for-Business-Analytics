# Libraries Needed
library("rpart.plot") 
library("rpart")
library("readr")
#import and fix data
car <- as.data.frame(read_csv("https://archive.ics.uci.edu/ml/machine-learning-databases/car/car.data", col_names = FALSE))
names(car) = c("buying","maint","doors","persons","lug_boot","safety", "acc")

car$buying = as.factor(car$buying)
car$maint = as.factor(car$maint)
car$doors = as.factor(car$doors)
car$persons = as.factor(car$persons)
car$lug_boot = as.factor(car$lug_boot)
car$safety = as.factor(car$safety)
car$acc = as.factor(car$acc)
summary(car)

#buying      maint       doors     persons     lug_boot    safety       acc      
#high :432   high :432   2    :432   2   :576   big  :576   high:576   acc  : 384  
#low  :432   low  :432   3    :432   4   :576   med  :576   low :576   good :  69  
#med  :432   med  :432   4    :432   more:576   small:576   med :576   unacc:1210  
#vhigh:432   vhigh:432   5more:432                                     vgood:  65  

#start with "person" to split (CART Method Splits)
car[runif(15,1,1700),] #randomly choose 15 rows in the data set "car"
 
# Basic Decision Tree (using rpart)
fullmodel = 'acc ~ buying + maint + doors + persons + lug_boot + safety'
simplemodel = 'acc~ doors + persons + safety'

#develop decision tree uses CART Method
carfit = rpart(simplemodel, data = car, method = "class")
carfit.1 = rpart(fullmodel, data = car, method = "class")

#print the model 
print(carfit)
summary(carfit.1)  #print complete information 

#plot the model
rpart.plot(carfit.1, main ="Acceptable Car - Classification Tree",
             box.palette="Blues")
#output some nice formatted rules and get probabilities
rpart.rules(carfit)

plotcp(carfit)
printcp(carfit.1)

# use the prune function to prune a tree
# find the smallest xerror desired to avoid overfitting
newcarfit = prune(carfit, cp=.05)
rpart.plot(newcarfit, main ="Acceptable Car - Classification Tree",
           box.palette="Blues")

#Adjust the cp 
carfit = rpart(simplemodel, data = car, method = "class", control= rpart.control(cp = 0.02))
rpart.plot(carfit, main ="Acceptable Car - Classification Tree (cp =.02)", box.palette="Blues")
rpart.rules(carfit)
plotcp(carfit)
printcp(carfit)


#Additional control options available see 
#https://stat.ethz.ch/R-manual/R-devel/library/rpart/html/rpart.control.html



# It is the amount by which splitting that node improved the relative error. 
#So in your example, splitting the original root node dropped the relative
#error from 1.0 to 0.5, so the CP of the root node is 0.5. 
#The CP of the next node is only 0.01 (which is the default limit for deciding 
#when to consider splits).
#So splitting that node only resulted in an improvement of 0.01, so the tree building stopped there.


# Prune back the tree to avoid overfitting the data. 
#Typically, you will want to select a tree size that minimizes the cross-validated error, 
#the xerror column printed by printcp( ).


#C4.5/C50 Algorithm 

# load the package

library(C50)

# fit model simplemodel
# wont take simple model object 
ruleModel <- C5.0(acc~doors+persons+safety, data = car)
ruleModel
summary(ruleModel)
plot(ruleModel)



# Create the conditional inference tree 
# uses statistical paramters and doesn't require any pruning
library(party)
output.tree <- ctree(
  acc ~ doors + persons + safety, 
  data = car)

# Plot the tree.
plot(output.tree)


# Accuracy measure 
# 1) Set training to 80% of data 
# 2) Set test to 20% of data 
# 3) Predict classification of test 
# 4) Compare accuracy rates using contingency table
# 5) Assess Better method
library(Hmisc)  # Needed for %nin%
totalrows = nrow(car)
car$id= rownames(car)
pickrows = round(runif(totalrows*.80, 1, totalrows),0)
traincar = car[pickrows, ]
testcar = car[-pickrows, ]

#CART METHOD PREDICTION
simplemodel = 'acc~ doors + persons + safety'
#develop decision tree against training set using CART Method
carfit2 = rpart(simplemodel, data = traincar, method = "class")
#summary(carfit2)
#Alternatively you can plot
#Do the prediction
testcar$predict = predict(carfit2, newdata=testcar, type='class')

#Counts
tab = table(testcar$acc, testcar$predict)
dimnames(tab) <- list(Actual = c("acc", "good", "unacc", "vgood"), "Predicted" = c("acc", "good", "unacc", "vgood"))
tab
#Predict Table as Pct: put them into percentage
pcttab <- rbind(tab[1, ]/sum(tab[1, ]), tab[2, ]/sum(tab[2, ]), tab[3, ]/sum(tab[3, ]), tab[4, ]/sum(tab[4, ]))
dimnames(pcttab) <- list(Actual = c("acc", "good", "unacc", "vgood"), "Predicted" = c("acc", "good", "unacc", "vgood"))
print(round(pcttab, 3))


# Now use the C50 Algorithm 
carfit50 <- C5.0(acc~doors+persons+safety, data = traincar)
#summary(ruleModel)
#Alternatively you can plot
testcar$predict = predict(carfit50, newdata=testcar, type='class')

#Counts
tab = table(testcar$acc, testcar$predict)
dimnames(tab) <- list(Actual = c("acc", "good", "unacc", "vgood"), "Predicted" = c("acc", "good", "unacc", "vgood"))
tab
#Predict Table as Pct
pcttab <- rbind(tab[1, ]/sum(tab[1, ]), tab[2, ]/sum(tab[2, ]), tab[3, ]/sum(tab[3, ]), tab[4, ]/sum(tab[4, ]))
dimnames(pcttab) <- list(Actual = c("acc", "good", "unacc", "vgood"), "Predicted" = c("acc", "good", "unacc", "vgood"))
print(round(pcttab, 3))

# Now use the Conditional Inference Algorithm 
carfitCI = ctree(acc ~ doors + persons + safety, data = traincar)
testcar$predict = predict(carfitCI, newdata=testcar, type='response')

#Counts
tab = table(testcar$acc, testcar$predict)
dimnames(tab) <- list(Actual = c("acc", "good", "unacc", "vgood"), "Predicted" = c("acc", "good", "unacc", "vgood"))
tab
#Predict Table as Pct
pcttab <- rbind(tab[1, ]/sum(tab[1, ]), tab[2, ]/sum(tab[2, ]), tab[3, ]/sum(tab[3, ]), tab[4, ]/sum(tab[4, ]))
dimnames(pcttab) <- list(Actual = c("acc", "good", "unacc", "vgood"), "Predicted" = c("acc", "good", "unacc", "vgood"))
print(round(pcttab, 3))


# Develop a regression tree. 
# method=	"class" for a classification tree 
# "anova" for a regression tree
# control=	optional parameters for controlling tree growth. For example, control=rpart.control(minsplit=30, cp=0.001) requires that the minimum number of observations in a node be 30 before attempting a split and that a split must decrease the overall lack of fit by a factor of 0.001 (cost complexity factor) before being attempted.
newcars = read.table("https://archive.ics.uci.edu/ml/machine-learning-databases/auto-mpg/auto-mpg.data")
names(newcars) = c("mpg","cylinders","displacement","horsepower","weight","acceleration","model_year","origin","car_name")
newcars = as.data.frame(newcars)


newcars
#remove '?' from horsepower
newcars[ as.character(newcars[,"horsepower"]) == "?","horsepower"] = NA
newcars= newcars[complete.cases(newcars),]
newcars$horsepower = as.numeric(as.character(newcars$horsepower))
newcars_fit = rpart(mpg~cylinders+displacement+horsepower+weight+acceleration+model_year, data = newcars, method = "anova")
summary(newcars_fit)
rpart.plot(newcars_fit, main ="Miles Per Gallon Prediction", box.palette="Blues")

#Calculate Errors
newcars$predict_dt = predict(newcars_fit)
newcars$predict_dt_error = round(newcars$predict_dt -newcars$mpg,3)
newcars$predict_dt_abserror = round(abs(newcars$predict_dt_error),3)
newcars$predict_dt_abserror_pct = round(abs((newcars$predict_dt -newcars$mpg)/newcars$mpg),3)

#Run standard Regression
#Regular regression
newcars_lm_fit = lm(mpg~cylinders+displacement+horsepower+weight+acceleration+model_year, data = newcars)
summary(newcars_lm_fit)

newcars$predict_lm = predict(newcars_lm_fit)
newcars$predict_lm_error = round(newcars$predict_lm -newcars$mpg,3)
newcars$predict_lm_abserror = round(abs(newcars$predict_lm_error),3)
newcars$predict_lm_abserror_pct = round(abs((newcars$predict_lm -newcars$mpg)/newcars$mpg),3)

newcars$dt_win = newcars$predict_dt_abserror_pct <= newcars$predict_lm_abserror_pct

#Compute winning percentage. 
sum(newcars$dt_win) / nrow(newcars)
