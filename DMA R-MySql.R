install.packages("RMySQL")
library(RMySQL)
#
mydb <- dbConnect(MySQL(), user = 'root', password = 'sectusempra',
                  dbname = 'student_admission_data', host = 'localhost')
#
dbListTables(mydb)
#
dbListFields(mydb, 'student_admit_university')

#
rs = dbSendQuery(mydb, "select * from STUDENT_ADMIT_UNIVERSITY")
rs2 = dbSendQuery(mydb, "select * from ACCOMODATION")

#
#dbFetch(rs)
data=fetch(rs,n=-1)
accomodation=fetch(rs2,n=-1)
#
#dbClearResult(rs)
#
#dbDisconnect(mydb)
#


#QUERIES
library(ggplot2)
library(scales)
library(dplyr)
library(ggcorrplot)
#1) Average GRE scores 
data_subset<- subset(data , data$ADMIT == 1)
temp<-data_subset%>%
  group_by(UNIVERSITYNAME) %>%
  summarize(Avg_GRE = mean.default(GRE,trim = 10))
#Bar Plot
ggplot(temp, aes(x=UNIVERSITYNAME,y=Avg_GRE))+coord_flip()+ geom_bar(stat = 'identity',fill='light blue')+geom_text(aes(label=round(Avg_GRE,digits = 0)))


#2) Relation between rent of accomodation and its distance from university
acc_temp<-accomodation%>%
  group_by(DISTANCE_FROM_UNI_MILES) %>%
  summarize(Avg_RENT = mean.default(RENT_USD,trim = 3))
#Line Plot
ggplot(acc_temp, aes(x=DISTANCE_FROM_UNI_MILES,y=Avg_RENT))+geom_line()


#3) Ratio of Admits to Rejects for Good and Moderate category LOR's
non_numeric <- data[,c(3,6)]
LOR_temp<-non_numeric%>%
  group_by(LOR)

ggplot(non_numeric, aes(x=LOR,fill=ADMIT))+ geom_bar(position = 'fill')+theme_minimal()
#Stacked Bar Plot
non_numeric$ADMIT<-as.factor(non_numeric$ADMIT)
ggplot(non_numeric, aes(x = LOR, fill = ADMIT)) + 
  geom_bar() +
  xlab("LOR") +
  ylab("Admit Ratio")+theme_bw()
  
