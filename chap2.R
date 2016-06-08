ls() # list of all the objects we have
rm() # deteles what we do not need
rm(list=ls()) # remove all objects at once
matrix(data=c(1,2,3,4), nrow=2, ncol=2, byrow = F, dimnames = NULL) 
# byrow is how arguments are passed into the function 
# if TRUE then matrix will be populated in the order of rows
set.seed()
rnorm(n, mean = 0, sd = 1)

# Chapter 2 Lab: Introduction to R

# Basic Commands

x <- c(1,3,2,5)
x
x = c(1,6,2)
x
y = c(1,4,3)
length(x)
length(y)
x+y
ls()
rm(x,y)
ls()
rm(list=ls())
?matrix
x=matrix(data=c(1,2,3,4), nrow=2, ncol=2)
x
x=matrix(c(1,2,3,4),2,2)
matrix(c(1,2,3,4),2,2,byrow=TRUE)
sqrt(x)
x^2
x=rnorm(50)
y=x+rnorm(50,mean=50,sd=.1)
cor(x,y)
set.seed(1303)
rnorm(50)
set.seed(3)
y=rnorm(100)
mean(y)
var(y)
sqrt(var(y))
sd(y)

# Graphics

x=rnorm(100)
y=rnorm(100)
plot(x,y)
plot(x,y,xlab="this is the x-axis",ylab="this is the y-axis",main="Plot of X vs Y")
pdf("Figure.pdf")
plot(x,y,col="green")
dev.off()
x=seq(1,10)
x
x=1:10
x
x=seq(-pi,pi,length=50)
y=x

# The result of applying the outer product to a pair of coordinate vectors 
# is a matrix. The name contrasts with the inner product, which takes as 
# input a pair of vectors and produces a scalar.

f=outer(x,y,function(x,y)cos(y)/(1+x^2))

# A contour line (also isoline, isopleth, or isarithm) of a function of 
# two variables is a curve along which the function has a constant 
# value. It is a cross-section of the three-dimensional graph of the 
# function f(x, y) parallel to the x, y plane. 
contour(x,y,f)
contour(x,y,f,nlevels=45,add=T)

# t(f) - matrix transpose
fa=(f-t(f))/2
contour(x,y,fa,nlevels=15)

# image() is the same as contour but produces the color-coded plot
# so called heatmap
image(x,y,fa)

# persp() produces a 3D graph, theta and phi control the angle
persp(x,y,fa)
persp(x,y,fa,theta=30)
persp(x,y,fa,theta=30,phi=20)
persp(x,y,fa,theta=30,phi=70)
persp(x,y,fa,theta=30,phi=40)

# Indexing Data

A=matrix(1:16,4,4)
A
A[2,3]
A[c(1,3),c(2,4)]
A[1:3,2:4]
A[1:2,]
A[,1:2]
A[1,]
A[-c(1,3),]
A[-c(1,3),-c(1,3,4)]
dim(A)

# Loading Data

getwd()
setwd("C:/Users/U400/Documents/Blog on data/ISL")

Auto=read.table("http://www-bcf.usc.edu/~gareth/ISL/Auto.data")

# fix() is used to view the spreadsheet in window
fix(Auto)

Auto=read.table("http://www-bcf.usc.edu/~gareth/ISL/Auto.data",header=T,na.strings="?")
fix(Auto)
Auto=read.csv("Auto.csv",header=T,na.strings="?")
fix(Auto)
dim(Auto)
Auto[1:4,]

# na.omit() removes rows with NA from the dataset
Auto=na.omit(Auto)
dim(Auto)
names(Auto)

# Additional Graphical and Numerical Summaries

plot(Auto$cylinders, Auto$mpg)
attach(Auto)
plot(cylinders, mpg)
cylinders=as.factor(cylinders)
plot(cylinders, mpg)
plot(cylinders, mpg, col="red")
plot(cylinders, mpg, col="red", varwidth=T)
plot(cylinders, mpg, col="red", varwidth=T,horizontal=T)
plot(cylinders, mpg, col="red", varwidth=T, xlab="cylinders", ylab="MPG")
hist(mpg)
hist(mpg,col=2)
hist(mpg,col=2,breaks=15)

# pairs() creats a scatterplot matrices for all pairs of variables
pairs(Auto)
pairs(~ mpg + displacement + horsepower + weight + acceleration, Auto)
plot(horsepower,mpg)

# x-axes var, y-axes var and the var whose value we want to see for each point
identify(horsepower,mpg,name)
summary(Auto)
summary(mpg)

savehistory()
q()
loadhistory()