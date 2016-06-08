# Chapter 3 Lab: Linear Regression
install.packages("ISLR")
install.packages("car")
library(MASS)
library(ISLR)

# Simple Linear Regression

fix(Boston)
names(Boston)
lm.fit=lm(medv~lstat)
lm.fit=lm(medv~lstat,data=Boston)
attach(Boston)
lm.fit=lm(medv~lstat)
lm.fit
summary(lm.fit)
names(lm.fit)
coef(lm.fit)
confint(lm.fit)

# prediction for a particular values of lstat
predict(lm.fit,data.frame(lstat=(c(5,10,15))), interval="confidence")
predict(lm.fit,data.frame(lstat=(c(5,10,15))), interval="prediction")

# 
plot(lstat,medv)
abline(lm.fit)

# lwd changes the width of the line
abline(lm.fit,lwd=3)
abline(lm.fit,lwd=3,col="red")

plot(lstat,medv,col="red")

# pch creates new plotting symbols
plot(lstat,medv,pch=20)
plot(lstat,medv,pch="+")

# symbols available for pch parameter
plot(1:20,1:20,pch=1:20)

par(mfrow=c(2,2))
plot(lm.fit)
plot(predict(lm.fit), residuals(lm.fit))
plot(predict(lm.fit), rstudent(lm.fit))
plot(hatvalues(lm.fit))
which.max(hatvalues(lm.fit))

# Multiple Linear Regression

lm.fit=lm(medv~lstat+age,data=Boston)
summary(lm.fit)
lm.fit=lm(medv~.,data=Boston)
summary(lm.fit)
names(lm.fit)
summary(lm.fit)$sigma
summary(lm.fit)$r.sq
library(car)
vif(lm.fit)
lm.fit1=lm(medv~.-age,data=Boston)
summary(lm.fit1)

# alternative to using lm function again
lm.fit1=update(lm.fit, ~.-age)

# Interaction Terms

summary(lm(medv~lstat*age,data=Boston))

# Non-linear Transformations of the Predictors

lm.fit2=lm(medv~lstat+I(lstat^2))
summary(lm.fit2)
lm.fit=lm(medv~lstat)

# anova compares two models. 
# H0: two models are equally good; 
# H1: full model is better
anova(lm.fit,lm.fit2)

par(mfrow=c(2,2))
plot(lm.fit2)

# poly() creates polynomial of order 5 within lm() function
lm.fit5=lm(medv~poly(lstat,5))
summary(lm.fit5)
summary(lm(medv~log(rm),data=Boston))

# Qualitative Predictors

fix(Carseats)
names(Carseats)
lm.fit=lm(Sales~.+Income:Advertising+Price:Age,data=Carseats)
summary(lm.fit)
attach(Carseats)

# returns the coding for dummy vars
contrasts(ShelveLoc)

# Writing Functions

LoadLibraries=function(){
  library(ISLR)
  library(MASS)
  print("The libraries have been loaded.")
}
LoadLibraries
LoadLibraries()
