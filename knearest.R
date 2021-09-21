glass<- read_csv("https://archive.ics.uci.edu/ml/machine-learning-databases/glass/glass.data",  col_names = FALSE)

# 1. Id number: 1 to 214
# 2. RI: refractive index
# 3. Na: Sodium (unit measurement: weight percent in corresponding oxide, as 
#                are attributes 4-10)
# 4. Mg: Magnesium
# 5. Al: Aluminum
# 6. Si: Silicon
# 7. K: Potassium
# 8. Ca: Calcium
# 9. Ba: Barium
# 10. Fe: Iron
# 11. Type of glass: (class attribute)
# -- 1 building_windows_float_processed
# -- 2 building_windows_non_float_processed
# -- 3 vehicle_windows_float_processed
# -- 4 vehicle_windows_non_float_processed (none in this database)
# -- 5 containers
# -- 6 tableware
# -- 7 headlamps

#put in the headers
names(glass) = c("id", "ri", "na", "mg", "al", "si", "k", "ca", "ba", "fe", "type")
#convert to data frame since it is imported as a tibbe (see read_csv)
glass = as.data.frame(glass)
# Need to fix the glass type as factor
glass$type = as.factor(glass$type)

#view summary 
summary(glass)

#plot the RI with Na coded for type of classr
ggplot(glass, aes(x=na, y=ri, colour=type)) +
  geom_point() +
  ggtitle("Reflective Index / Sodium (coded by type of glass)")

summary(glass)

# in this case we will create three new records
# note this data is slightly changed from the powerpoint presentation 
# to create a separation on the class
#made the following data frame up
#or take out some row, then test the result
newglass = data.frame( id = c(215,216,217), 
                       ri = c(1.516, 1.520, 1.519),
                       na = c(12.55, 14.5, 15.5),
                       mg = c(3.4,3.1,3.9),
                       al = c(1.8,1.62, 1.4),
                       si = c(73.21, 73.6,72.5),
                       k = c(.64, .522, .555),
                       ca = c(8.07,8.4, 8.1),
                       ba = c(0,0,0),
                       fe = c(.00,.25,0),
                       type = c(3,3,4))
View(newglass)
#take out the column
trueclass = glass$type
library(class)
knnmdl <- knn(glass[,c(2:10)],#original dataset
           newglass[,c(2:10)],#need to be classified
           trueclass,#put in this factor
            k = 3,
           prob = TRUE)

knnmdl
#> knnmdl 
#[1] 2 1 1 #how to classify the new observations
#attr(,"prob")
#[1] 0.6666667 0.6666667 0.6666667 (which is 2/3)
#Levels: 1 2 3 5 6 7

#put the classification back into the data frame
newglass[1,"type"] = as.numeric(as.character(knnmdl[1]))
newglass[2,"type"] = as.numeric(as.character(knnmdl[2]))
newglass[3,"type"] = as.numeric(as.character(knnmdl[3]))


# calculate distances
# normalize records
glass2 = glass
glass2$ri = scale(glass2$ri)
glass2$na = scale(glass2$na)
glass2$mg = scale(glass2$mg)
glass2$al = scale(glass2$al)
glass2$si = scale(glass2$si)
glass2$k = scale(glass2$k)
glass2$ca = scale(glass2$ca)
glass2$ba = scale(glass2$ba)
glass2$fe = scale(glass2$fe)


newglass2 = newglass
newglass2$ri = scale(newglass2$ri)
newglass2$na = scale(newglass2$na)
newglass2$mg = scale(newglass2$mg)
newglass2$al = scale(newglass2$al)
newglass2$si = scale(newglass2$si)
newglass2$k = scale(newglass2$k)
newglass2$ca = scale(newglass2$ca)
newglass2$ba = scale(newglass2$ba)
newglass2$fe = scale(newglass2$fe)

library(fields) 
together <- rbind(newglass,glass)

together = newglass
together$ri = scale(together$ri)
together$na = scale(together$na)
together$mg = scale(together$mg)
together$al = scale(together$al)
together$si = scale(together$si)
together$k = scale(together$k)
together$ca = scale(together$ca)
together$ba = scale(together$ba)
together$fe = scale(together$fe)

library(fields) 
together <- rbind(newglass,glass)
# The top row has the
# distances from New 
d = rdist(together[,c(2:10)])
like = which(d[1,] == min(d[1,-1]))
glass[like,]
newglass[1,]
      
like = which(d[2,] == min(d[2,-2]))
glass[like,]
newglass[2,]

like = which(d[3,] == min(d[3,-3]))
glass[like,]
newglass[3,]


