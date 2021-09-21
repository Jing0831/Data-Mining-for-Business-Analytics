#GRAPHICAL EXMAPLES: 

#histogram 
ggplot(airquality, aes(x=Wind, fill=Month)) +
  geom_histogram(fill="white", color="black", binwidth=3)+
  geom_vline(aes(xintercept=mean(Wind)), color="blue",
             linetype="dashed")+
  labs(title="Wind histogram plot",x="Wind Speed/Mph", y = "Count")+
  theme_classic()

#Alteranative Simple method

hist(airquality$Wind, breaks=3)

#boxplot

box <- ggplot(data=iris, aes(x=Species, y=Sepal.Length))
box + geom_boxplot(aes(fill=Species)) + 
  ylab("Sepal Length") + ggtitle("Iris Boxplot") +
  stat_summary(fun.y=mean, geom="point", shape=5, size=4) 

boxplot(iris$Sepal.Length~iris$Species)

#Line chart

aq = aggregate(Ozone ~ Month, data=airquality, FUN=mean)
ggplot(aq, aes(x=Month, y=Ozone)) + 
  geom_line() +
  ggtitle("Monthly Average Ozone Level")

plot(Ozone ~ Month, data=aq, type ="l")

# Scatterplot

ggplot(airquality, aes(x=1:153, y=Ozone)) + 
  geom_point() +
  ggtitle("Daily Ozone Level")

plot(1:153,airquality$Ozone, type ="p")


#subsetting data

#both lines below will subset the airquality data with temperature above 80
# and only return the ozone and temp columns
airquality["Temp" > 80, c("Ozone", "Temp")]
subset(airquality, Temp > 80, select = c(Ozone, Temp))
