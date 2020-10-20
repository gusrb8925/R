x <- seq(from=0, to=100, by=1)
x
y <- dnorm(x, mean=50, sd=12)
y
plot(x,y,type="l")

x <- seq(from=0, to=100, by=1)
y <- dbinom(x, size=100, prob=0.5)
plot(x,y,type="l")

data <- rnorm(300, mean=70, sd=20)
Ddata <- density(data)
Ddata
plot(Ddata)

library("ggplot2")
DF <- data.frame(data)
DF

ggplot(DF, aes(x=data)) + geom_density()

library("ggthemes")
ggplot(DF,aes(x=data)) + geom_density(fill="skyblue2", colour="dodgerblue1",alpha=0.4)+ xlim(c(-10,140)) + theme_wsj()

CI <- qnorm(c(0.05,0.95), mean=623, sd=90)
CI
Sample <- read.csv("example_test_statistic_ex1_sample.csv")
head(Sample,3)
Sample <- Sample[-1]

CI
mean(Sample$point)

Population <- read.csv("example_test_statistic_ex2_population.csv")
head(Population, 10)

Population <- Population[-1]
head(Population,2)

mean(Population$point)
sd(Population$point)

CI <- qnorm(c(0.05,0.95), mean=mean(Population$point),sd=sd(Population$point))
CI

Sample <- read.csv("example_test_statistic_ex2_sample.csv")
head(Sample,3)

CI
mean(Sample$point)