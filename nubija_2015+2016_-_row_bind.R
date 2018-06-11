##### ������ 2015 ~ 2016 ���� csv ��� bind_rows �ϴ� script ####


library(readxl)
library(dplyr)

nubija_csv <- read.csv("â���� ���δ뿩���������� ������ �뿩�ݳ��̷�_2015-01.csv")
head(nubija_csv) # �ѱ� ���ڵ� ok 

months <- c(sprintf("%02d", 2:12)) # 01, 02 ... �̷� ������ format�Ͽ� ����� ������ sprintf�� ����ϸ� �ȴ�. 
months

## 2015�� 
for (i in months) {
  temp <- read.csv(paste0("â���� ���δ뿩���������� ������ �뿩�ݳ��̷�_2015-", i, ".csv"))
  print(paste("2015-", i, " observations +", nrow(temp), " , total: ", nrow(nubija_csv)))
  nubija_csv <- bind_rows(nubija_csv, temp)
}

nubija_csv

dim(nubija_csv)
str(nubija_csv)
summary(nubija_csv)

# 2016�⵵ column ������ Ȯ�ο�
test <- read.csv("â����+���δ뿩����������+������+�뿩�ݳ��̷�_2016-01.csv")
head(test)
str(test)

## 2016�� 
for (i in c("01", months)) {
  temp <- read.csv(paste0("â����+���δ뿩����������+������+�뿩�ݳ��̷�_2016-", i, ".csv"))
  print(paste("2016-", i, " observations +", nrow(temp), " , total: ", nrow(nubija_csv)))
  nubija_csv <- bind_rows(nubija_csv, temp)
}

str(nubija_csv)

write.csv(nubija_csv, file="nubija_15-16.csv")

df <- read.csv("nubija_15-16.csv")
head(df)