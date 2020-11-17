install.packages("rJava")
install.packages("memoise")
install.packages("multilinguer")
install.packages(c('stringr','hash','tau','Sejong','RSQLite','devtools'), type = "binary")
install.packages("remotes")
install.packages("dplyr")
remotes::install_github('haven-jeon/KoNLP', upgrade = "never", InSTALL_opts=c("--no-multiarch"), force = TRUE)

library(multilinguer)
library(KoNLP)
library(stringr)
library(dplyr)

Sys.setenv(JAVA_HOME='C:/Java/jdk1.8.0_261')
buildDictionary(ext_dic = "woorimalsam")
useNIADic()

txt <- readLines("hiphop.txt")
head(txt)
txt <- str_replace_all(txt, "\\W", " ")
txt

extractNoun("대한민국의 영토는 한반도와 그 부속도서로 한다.")
nouns <- extractNoun(txt)
wordcount <- table(unlist(nouns))

df_word <- as.data.frame(wordcount, stringsAsFactors = F)
df_word <- rename(df_word,word=Var1,freq=Freq) 
df_word <- filter(df_word, nchar(word) >= 2)


top_20 <- df_word %>%
          arrange(desc(freq)) %>%
          head(20)
top_20

install.packages("wordcloud")
library(wordcloud)
library(RColorBrewer)

pal <- brewer.pal(8, "Dark2")
set.seed(1234)
wordcloud(word = df_word$word,
          freq = df_word$freq,
          min.freq = 2,
          max.words = 200,
          random.order = F,
          rot.per = .1,
          scale = c(4, 0.3),
          colors = pal)

pal <- brewer.pal(9, "Blues") [5:9]
set.seed(1234)
wordcloud(words = df_word$word,
          freq = df_word$freq,
          min.freq = 2,
          max.words = 200,
          random.order = F,
          rot.per = .1,
          scale = c(4, 0.3),
          colors = pal)
