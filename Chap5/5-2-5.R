library("dplyr")
library("ggplot2")
library("ggthemes")
library("reshape2")

DF <- read.csv('example_population_f.csv')
DF <- DF[,-1]
DF <- tbl_df(DF)

group <- group_by(DF, Provinces)
DF2 <- summarise(group, SumPopulation=sum(Population), Male=sum(Male), Female=sum(Female))

DF3 <- melt(DF2, id.vars = c("Provinces", "SumPopulation"), measure.vars = c("Male", "Female"))

DF2
DF3

colnames(DF3)[3] <- "Sex"
colnames(DF3)[4] <- "Population"
DF3

DF4 <- mutate(DF3, Ratio = Population/SumPopulation)
DF4$Ratio <- round(DF4$Ratio,3)

G1 <- ggplot(DF4, aes(x=Provinces, y=Ratio, fill=Sex)) + geom_bar(stat='identity') + coord_cartesian(ylim = c(0.45, 0.55)) + theme_wsj()
G2 <- geom_text(aes(y=Ratio, label=Ratio), colour="white")
G1 + G2

DF4 <- mutate(DF4, Position = ifelse(Sex == "Male", 0.475, 0.525))
DF4

G1 <- ggplot(DF4, aes(x=Provinces, y=Ratio, fill=Sex)) + geom_bar(stat='identity') + coord_cartesian(ylim = c(0.45, 0.55)) + theme_wsj()
G2 <- geom_text(aes(y=Position, label=Ratio), colour="white")
G1 + G2