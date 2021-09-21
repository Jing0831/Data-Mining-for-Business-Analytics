# Module 1 Sample Code

#My first program is below
a = 6
b = 7  # set b to 7 

`_grade` = 80
weighted_grade = 80*.2
student_name = "John Doe"

# Basic Sample Calculations
6+2
8-3
7*3
21/3
8^2
8**2
10%%3
10%/%3

#Logical Operators

a<b
a<=b
a>b
a>=b
a==b
a!=b
!a
!(a==b)

#Factors
quality = factor(c("medium", "low", "medium", "medium", "high", "low", "high"))
quality
levels(quality)
nlevels(quality)
relevel(quality, ref="medium")   # relevels with control being "medium"

#Vectors
1:3     #produces a vector 1,2,3
8:15    #produces a vectors from 8 to 15
c(1,2,3) #produces a numeric vector 1,2,3
c("NYC", "CHI", "LA")  #produces a character vector with the three cities
c(1,5:7)  #produces a numeric vector 1,5,6,7


#Assign vector to a variable
v1 = c(1,5:7)
v1[2]       #would print the number 5 , since its the second element in the vector
v1[2:3]     #would print the second and third element of the vector (5,6)
v1[2] = 22   #would replace the second element in the vector with 22


#Matrix
matrix( c(1,4,3,7,8,1), ncol=2, nrow=3, byrow=T)

A = matrix(c(2,1,3,2), ncol=2, byrow=FALSE)
B = matrix(c(1:6), ncol=3, byrow=TRUE)
C = matrix(c(1,0,0,0,1,0,0,0,1), ncol=3, byrow=TRUE)

A = matrix(c(2,3,2,2), ncol=2, nrow=2, byrow=T)
B = matrix(c(5,1,3,4), ncol=2, nrow=2, byrow=T)
C = A %*% B 

m = matrix( c(1,4,3,7,8,1), ncol=2, nrow=3, byrow=T)

m[1][1]   #prints 1
m[2][3]   #prints 5
m[1] 		#prints the first row   1, 4, 3

m[2,1] = 21   #replaces the 7 in row 2 column 1, with a 21


#Data Frames
df = data.frame( ID = c(1,2,3),
                 First_Name = c("Jane","John","Mark"),
                 Last_Name = c("Doe", "Smith", "Ormon"),
                 Student = c(TRUE, FALSE, FALSE))

df[1,2]     # returns “Jane”
df[1,"Student"]    #returns “TRUE”
df[3,"ID"] =7  #would replace the number 3 with 27 . 

df[   , 1]   # returns all “rows” in the first column 
df[ 1 , ]    # returns all “columns” in the first row
df[ 1:2 , ]  # returns all “columns” in the first and second row
df[ ,c(1,3) ]# returns the first and third column of all rows 

df$ID     			# returns the entire ID column
df$Last_Name[1]   	# returns the 1st element in the Last_Name column
df$Student = c(FALSE, FALSE, FALSE)  
# sets the three elements in the Student column to false

#Special Functions
head(df)
tail(df)
dim(df)
nrow(df)
ncol(df)
str(df)
names(df)
colnames(df)


# LISTS 
df = data.frame( ID = c(1,2,3),
                 First_Name = c("Jane","John","Mark"),
                 Last_Name = c("Doe", "Smith", "Ormon"),
                 Student = c(TRUE, FALSE, FALSE))

B = matrix(c(5,1,3,4), ncol=2, nrow=2, byrow=T)
myvector = c(1,5:7)
mylist = list(c("My","False","New"),TRUE,c(0,1,2,3))
x = list(2, df, 7.0, TRUE, B, myvector, mylist)

x[[1]]    # returns the first element in the list, which is 2
x[[2]]    # would return the data frame in the second element of the list
x[[3]] = df  # would replace the third element in the list with the df object

names(x) = c("record", "table1", "Index", "Active","scores", "friends","extras")

x$Active  # returns True, 4th element, from the list

#TIBBLES
#Note the mpg data set is built into R , through the ggplot2 package 
# run library(ggplot2) to load this dataset


tibble(mpg)
mpg$cyl
mpg[1,"year"]


#Import Data
filename = "https://blogs.fiveelementanalytics.com/Data/school-enrollment.csv"
newdata = read.csv(filename)
newdata


## CONDITIONS
#Example 1: 
a=6
if (a == 6 ) {
  print ("A is 6")
}
print("End of Program")


#Example 2: 
a=6
if (a == 6 ) {
  print ("A is 6")
} else {
  print ("A is not 6")
}
print("End of Program")

#Example 3: 
a=6
if (a == 3 ) {
  print ("A is 3")
} else if(A == 6) {
  print ("A is 6")
} else {
  print ("A is Unknown")
}
print("End of Program")

#Example 4: 
a=6
str = ifelse(a==6, "A is 6", "A is not 6") 
print(str)
print("End of Program")

#Example 5: 
a=2
str = switch(a,"A is 1", "A is 2", "A is 3", "A is Unknown")
print(str)
print("End of Program")

### LOOPS

#while() Example: 
a = 1
while ( a < 6) {
  print (a)
  a = a + 1
}     

#while (conditional expression) {
#   statement}

#for() Example 2: 
my_vector = c(1:4) 
for ( i in my_vector) {
  print (i)
}

#for (value in vector) {
#    statement}


#Example 3: 
# df contains 5 columns, 30 rows
# the column 'city' is a factor with 3
# possible values (CHI, LA, NY)  

for ( i in df$city) {
  print (i)
  print (as.character(i))
}

#Example 4: 
i = 1
while ( i <= 10) {
  i = i + 1
  if ( i < 4 ) next 
  if (i >= 8) break 
  print( i ) 
}

#Example 5:
i=1
repeat{ 
  print(i)
  if ( i == 6) break
  i=i+1
}

#Functions
#Calling a function is very simple, by providing the name of the function and some parameters.
print ("Hello")      # calls the function print, with 1 string parameter 
plot (x,y)			  # calls the plot function, with 2 parameters x and y
matrix (c(3,4,2,1), nrow=2, byrow=T) # calls the matrix function with 3 parameters

#create a function
my_function1=function(){
  a=6
  a=a*7
  print(a)
}
my_function1()

my_function2 = function ( a ) {
  a = a * 7
  print(a) 
} 
my_function2(5)

my_function3 = function ( a=4 ) {
  a = a * 7
  a# a is the last line of the function, therefore it's value will be returend out
} 
z = my_function3(3)
print (z)  # will print 21 
w = my_function3()
print(w)
# This parameter has a default(4).
# IF no value is passed in, a will be assigned 4.

my_function4=function(name, a=4){
  a=a*7
  print(name)
  print(a)
}
my_function4("Jone",1)
my_function4('joni')


# Strings

my_string = "hello this is a wonderful world"
nchar(my_string) 

my_string1 = "hello"
my_string2 = "there"

paste(my_string1, my_string2)
paste(my_string1, my_string2, sep="-") 
paste(my_string1,my_string2,"world",sep="-")

name = "John Doe"
age = 42
salary  = 17.62

sprintf("Hello %s Your age is %d and your hourly salary is %4.2f", name, age, salary)

sprintf("%1.0f", pi)
sprintf("%.3f", pi)

substr("Hello Brave New World", 7,11)

strsplit("A text I want to display with spaces", split=" ")

str = "Hello world, I want to see where everything is!!!"

#Filtering Data Frames

subdf = mpg[ , 1:7]  # yields the first seven columns 
subdf
subdf = mpg[ , c(1:3, 6, 9:11)] # yields columns 1,2,3,6,9,10,11
subdf
subdf = mpg[ , c("manufacturer", "model", "year")] # returns these columns 
subdf
#using the mpg dataset
#using a new dataset (mpg) from ggplot2 library
subdf = mpg[1:6,]  # yields the first six rows 
subdf
subdf = mpg[c(1:5, 11, 21:31), ] # yields rows 1-5, 11, 21-31
subdf
subdf = mpg[ c("Mazda RX4", "Hornet Sportabout", "Valiant"),] # returns these rows 
subdf

subdf = mpg[ 1:100, -2]  # removes the second column, but provides the first 100 rows 
subdf
subdf = mpg[-1 , -c(1:3, 6)] # removes first row and removes columns 1,2,3,6
subdf
subdf = mpg[1:10, c("First Name", "Last Name") ] # first ten rows and the two columns
subdf
mpg = as.data.frame(mpg)  # Need to convert to a data frame 

mpg_pass = mpg [ mpg[, "hwy"] > 24, ] 
summary(mpg$hwy)
# self code:
df[,2]=c(1,0,0)
df
df_pass= df[df[,2]>=1]
df_pass
summary(df[,2])

#JINGYI
#Filter Data
filename = "https://blogs.fiveelementanalytics.com/Data/exams.csv"
class_grades = read.csv(filename)
dfcols = names(class_grades) # returns a vector of names 
dfcols
subdf = class_grades[   , dfcols %in% c('FirstName', 'LastName', 'Zip') ]
subdf
subdf_other = class_grades[   , !(dfcols %in% c('FirstName', 'LastName', 'Zip')) ]
subdf_other

maxval = max(class_grades$Grade)  # returns the maximum value in the grade columns
obs = which(class_grades$Grade = maxval)   #returns the position (observation) of the maximum value
student= class_grades[obs,   ] # returns the actual record

#this can be combined into one line
student = class_grades[ which(class_grades$Grade == max(class_grades$Grade)),  ] 

#Note: if more than one student received the maximum grade, the result would be multiple observations.  

students_above_mean = class_grades[ which(class_grades$Grade >= mean(class_grades$Grade)),  ] 
students_below_mean = class_grades[ which(class_grades$Grade < mean(class_grades$Grade)),  ] 

students_above_median = class_grades[ which(class_grades$Grade >= median(class_grades$Grade)),  ] 
students_below_median = class_grades[ which(class_grades$Grade < median(class_grades$Grade)),  ] 


#Subset using the mpg dataset
df = subset(mtcars, cyl>4, select=c(mpg,hp,drat))
df = subset(mtcars, cyl>4 && hp > 140, select=c(mpg,hp,drat))


#Sample function
# the mtcars dataset is built into R in the base package

sample(1:nrow(mtcars), 10)   # generates 10 randomly reordered numbers
sample(1:nrow(mtcars), 10, replace =TRUE)   # generates 10 randomly reordered numbers with replacement

# example below shows how the sample function can be used to select the rows from a dataset 
sample_df = mtcars [ sample(1:nrow(mtcars), 10) , ] # returns 10 records
#sample_df will now have a randomly selected 10 rows. 

#Randomize dataset using random number generator
mtcars$rnd = runif(nrow(mtcars), 1,100)
mtcars_train = mtcars[ mtcars$rnd <= 80,  ]
mtcars_test = mtcars[ mtcars$rnd > 80,   ]

#Randomize dataset using random number generator
B=ncol(mtcars)
B #returns 11
mtcars$rnd = runif(nrow(mtcars), 1,100) 
#a new column is created for this random number
B #returns 12
mtcars$rnd
mtcars_train = mtcars[mtcars$rnd <= 80, ]
# filter the dataset where this number is <= 80 
# to create a sample training set with approximatedly 80% of the data.
mtcars_train
mtcars_test = mtcars[mtcars$rnd > 80, ]
# respresenting 20% of the data.