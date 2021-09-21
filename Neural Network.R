#Libraries and Sources

source ('http://blogs.fiveelementanalytics.com/RCode/min_max_normalization.R')

library(neuralnet)  # Other packages include nnet , and RSNNS
library(readr)
# Get Data

wine <- read_csv("https://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.data", col_names = FALSE)

names(wine) = c("class", "alcohol","malic_acid", "ash", "alaclinity", "magnesium", "total_phenols",
                "flavanoids", "nonflavanoid_phenols", "proanthocyanins", "color_intensity", "hue", 
                "OD280Ratio", "Proline")

# Fix data appropriately (Between 0 to 1)

# Number of inputs is number of columns minus one since the first row has the classification
inputs = ncol(wine) - 1

# Number of outputs is the number of possible classifiers
outputs = 1

# obtain a summary of our data - also could be used to determine if there is missing data
summary(wine)

# We can also use this to find NA(how many NA in our dataset, by columns):
apply(wine,2,function(x) sum(is.na(x))) #data, margin - 2 is columns, function to be applied)
#(1 - by row, 2 - by column)

# apply min max across all variables 
wine_norm = as.data.frame(apply(wine, 2, FUN =min_max_normal))

#How many notes do we need.

neuron_estimate  = ceiling(nrow(wine_norm) / (2 * (inputs + outputs)))

n = colnames(wine_norm)   #note difference between colnames and names here, is based on return type
#n[!n %in% "class"] = every element but "class"
#paste("Hello","world") ->[1] "Hello world"
frm = as.formula(
  paste("class ~", 
        paste(n[!n %in% "class"], collapse = " + ")
        )
  )


# OR USE LONG HAND VERSION 
frm = class ~ alcohol + malic_acid + ash + alaclinity + magnesium + total_phenols + flavanoids + nonflavanoid_phenols + proanthocyanins + color_intensity + hue + OD280Ratio + Proline
# Neuralnet function: hidden=c(5,2) 2 layers, 5 nodes for first layer
nn = neuralnet(frm,data=wine_norm,hidden=c(5,2),linear.output=F)
plot(nn)
print(nn)

#How well we did??
#wine_norm= as.data.frame(wine_norm) # Needs to be a data frame or it wont compute the variable properly

# We need to measure the effectiveness of the network by examining how it performed with its data
wine_norm$predict = compute(nn, covariate = wine_norm[,-1])$net.result
# since the prediction here is a decimal number we can make a cutoff point based on the original classificaiton 
wine_norm$predict_class = ifelse(wine_norm$predict < .33, 1, ifelse( wine_norm$predict < .66, 2,3))
wine_norm$class_orig = wine$class  # put back the class as it originally was. 
wine_norm$predict_win = as.numeric(wine_norm$predict_class == wine_norm$class_orig)

head(wine_norm[,c('predict_class', 'class_orig')])

table(wine_norm$predict_class,wine_norm$class_orig)

# Work an example using a 90% train set 


## CREATE MULTINODES IF THERE IS NO ORDER (this example obviously has order but we can act as though there is none) 
wine_multi = wine
wine_multi$class_1 = as.numeric(wine_multi$class == 1) 
wine_multi$class_2 = as.numeric(wine_multi$class == 2)
wine_multi$class_3 = as.numeric(wine_multi$class == 3)

wine_multi_norm = cbind(wine_multi[,1], apply(wine_multi[,-1], 2, FUN =min_max_normal))
wine_multi_norm = wine_multi_norm[,-1]  # remove the class column since we have class_1, class_2 and class_3
inputs = length(wine_multi_norm)-3
neuron_estimate  = ceiling(nrow(wine_multi_norm) / (2 * (inputs + 3)))

n = names(wine_multi_norm)
frm = as.formula(paste("class_1 + class_2 + class_3 ~", paste(n[!n %in% c("class_1","class_2","class_3")], collapse = " + ")))
# OR USE LONG HAND VERSION 
# class_1 + class_2 + class_3 ~ alcohol + malic_acid + ash + alaclinity + magnesium + total_phenols + flavanoids + nonflavanoid_phenols + proanthocyanins + color_intensity + hue + OD280Ratio + Proline
nn = neuralnet(frm,data=wine_multi_norm,hidden=c(4,2),linear.output=F)
plot(nn)

nn$weights
nn$result.matrix
names(wine_multi_norm)
wine_multi_norm_predict = compute(nn, covariate = wine_multi_norm[,c(-14,-15,-16)])$net.result
round(wine_multi_norm_predict,4)
wine_multi_norm_predict = as.matrix(cbind(wine_multi_norm_predict, wine_multi_norm[,14:16]))
head(wine_multi_norm_predict)
wine_multi_norm_predict = as.data.frame(wine_multi_norm_predict)


### ALTERNATIVELY WE CAN PREDICT A CONTINUOUS VARIABLE

#Using the airquality data airquality

apply(airquality,2,function(x) sum(is.na(x))) #data, margin - 2 is columns, function to be applied)

# at this point les select only those rows with complete cases

airquality_2 = airquality[ complete.cases(airquality),]
#unfortunately reduces our dataset down to 111 observations. 
# apply min max across all variables 
airquality_2_norm  = as.data.frame(apply(airquality_2, 2, FUN =min_max_normal))
inputs = ncol(airquality_2_norm)
outputs = 1
neuron_estimate  = ceiling(nrow(airquality_2_norm) / (2 * (inputs + outputs)))
neuron_estimate
n = colnames(airquality_2_norm)   #note difference between colnames and names here, is based on return type

frm = as.formula(paste("Ozone ~", paste(n[!n %in% "Ozone"], collapse = " + ")))
# OR USE LONG HAND VERSION 
# frm = Ozone ~ Solar.R + Wind + Temp + Month + Day
nn = neuralnet(frm,data=airquality_2_norm,hidden=c(6,2),linear.output=T) # linear.output=T
plot(nn)

#compute errors
airquality_result = cbind(airquality_2_norm$Ozone, as.data.frame(compute(nn, airquality_2_norm[,-1])$net.result))
airquality_result$err = round(airquality_result[,2] - airquality_result[,1],3)  
mean(abs(airquality_result$err))
