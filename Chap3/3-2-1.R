install.packages("hflights")

library("hflights")

head(hflights,5)

str(hflights) 

CountofDest <- table(hflights$Dest)
CountofDest

length(CountofDest)
range(CountofDest)

CountofDest[CountofDest==1]
CountofDest[CountofDest==9820]

SelectedDest <- CountofDest[CountofDest > 6000]
SelectedDest

addmargins(SelectedDest,margin=1) 

barplot(SelectedDest)


