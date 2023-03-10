#base plotting

#using plot() to study continuous variables

ir <- iris
str(ir)


#syntax

#plot x.y

plot(x=ir$Petal.Width,y=ir$Sepal.Length)

#adding x, y labels title

plot(x=ir$Petal.Width,y=ir$petal.Length, main= c("width vs length"), xlab= c("width"), ylab=c("length"))

#adding colors

plot(x=ir$Petal.Width,y=ir$petal.Length, main= c("width vs length"), xlab= c("width"), ylab=c("length"), col="red")

#different plotting symbol

plot(x=ir$Petal.Width,y=ir$petal.Length, main= c("width vs length"), xlab= c("width"),
     ylab=c("length"), col="red", pch=2)

plot(x=ir$Petal.Width,y=ir$petal.Length, main= c("width vs length"), xlab= c("width"),
     ylab=c("length"), col="red", pch=3)

plot(x=ir$Petal.Width,y=ir$petal.Length, main= c("width vs length"), xlab= c("width"),
     ylab=c("length"), col="red", pch=4)

#line width

plot(x=ir$Petal.Width,y=ir$petal.Length, main= c("width vs length"), xlab= c("width"),
     ylab=c("length"), col="red", pch=2, lwd=2)

#making conditional bivariate plot

#seeing rel across species

plot(x=ir$Petal.Width,y=ir$petal.Length, main= c("width vs length"), xlab= c("width"),
     ylab=c("length"), col=ir$Species)


plot(x=ir$Petal.Width,y=ir$petal.Length, main= c("width vs length"), xlab= c("width"),
     ylab=c("length"), pch= as.numeric(ir$Species))


plot(x=ir$Petal.Width,y=ir$petal.Length, main= c("width vs length"), xlab= c("width"),
     ylab=c("length"), pch= as.numeric(ir$Species), col=ir$Species)

plot(x=ir$Petal.Width,y=ir$petal.Length, main= c("width vs length"), xlab= c("width"),
     ylab=c("length"), pch= as.numeric(ir$Species), col="green")

#cex parameter to increase size

plot(x=ir$Petal.Width,y=ir$petal.Length, main= c("width vs length"), xlab= c("width"),
     ylab=c("length"), cex=as.numeric(ir$Species))


plot(x=ir$Petal.Width,y=ir$petal.Length, main= c("width vs length"), xlab= c("width"),
     ylab=c("length"), cex=as.numeric(ir$Species), col= ir$Species)

#adding a legend
#pch to change symbols

plot(x=ir$Petal.Width,y=ir$petal.Length, main= c("width vs length"), xlab= c("width"),
     ylab=c("length"), pch=as.numeric(ir$Species))

legend(0.2,2.5,c("Setosa","Versicolor","Verginica"),pch=1:3)

#To study univariates : BOXPLOTS AND HISTOGRAMS used

#boxplots

boxplot(ir$Petal.Length)
summary(ir$Petal.Length) #mean<median ,negatively skewed

boxplot(ir$Sepal.Width)
summary(ir$Sepal.Width) #mean>median, positively skewed

#improving aesthetics of boxplot

boxplot(ir$Petal.Length, col= "red", main= "distribution")

# x<- factor variable; y<- continuous variable
plot(x=ir$Species,y=ir$Sepal.Width, main= c("species vs width"), xlab= c("species"),
     ylab=c("width"), col= "red")

#histograms
#grouping continuous variables in bins

hist(ir$Sepal.Width, col="orange")

#shows values of bins
hist(ir$Sepal.Width, col="orange", labels = TRUE)

#shows density instead of freq.
hist(ir$Sepal.Width, col="orange", freq = FALSE)

hist(ir$Sepal.Width, col="orange", labels = TRUE, freq = FALSE)

#line curve
lines(density(ir$Sepal.Width))

#adding multiple plots in single window

par(mfrow= c(1,2))
plot(x=ir$Species,y=ir$Sepal.Width, main= c("species vs width"), xlab= c("species"),
     ylab=c("width"), col= "red")
plot(x=ir$Species,y=ir$Sepal.Length, main= c("species vs Length"), xlab= c("species"),
     ylab=c("width"), col= "red")

#to resume to original state
dev.off()

#direct marketting dataset
mk<- read.csv("/Users/macmojave/Desktop/IPBA/Data Processing and Data Visualization - Pre class Video Datasets/Data Visualization in R/DirectMarketing.csv")
library(ggplot2)

#understand the relationship btw salary n amt spent

p<- ggplot(mk,aes(x=Salary, y=AmountSpent, colour=AmountSpent))
p+ geom_point()

#understand the conditional relationship based on gender
p+ geom_point(aes(colour=Gender))

#With labels
p+ geom_point(aes(colour=Gender)) +xlab("amount in $") +ylab("salary in $")

#understanding univariates
p<-ggplot(mk,aes(x=AmountSpent))
p+geom_histogram()

#understanding gender wise distribution
p<-ggplot(mk,aes(x=AmountSpent))
p+geom_histogram(aes(fill=Gender))

p<-ggplot(mk,aes(x=AmountSpent))
p+geom_histogram(aes(colour=Gender))

#modifying the position
p<-ggplot(mk,aes(x=AmountSpent))
p+geom_histogram(aes(fill=Gender),position = "dodge")

#alternative, draw a trellis plot
p+geom_histogram(aes(fill=Gender))+facet_grid(Gender~.)

#polishing the graph
p+geom_histogram(aes(fill=Gender,colour=Gender),alpha=0.3)+facet_grid(Gender~.)

#Boxplots
p<-ggplot(mk,aes(y=AmountSpent,x=Gender,fill=Gender))
p+geom_boxplot()


#Density plots
options(scipen=999)
p<-ggplot(mk,aes(x=AmountSpent))
p+geom_density(aes(fill=Gender,colour=Gender),alpha=0.3)


#Conditional density plot
p+geom_density(aes(fill=Gender))


#Improving the plot
p+geom_density(aes(fill=Gender,colour=Gender),alpha=0.4)


#2d counts

p<-ggplot(mk,aes(x=Salary,y=AmountSpent))
p+geom_point(aes(colour=AmountSpent))
p+geom_bin2d()

