a1 <- c(5,3,6,3,1)
a1
is(a1)

a1 <- c(1L,2L,3L)
is(a1)

a1 <- as.integer(a1)
is(a1)

b <- c(1.23, 6.63452, 4.34234)
b
is(b)

a2 <- c("str1","str2","str3")
a3 <- c(7,3,7,5,2,"str")
a3
is(a3)

a2 <- as.factor(a2)
a2
is(a2)

a2 <- factor(a2, ordered=T)
a2

al <- c(5,3,6,3,1)
al
a2 <- c("str1","str2","str1","str1")
a2
a3 <- c(3.52,5.45,2.54,3.67,7.23)
a3
DF <- data.frame(al,a2,a3)
DF <- data.frame(count=al, food=a2, meanCount=a3)
DF


DF <- read.csv("example_studentlist.csv")
DF

is.vector(DF$height)
str(DF)

DF$height
mean(DF$heigth)
mean(DF$height)
Height <- DF$height
Height
DF[[7]]
DF[7]
class(DF[[7]])
class(DF[7])

DF <- read.csv("example_studentlist.csv")
DF[c(6,7)]
DF[c("bloodtype","height")]
DF[,7]
DF[2,]
DF[2,1]
DF[,"height"]

DF <- read.csv("example_studentlist.csv")
attach(DF)
height
detach(DF)

DF <- read.csv("example_studentlist.csv")
subset(DF, subset=(height>170))
subset(DF, select=c(name,height),subset=(height>180))
subset(DF, select=c(-height,-weight))

DF <- read.csv("example_studentlist.csv")
colnames(DF)
colnames(DF)[6] <- "blood"
DF
OldList <- colnames(DF)
NewList <- c("na","se","ag","gr","ab","bl","he","we")
colnames(DF) <- NewList
DF

DF <- read.csv("example_studentlist.csv")
BMI <- DF$weight/DF$height^2
BMI
DF <- cbind(DF,BMI)
DF

DF <- read.csv("example_studentlist.csv")
Omit <- read.csv("omit.csv")
Omit
DF
DF <- merge(DF, Omit, by="name")
DF

DF <- read.csv("example_studentlist.csv")
a <- c(1:20)
s <- c("str1","str2","str3")
L <- c(T,F,F,T,T,T)
List <- list(DF,a,s,L)
List
List <- list(DataFrame=DF, Number=a, Character=s,Logic=L)
List
List[1] <- NULL
List["Number"]
List[1]
class(List[1])
List[[1]]
class(List[[1]])
List[c(2,3)]
List[c("Number","Character")]
List$Number
class(List$Number)
names(List)[2] <- "Num"
List[2]

DF <- read.csv("example_studentlist.csv")
HeightBySex <- split(DF$height,DF$sex)
HeightBySex
mean(HeightBySex[[1]])
mean(HeightBySex[[2]])
sapply(HeightBySex,mean)
sapply(HeightBySex,sd)
sapply(HeightBySex,range)

DF <- read.csv("example_studentlist.csv")
DF
Freq <- table(DF$bloodtype)
Freq
ReleativeFreq <- prop.table(Freq)
ReleativeFreq 
Table <- rbind(Freq, ReleativeFreq)
Table
Table <- addmargins(Table,margin=2)
Table

DF <- read.csv("example_studentlist.csv")
FactorOfHeight <- cut(DF$height,breaks=4)
FactorOfHeight
FreqOfHeight <- table(FactorOfHeight)
FreqOfHeight 
FreqOfHeight <- rbind(FreqOfHeight,prop.table(FreqOfHeight))
FreqOfHeight
rownames(FreqOfHeight)[2] <- "RelativeFreq"
FreqOfHeight
CumuFreq <- cumsum(FreqOfHeight[2.])
CumuFreq 
FreqOfHeight <- rbind(FreqOfHeight,CumuFreq)
FreqOfHeight 
rownames(FreqOfHeight) <- c("도수","상대도수","누적도수")
FreqOfHeight
FreqOfHeight <- addmargins(FreqOfHeight,margin=2)
FreqOfHeight 

DF <- read.csv("example_studentlist.csv")
CT <- table(DF$sex,DF$bloodtype)
CT
addmargins(CT)
PropCT <- prop.table(CT)
PropCT
addmargins(PropCT)
PropCT <- prop.table(CT,margin=1)
PropCT
addmargins(PropCT,margin=2)
a <- c(1,2,3,4,NA,6,7,8,9,10)
complete.cases(a)
a <- a[complete.cases(a)]
a

a <- na.omit(a)
a
q()
