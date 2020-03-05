
library(tidyverse)
# read the csv file
test<- read.csv("register.csv")
# check the data
head(test)
tail(test)
# calculate the mean of age
age<-test$AGE
mean(age)
# filter to Xinhui County
Xinhui<- subset(test, NEW_COUNTY=="Xinhui")
Xinhui
# exclude all the cases with age=0 or age missing 
Xinhui1<- subset(Xinhui, AGE>0)
#check AGE
Xinhui1$AGE
#check HEIGHT.REVISED
Xinhui1$HEIGHT.REVISED
#check the type of Xinhui1$HEIGHT.REVISED
typeof(Xinhui1$HEIGHT.REVISED)
#try to calcuate the mean but got wrong message
mean(Xinhui1$HEIGHT.REVISED)
#convert Height.revised from factor to numeric
Xinhui1$HEIGHT.REVISED<- as.numeric(as.character(Xinhui1$HEIGHT.REVISED))
str(Xinhui1)
Xinhui1$HEIGHT.REVISED
#get rid of cases with this variable equals 0
Xinhui1<- filter(Xinhui1, HEIGHT.REVISED>0)
#compute a new variable to convert inches into centimeter for HEIGHT.REVISED
Xinhui1<- mutate(Xinhui1, HEIGHT.CM=HEIGHT.REVISED*2.54)
Xinhui1$HEIGHT.CM
#compute a new variable called Birthyear
Xinhui1<- mutate(Xinhui1, Birthyear= REG_Year - AGE)
str(Xinhui1)
# recode the values of Birthyear to levels
Xinhui1$Birthyear_cohort[Xinhui1$Birthyear>=1860 & Xinhui1$Birthyear<=1869] <- "1860-1869"
Xinhui1$Birthyear_cohort[Xinhui1$Birthyear>=1870 & Xinhui1$Birthyear<=1879] <- "1870-1879"
Xinhui1$Birthyear_cohort[Xinhui1$Birthyear>=1880 & Xinhui1$Birthyear<=1889] <- "1880-1889"
Xinhui1$Birthyear_cohort[Xinhui1$Birthyear>=1890 & Xinhui1$Birthyear<=1899] <- "1890-1899"
Xinhui1$Birthyear_cohort[Xinhui1$Birthyear>=1900 & Xinhui1$Birthyear<=1909] <- "1900-1909"
Xinhui1$Birthyear_cohort[Xinhui1$Birthyear>=1910 & Xinhui1$Birthyear<=1919] <- "1910-1919"
Xinhui1$Birthyear_cohort[Xinhui1$Birthyear>=1920 & Xinhui1$Birthyear<=1929] <- "1920-1929"
Xinhui1$Birthyear_cohort[Xinhui1$Birthyear>=1930 & Xinhui1$Birthyear<=1939] <- "1930-1939"
#convert the column to a factor
Xinhui1$Birthyear_cohort<- factor(Xinhui1$Birthyear_cohort)
Xinhui1$Birthyear_cohort
#get the frequency of Birthyear_cohort
count(Xinhui1, 'Birthyear_cohort')
#drop the levels with too few cases and NA
Xinhui1<- subset(Xinhui1, Birthyear_cohort != "1920-1929")
Xinhui1<- subset(Xinhui1, Birthyear_cohort != "1930-1939")
Xinhui1<- subset(Xinhui1, Birthyear_cohort != "NA")
#check the frequency of Birthyear_cohort
count(Xinhui1, 'Birthyear_cohort')
#plot age and mean height grouped by birthyear_cohort
ggplot(data=Xinhui1, aes(x=AGE, y=HEIGHT.CM, group=Birthyear_cohort, color=Birthyear_cohort))+
     ylim(125, 175)+xlim(10, 27)+
     stat_summary(fun.y="mean", geom="line")

