#####IOT Dataset
##### By: Mohammed Eltahir
##### 31-Jan-2022

IOT<-read.csv("C:\\Users\\DELL\\Downloads\\Data Sciense\\R\\Project 2\\Iot security dataset.csv")
dim(IOT)
str(IOT)
colnames(IOT)

####df dataset
df<-IOT[,c("Label","ts","te","td","sa","da","sp","dp","pr","ipkt","ibyt","opkt","obyt")]
head(df)
dim(df)

tail(df)
library(dplyr)
library(plyr)
library(doBy)
library(MASS) 
library(ggplot2)
colSums(in.na(df))

summary(df)
table(df$Label)

df$ts<-as.POSIXct(df$ts,format="%Y-%m-%d %H:%M:%S")
df$te<-as.POSIXct(df$te,format="%Y-%m-%d %H:%M:%S")
str(df)

#Univariate alanysis for Label variable
count<-table(df$Label)
count
freq1 <- c(count[1], count[2])
lbls <- c("Normal", "Attack")
pct <- round(freq1/sum(freq1)*100)
lbls <- paste(lbls, pct) # add percents to labels and by default separate them by space
lbls <- paste(lbls,"%",sep="") # ad % to labels
pie(freq1,labels = lbls, col=rainbow(length(lbls)),
    main="Pie Chart of Attack/Normal Traffic captured")

table(df$pr)
#Univariate alanysis for Label variable
count<-table(df$pr)[-2]
count
freq1 <- c(count[1], count[2],count[3],count[4])
lbls <- c("ICMP", "IGMP","TCP","UDP")
pct <- round(freq1/sum(freq1)*100)
lbls <- paste(lbls, pct) # add percents to labels and by default separate them by space
lbls <- paste(lbls,"%",sep="") # ad % to labels
pie(freq1,labels = lbls, col=rainbow(length(lbls)),
    main="Pie Chart of Attack/Normal Traffic captured")

#########Pie chart for 3 main Traffic==========
table(df$pr)[-2]
count<-table(df$pr)[-2]
count
freq1 <- c(count[1], count[2],count[3])
lbls <- c("ICMP","TCP","UDP")
pct <- round(freq1/sum(freq1)*100)
lbls <- paste(lbls, pct) # add percents to labels and by default separate them by space
lbls <- paste(lbls,"%",sep="") # ad % to labels
pie(freq1,labels = lbls, col=rainbow(length(lbls)),
    main="Pie Chart of Attack/Normal Traffic captured")

df
#######Bivariate analysis
tbl<-table(df$Label,df$pr)
tbl

barplot(c(tbl[1], tbl[2],tbl[3],tbl[4]), main="Traffic Type",
        ylab="Number",xlab="names",col = 'blue',horiz = FALSE)

ggplot(df, aes(fill=tbl[1],tbl[1],tbl[2],tbl[4]),y=rownames(), x=names)) + 
  geom_bar(position="dodge", stat="identity")





### group bar char for Protocal against Legend 
barplot(tbl, main="Protocal  Type",
        xlab="Traffic Type", col=c("Green","RED"),
        legend = rownames(tbl), beside=TRUE)

length(table(df$da))
length(table(df$dp))
length(table(df$sa))
length(table(df$sp))
length(table(df$pr))



nrow(df)
sum(duplicated(df$da))
top<-c(head(names(sort(table(df$da),decreasing = TRUE)), 10))
top
nrow(subset(df,da=="192.168.1.109"))
nrow(subset(df,da=="192.168.1.100"))
nrow(subset(df,da=="224.0.0.251"))
nrow(subset(df,da=="189.160.51.207"))
nrow(subset(df,da=="200.244.197.25"))
nrow(subset(df,da=="254.18.105.79"))
nrow(subset(df,da=="52.101.150.38"))
nrow(subset(df,da=="41.199.13.87"))
nrow(subset(df,da=="19134175189"))
nrow(subset(df,da=="19134175189"))
nrow(subset(df,da=="73.15.118.117"))



IP1
length(top)
cnt=c(length(top[1],length(top[2])
class(cnt)

### TOP Destination port 
top.dp<-c(head(names(sort(table(df$dp),decreasing = TRUE)), 10))
top.dp
nrow(subset(df,dp=="23"))
nrow(subset(df,dp=="81"))
nrow(subset(df,dp=="769"))
nrow(subset(df,dp=="39552"))
nrow(subset(df,dp=="781"))
nrow(subset(df,dp=="771"))
nrow(subset(df,dp=="6881"))
nrow(subset(df,dp=="768"))
nrow(subset(df,dp=="443"))



nrow(df)

top.dp.val=nrow(subset(df,dp=="2816"))

subset(df,dp=="2816")

top.dp.val

tbl2<-table(df$Label,df$da)


head(tbl2)

ggplot(df, aes(x=rownames, fill=rownames, color=names) +
  geom_histogram(position="identity", alpha=0.5))


########


plot_grid(plotlist = my_plots)
#df$ts<-as.Date(df$ts,format("%Y-%m-%d %H:%M:%S"))
#df$te<-as.Date(df$te,format("%Y-%m-%d %H:%M:%S"))

#df$ts<-as.POSIXct(df$ts,format="%Y-%m-%d %H:%M:%S")
#df$te<-as.POSIXct(df$te,format="%Y-%m-%d %H:%M:%S")
#str(df)

####

duplicated(df$sp)
library("sqldf")
dd<-sqldf("select sa,count(sa) Total from df group by sa order by Total desc limit 10 ")
df33<-sqldf("select sp,count(sp) Total from df group by sp order by Total desc limit 10 ")
df33$sp<-as.character(df33$sp)
ggplot(data=df33, aes(x=sp, y=Total)) +
  geom_bar(stat="identity", fill="steelblue",width=.5)


nrow(sqldf("select distinct sa from df"))
nrow(sqldf("select distinct da from df"))
nrow(sqldf("select distinct dp from df"))
nrow(sqldf("select distinct sp from df"))

dd

t.test(ibyt ~ Label,data = df)

#########count dp for Normal Traffic
head(df)
df4<-sqldf("select dp,count(dp) Total from df where Label = 0 
     group by dp order by Total desc limit 10 ")

#########count dp for Normal Traffic
df7<-sqldf("select dp,count(dp) Total from df where Label = 1 
     group by dp order by Total desc limit 10 ")
df7
ggplot(data=df7, aes(x=dp, y=Total)) +
  geom_bar(stat="identity", fill="steelblue",width=.5)

count<-df7
count
other<-nrow(df)-count[1,2]-count[2,2]
other
nrow(df)-count[1,2]
freq1 <- c(count[1,2], count[2,2],other)
freq1
lbls <- c("Telnet(23)","http(81)","Other")
pct <- round(freq1/359000*100)
lbls <- paste(lbls, pct) # add percents to labels and by default separate them by space
lbls <- paste(lbls,"%",sep="") # ad % to labels
pie(freq1,labels = lbls, col=rainbow(length(lbls)),
    main="Total count per Dst Port Attack Traffic captured")


#####



###
df5<-sqldf("select dp,sum(ibyt) Total from df where Label = 1 
     group by dp order by Total desc limit 10 ")
df5$dp<-as.character(df5$dp)
df5
sum(df$ibyt)
ggplot(data=df5, aes(x=dp, y=Total)) +
  geom_bar(stat="identity", fill="steelblue",width=.5)


qplot(pr, ibyt, data = df, 
      geom="boxplot", fill = pr)

ggplot(df, aes(x=ibyt, fill=pr, color=pr) +
  geom_histogram(position="identity", alpha=0.5)


###############
df3<-sqldf("select sp,sum(ibyt) Total from df where Label = 1 
     group by sp order by Total desc limit 10 ")
#plot me
df3
str(df3)
df3$sp<-as.character(df3$sp)

ggplot(data=df3, aes(x=sp, y=Total)) +
  geom_bar(stat="identity", fill="steelblue",width=.5)

ggplot(data=df3, aes(x=sp, y=Total)) +
  geom_bar(stat="identity", fill="steelblue")+
  geom_text(aes(label=sp), vjust=-0.3, size=3.5)+
  theme_minimal()


####################


df4$dp<-as.character(df4$dp)
str(df4)
ggplot(data=df4, aes(x=dp, y=Total)) +
  geom_bar(stat="identity", fill="steelblue",width=.5)


ggplot(data=df3, aes(x=sp, y=Total)) +
  geom_bar(stat="identity", fill="steelblue",width=.5)

ggplot(data=df3, aes(x=sp, y=Total)) +
  geom_bar(stat="identity", fill="steelblue")+
  geom_text(aes(label=sp), vjust=-0.3, size=3.5)+
  theme_minimal()


  
sqldf("select dp,sum(obyt) Total from df where Label = 1 
     group by dp order by Total desc limit 10 ")

table(df$Label,dd$sa)

str(df)
q
df1<-subset(df,Label==1)
head(df1)
nrow(df1)

summaryBy(Label ~ td,df, FUN= c(min,max,mean,length))

str(df)
df$sp<-as.character(df$sp)
df$dp<-as.character(df$dp)


sqldf("select sp,sum(obyt) Total from df where Label = 1 
     group by dp order by Total desc limit 10 ")


ggcorr(df)

ggcorr(df,
       label = TRUE,
       label_alpha = TRUE)

x<-list(A = "his name is", B = "John", C = 88.5 , D = 18 , E = TRUE , F = c(55,24,"TRUE", FALSE))
str(x)

class(x$F)
class(x$D)
x$D<-as.integer(x$D)
paste(x[["A"]],x[["B"]])


isTRUE(1)

if (isTRUE(1)) {

  is.numeric(1)
} else {
    is.logical(1)
}

v=c(12,1,0,8,11,5,6,2,9.0,1,7)

a <- matrix(c(12,1,0,8,11,5,6,2,9,0,1,7), nrow = 3, ncol = 4)
a
R1<-c(rep(100,7))
R1
R2<-c(55,87,0)
R2

b<-matrix(c(seq(1:9)), nrow = 3, ncol = 3)
b

L<-list(c(TRUE,0,15),"Frank",matrix(seq(1:9)**2,-5,nrow=1,ncol=3),rep(1,5))
L          

mark=c(89,90,45,78,99,63,55)
mark        
new.v=mark[mark>73 & mark<89]
new.v
length(mark[mark<75])

getwd()
reader<-read.csv("C:\\Users\\DELL\\Downloads\\Data Sciense\\R\\coffee_info.csv")
head(reader,30)
tail(reader)
colnames(reader$Gender)<-"sex"

sqldf("select * from reader where Education = 'bachelors'")
sqldf("update reader set Income = Income*1.1 where Education = 'bachelors'")
dbExecute("update reader set Income = Income*1.1 where Education = 'bachelors'")

reader$Income[reader$Education=="bachelors" , na.rm = T]<-reader$Income*1.1
reader[(]which(reader$Education=="bachelors")]["Income"]<-reader$Income*1.1

inc<-subset(reader$Education=="bachelors")
inc$Income<-as.numeric(inc$Income)*1.1
head(inc)

newdf<-data.frame(reader$cup_tea,reader$Age,reader$Married)
newdf
matrixcsv<-data.matrix(newdf)
matrixcsv

df2<-na.omit(reader)
cor(df2$Income,df2$spend_food)
cor(df2$Income,df2$coffee)

cor(df2$coffee,df2$spend_food)
  
