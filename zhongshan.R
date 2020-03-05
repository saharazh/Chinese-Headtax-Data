setwd("/Users/master/Documents/Chinese registry-R/rawdata_heightconverted")
library(tidyverse)
library('dplyr')
getwd()
# read the csv file
test<- read.csv("register.csv")
# filter to Zhongshan County
Zhongshan<- subset(test, NEW_COUNTY=="Zhongshan")
#check DEST_CODE
Zhongshan$DEST_CODE
#Get frequency of DEST_CODE
count(Zhongshan, "DEST_CODE")
#Check the type of DEST_CODE
typeof("DEST_CODE")
#Get the frequency of NEW_DEST
count(Zhongshan, "NEW_DEST")
#check the type of NEW_DEST
typeof("NEW_DEST")
#exclude cases with DEST_CODE equals 0
Zhongshan1<- subset(Zhongshan, DEST_CODE>0)
#exclude cases with MatchCH_ID equals 0
Zhongshan1<- subset(Zhongshan1, MatchCH_ID>0)
#check DEST_CODE
count(Zhongshan1, "DEST_CODE")
#convert DEST_CODE to factor
Zhongshan1$DEST_CODE<- as.factor(Zhongshan1$DEST_CODE)
#convert MatchCH_ID to factor
Zhongshan1$MatchCH_ID<- as.factor(as.character(Zhongshan1$MatchCH_ID))
# aggregate number of cases by MatchCH_ID
Aggregate1<- Zhongshan1 %>%
  group_by(MatchCH_ID) %>%
  summarize(n())
# aggregate the combination of MatchCH_ID and DEST_CODE
Aggregate.temp<- Zhongshan1 %>%
  group_by(MatchCH_ID, DEST_CODE) %>%
  summarize(n())
# aggregate the number of unique values of DEST_CODE by MatchCH_ID
Aggregate2<- Aggregate.temp %>%
  group_by(MatchCH_ID) %>%
  summarize(n())
# merge two aggregated dataframes
Zhongshan.aggregated<- merge(Aggregate1, Aggregate2, by="MatchCH_ID")
#rename the columns 
Zhongshan.aggregated$HEADCOUNT<- Zhongshan.aggregated$`n().x`
Zhongshan.aggregated$DESTCOUNT<- Zhongshan.aggregated$`n().y`
#produce scatter plot 
ggplot(Zhongshan.aggregated, aes(x=HEADCOUNT, y=DESTCOUNT))+
  geom_point()





