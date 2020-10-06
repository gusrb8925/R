DF <- read.csv("example_studentlist.csv")
attach(DF)

str(DF)

plot(age)
plot(height, weight)
plot(weight~height)
sex <- as.factor(sex)
str(DF)
plot(height, sex)
plot(sex, height)

DF2 <- data.frame(height,weight)
DF2
plot(DF2)

DF3 <- cbind(DF2, age)
DF3
plot(DF3)
plot(DF)

plot(weight~height, pch=as.integer(sex))
legend("topleft",c("남","여"),pch=DF$sex)

coplot(weight~height | sex)

plot(weight~height,ann=F)
title(main="A대학 B학과생 몸무게와 키의 상관관계")
title(xlab="몸무게")
title(ylab="키")
grid()
weightMean <- mean(height)
abline(v=weightMean, col="red")

FreqBlood <- table(DF$bloodtype)
FreqBlood
barplot(FreqBlood)
title(main="혈액형별 비도수")
title(xlab="혈액형")
title(ylab="빈도수")

Height <- tapply(DF$height, DF$bloodtype, mean)
Height
barplot(height, ylim=c(0,200))

boxplot(height)
boxplot(height~bloodtype)

hist(height)
hist(height, breaks=10)
hist(height, breaks=10, prob=T)
lines(density(height))
BreakPoint <- seq(min(height), max(height)+7,by=7)
hist(height, breaks=BreakPoint)
DiffPoint <- c(min(height), 165, 170, 180, 185, 190)
hist(height, breaks=DiffPoint)

par(mfrow=c(2,3))
plot(weight,height)
plot(sex,height)
barplot(table(bloodtype))
boxplot(height)
boxplot(height~bloodtype)
hist(height,breaks=10)
par(mfrow=c(1,1))
plot(weight~height+age+grade+absence+sex)

TS1 <- c(round(runif(30)*100))
TS1

TS2 <- c(round(runif(30)*100))
TS2

TS1 <- sort(TS1, decreasing=F)
TS2 <- sort(TS2, decreasing=F)
TS1
TS2

plot(TS1,type="l")
lines(TS2, lty="dashed",col="red")

x1 <- seq(1,100,1)
y1 <- dbinom(x1, 100, 0.25)
x2 <- seq(1,50,1)
y2 <- dbinom(x2, 50, 0.5)
plot(x1, y1, type="h", ylim=c(0,0.2))
lines(x2, y2, col="red")

DF1 <- data.frame(x=x1, y=y1, t=1)
DF2 <- data.frame(x=x2, y=y2, t=1)
DF <- rbind(DF1, DF2)
plot(DF$y~DF$x, type="p", pch=DF$t, col=c("red","blue"))

plot(x1,y1,type="p")
plot(x1,y1,type="l")
plot(x1,y1,type="c")
plot(x1,y1,type="b")
plot(x1,y1,type="h")
plot(x1,y1,type="s")

library("ggplot2")
library("ggthemes")
ggplot(data=diamonds,aes(x=carat,y=price, colour=clarity)) + geom_point() + theme_wsj()

a <- plot(height)
a

g1 <- ggplot(data=diamonds,aes(x=carat,y=price,colour=clarity))
g2 <- geom_point()
g3 <- theme_wsj()
g1+g2+g3
g1 + g2 + theme_bw()

DF <- read.csv("example_studentlist.csv")
g1 <- ggplot(DF, aes(x=height,y=weight,colour=bloodtype))
g1 + geom_point()
g1 + geom_line()
g1 + geom_line() + geom_point()
g1 + geom_line(size=1) + geom_point(size=10)
g1 + geom_point(size=10) + geom_line(size=1) + facet_grid(.~sex)
g1 + geom_point(size=10) + geom_line(size=1) + facet_grid(sex~.)
g1 + geom_point(size=10) + geom_line(size=1) + facet_grid(sex~., scales="free")
g1 + geom_point(size=10) + geom_line(size=1) + facet_wrap(~sex, scales="free")

g <- ggplot(mpg, aes(displ, hwy))
g + geom_point()
g + geom_point() + facet_grid(.~class)
g + geom_point(alpha=.3) + facet_grid(cyl~class,scales="free")
g + geom_point(alpha=.3) + facet_wrap(cyl~class,scales="free")
g + geom_point(alpha=.3) + facet_wrap(cyl~class,scales="free", ncol=3)

ggplot(DF, aes(x=bloodtype)) + geom_bar()
ggplot(DF, aes(x=bloodtype, fill=sex)) + geom_bar()
ggplot(DF, aes(x=bloodtype, fill=sex)) + geom_bar(position="dodge")
ggplot(DF, aes(x=bloodtype, fill=sex)) + geom_bar(position="identity")
ggplot(DF, aes(x=bloodtype, fill=sex)) + geom_bar(position="fill")
ggplot(DF, aes(x=bloodtype, fill=sex)) + geom_bar(position="dodge",width=0.3)

g1 <- ggplot(diamonds,aes(x=carat))
g1 + geom_histogram(binwidth=0.1, fill="orange")
g1 + geom_histogram(aes(y=..count..),binwidth=0.1, fill="orange")
g1 + geom_histogram(aes(y=..ncount..),binwidth=0.1, fill="orange")
g1 + geom_histogram(aes(y=..density..),binwidth=0.1, fill="orange")
g1 + geom_histogram(aes(y=..ndensity..),binwidth=0.1, fill="orange")
g1 + geom_histogram(binwidth=0.1, fill="orange") + facet_grid(color~.)
g1 + geom_histogram(binwidth=0.1, fill="orange") + facet_grid(color~., scales="free")
g1 + geom_histogram(aes(fill=color),binwidth=0.1, alpha=0.5)
g1 <- ggplot(DF, aes(x=weight, y=height))
g1 + geom_point()
g1 + geom_point(aes(color=sex),size=7)
g1 + geom_point(aes(color=sex, shape=sex),size=7)
g1 + geom_point(aes(color=sex, shape=bloodtype),size=7)
g1 + geom_point(aes(color=height, shape=sex),size=7)
g1 + geom_point(aes(size=height, shape=sex),colour="orange")
g1 + geom_point(aes(color=height, shape=bloodtype),size=7,alpha=0.6)
g1 + geom_point(aes(color=sex),size=7) + geom_smooth(method="lm")
g1 + geom_point(aes(color=sex),size=7) + geom_text(aes(label=name))
g1 + geom_point(aes(color=sex),size=7) + geom_text(aes(label=name), vjust=-1.1, colour="grey35")

library("ggthemes")
g1 + geom_histogram(aes(y=..ndensity..), binwidth=0.1, fill="orange") + theme_wsj()