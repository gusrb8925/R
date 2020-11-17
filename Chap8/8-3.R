install.packages("wordcloud2")

library(KoNLP)
library(wordcloud2)

useSystemDic()
useSejongDic()
useNIADic()

word_data <- readLines("애국가(가사).txt")
word_data

word_data2 <- sapply(word_data, extractNoun, USE.NAMES = F)
word_data2

add_words <- c("백두산","남산","철갑","가을","하늘","달")
buildDictionary(user_dic = data.frame(add_words,rep("ncn",length(add_words))),replace_usr_dic = T)

word_data2 <- sapply(word_data,extractNoun, USE.NAMES = F)
word_data2

undata <- unlist(word_data2)
undata

word_table <- table(undata)
word_table

undata2 <- Filter(function(x){nchar(x)>=2},undata)
word_table2 <- table(undata2)
word_table2

sort(word_table2,decreasing = T)

wordcloud2(word_table2)
wordcloud2(word_table2, color = "random-light", backgroundColor = "black")
wordcloud2(word_table2, fontFamily = "맑은 고딕", size=1.2, color = "random-light", backgroundColor="black",shape="star")
