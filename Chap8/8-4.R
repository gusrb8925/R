install.packages("readxl")
library(readxl)

ck <- read_xlsx("치킨집_가공.xlsx")
head(ck)

addr <- substr(ck$소재지전체주소,11,16)
head(addr)

addr_num <- gsub("[0-9]","",addr)
addr_trim <- gsub(" ","",addr_num)
head(addr_trim)

install.packages("dplyr")
library(dplyr)

addr_count <- addr_trim %>% table() %>% data.frame()
head(addr_count)

install.packages("treemap")
library(treemap)

treemap(addr_count,index=".",vSize="Freq",title="서대문구 도별 치킨집 분포포")
arrange(addr_count,desc(Freq)) %>% head(17)
