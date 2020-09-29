print("Hello WOrld")
9*8*7*6*5*4*3*2*1
factorial(9)
rep(x="배고파", times=5)

plot(10,10)
plot(c(5,7),c(20,30))
plot(runif(100),runif(100))

Object1 <- 1
Object2 <- 2
Object1
Object2

Object1 <- "문자열"
Object2 <- "데이터"
paste(Object1,Object2)

Object1 <- TRUE
Object2 <- FALSE
Object1
Object2

Object1 <- 1
Object2 <- 2
Object1 <- Object2
Object1

Object1 <- 1
Object2 <- 2
Object1 <- Object2
Object2 <- 100
Object1

Object1 <- sum(1,8,4,5,9)
Object1

a <- c(1,3,5,6,9)
a

a <- 1
is.vector(a)
a <- c(1,2,5)
is.vector(a)

a <- c("문자열°","데이터","배고파")
a

a <- c(1,2,5,"문자열")
a

Object <-c(1,3,8,9)
Object <- c(Object,11)
Object
Object <- c(0,Object)
Object
Object <- append(Object,99,after=2)
Object
Object <- Object[-2]
Object
Object <- Object[-length(Object)]
Object
Object[3] <- 9
Object
Object <- c(1,2,3,1,2,3,1,2,3,5,1,2,3)
Object
Object[Object ==5] <-100
Object

ls()
ls.str()

rm(a)
ls.str()
rm(list=ls())
ls.str()

install.packages("rgl")
library("rgl")
example(plot3d)

install.packages("ggplot2")
install.packages("ggthemes")
install.packages("data.table")
install.packages("devtools")
install.packages("dplyr")
install.packages("plyr")
install.packages("reshape2")
install.packages("scales")
install.packages("stringr")
library("ggplot2")
library("ggthemes")
library("data.table")
library("devtools")
library("dplyr")
library("plyr")
library("reshape2")
library("scales")
library("stringr")

library()
installed.packages()

List <- read.csv("example_studentlist.csv")
List

List <- read.table("studentlist.txt")
List

List <- read.table("studentlist.txt",header=TRUE)
List

List <- read.table("studentlist2.txt",header=TRUE,sep=";")
List

install.packages("readxl")
library("readxl")
DF <- read_excel(path="studetlist.xlsx",sheet="Sheet1",col_names=TRUE)
DF
DF <- read_excel(path="studentlist.xlsx",sheet="Sheet1",col_names=TRUE)
DF
