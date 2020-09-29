DF <- read.csv("example_salary.csv",stringsAsFactors=F,na="-")
head(DF,5)

colnames(DF)
colnames(DF) <- c("age","salary","specialSalary","workingTime","numberOfWorker","career","sex")

temp <- tapply(DF$salary, DF$sex,mean,na.rm=T)
temp

library("ggplot2")
library("reshape2")
melt <- melt(temp)
ggplot(melt, aes(x=Var1, y=value, fill=Var1)) + geom_bar(stat="identity")

tapply(salary, sex, sd, na.rm=T)
tapply(salary,sex,range,na.rm=T)

temp <- tapply(salary,career,mean,na.rm=T)
temp

melt <- melt(temp)
ggplot(melt, aes(x=Var1, y=value, group=1)) + geom_line(colour="skyblue2", size=2) + coord_polar() + ylim(0, max(melt$value))

tapply(salary, career, sd, na.rm=T)
tapply(salary, career, range, na.rm=T)

a1 <- DF[which(salary==1172399),]
a2 <- DF[which(salary==1685204),]
a3 <- DF[which(salary==1117605),]
a4 <- DF[which(salary==1245540),]
a5 <- DF[which(salary==1548036),]
list <- list(a1,a2,a3,a4,a5)
list