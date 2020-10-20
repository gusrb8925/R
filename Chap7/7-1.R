lm(mpg~hp,data=mtcars)

DF <- data.frame(Work_hour=1:7, Total_pay=seq(10000,70000,by=10000))
plot(Total_pay~Work_hour,data=DF,pch=20,col="red")
grid()

LR <- lm(Total_pay ~ Work_hour, data=DF)
LR

mode(LR)
abline(LR, col="blue", lwd=2)

DF <- read.csv("example_kbo2015.csv")
str(DF)

DF$H
DF$HR

cor(DF$H, DF$HR)

plot(HR~H, data=DF, pch=20,col="grey",cex=1.5)

Lm <- lm(HR~H, data=DF)
Lm

abline(Lm, lwd=2, col="red")
mtcars
str(mtcars)

cor(mtcars$hp, mtcars$mpg)
plot(mpg~hp, data=mtcars)
Lm <- lm(mpg~hp, data=mtcars)
abline(Lm, col="red")
Lm

options(scipen=999) #scientific notation이 나오지 않도록 함
summary(Lm)

confint(Lm)

par(mfrow=c(2,2)) #그래프 4개 한번에 보기
plot(Lm)

DF <- read.csv("example_residuals_checking.csv")
head(DF,3)

Lm.res1 <- lm(y1~x1,data=DF)
Lm.res1
Lm.res2 <- lm(y2~x2,data=DF)
Lm.res2


par(mfrow=c(2,1))
plot(y1~x1,DF,pch=20,cex=1.5,yli=c(0,30),main="Data1")
plot(y2~x2,DF,pch=20,cex=1.5,yli=c(0,30),main="Data2")

par(mfrow=c(2,1))
plot(y1~x1,DF,pch=20,cex=1.5,yli=c(0,30),main="Data1")
abline(Lm.res1,col="blue",lwd=2)
plot(y2~x2,DF,pch=20,cex=1.5,yli=c(0,30),main="Data2")
abline(Lm.res2,col="blue",lwd=2)

options(scipen=999)
summary(Lm.res1)
summary(Lm.res2)

par(mfrow=c(2,2))
plot(Lm.res1)
plot(Lm.res2)

DF <- mtcars
str(DF)

Lm <- lm(hp~cyl+wt,data=DF)
Lm

summary(Lm)

DF <- read.csv("example_kbo2015.csv")
head(DF,3)
str(DF)

Lm <- lm(HR~TB,data=DF)
Lm

summary(Lm)
b <- predict(Lm)
b

DF$HR[1]
b[1]

Com <- data.frame(team=DF$team,HR=DF$HR,fittedHR=b)
Com

NewTeam <- data.frame(TB=1600)
predict(Lm, newdata=NewTeam)