##### 누비자 2015 ~ 2016 월별 csv 모두 bind_rows 하는 script ####


library(readxl)
library(dplyr)

nubija_csv <- read.csv("창원시 무인대여공영자전거 누비자 대여반납이력_2015-01.csv")
head(nubija_csv) # 한글 인코딩 ok 

months <- c(sprintf("%02d", 2:12)) # 01, 02 ... 이런 식으로 format하여 만들고 싶으면 sprintf를 사용하면 된다. 
months

## 2015년 
for (i in months) {
  temp <- read.csv(paste0("창원시 무인대여공영자전거 누비자 대여반납이력_2015-", i, ".csv"))
  print(paste("2015-", i, " observations +", nrow(temp), " , total: ", nrow(nubija_csv)))
  nubija_csv <- bind_rows(nubija_csv, temp)
}

nubija_csv

dim(nubija_csv)
str(nubija_csv)
summary(nubija_csv)

# 2016년도 column 같은지 확인용
test <- read.csv("창원시+무인대여공영자전거+누비자+대여반납이력_2016-01.csv")
head(test)
str(test)

## 2016년 
for (i in c("01", months)) {
  temp <- read.csv(paste0("창원시+무인대여공영자전거+누비자+대여반납이력_2016-", i, ".csv"))
  print(paste("2016-", i, " observations +", nrow(temp), " , total: ", nrow(nubija_csv)))
  nubija_csv <- bind_rows(nubija_csv, temp)
}

str(nubija_csv)

write.csv(nubija_csv, file="nubija_15-16.csv")

df <- read.csv("nubija_15-16.csv")
head(df)
