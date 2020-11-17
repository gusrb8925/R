library("dplyr")
library("ggplot2")
library("ggthemes")

DF <- read.csv('example_population_f.csv')
DF <- DF[,-1]
DF <- tbl_df(DF)

DF2 <- mutate(DF, SexF=ifelse(SexRatio >1 , "���ں�������", ifelse(SexRatio==1, "�����������","���ں�������")))

DF3 <- filter(DF2, Provinces=="��⵵")

Graph <- ggplot(DF3, aes(x=(SexRatio-1), y=reorder(City, SexRatio))) + geom_segment(aes(yend=City), xend=0, colour="grey50") + geom_point(size=4, aes(colour=SexF)) + theme_minimal()
Graph
