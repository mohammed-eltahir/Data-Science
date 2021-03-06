#
# R project
#
library(mailR)
library(doBy)
library(MASS) 
library(ggplot2)
library(plyr)
IoT<-read.csv("C:\\Users\\DELL\\Downloads\\Data Sciense\\R\\IOT-temp.csv")
IoT
dim(IoT)

head(IoT)
tail(IoT)
str(IoT)
colnames(IoT)
colSums(is.na(IoT))
summary(IoT)
IoT$noted_date <- as.Date(IoT$noted_date,format = "%d-%m-%Y")
IoT$year<-floor_date(IoT$noted_date,"year")
IoT$month<-floor_date(IoT$noted_date,"month")
IoT.out<-subset(IoT,IoT$out.in=="Out")
IoT.in<-subset(IoT,IoT$out.in=="In")

head(IoT.in)
head(IoT.out)
head(IoT)
dim(IoT.out)

aggregate(IoT$temp, by=list(IoT$noted_date),mean)
summaryBy(temp ~ out.in+noted_date,IoT, FUN= c(min,max,mean,length))
summaryBy(temp ~ noted_date+out.in,IoT, FUN= c(mean,length))
summaryBy(temp ~ month+out.in,IoT, FUN= c(mean,length))
table(IoT$out.in)

#Univariate alanysis for in/out temp
count<-table(IoT$out.in)
count
freq1 <- c(count[1], count[2])
lbls <- c("IN Temp", "OUT Temp")
pct <- round(freq1/sum(freq1)*100)
lbls <- paste(lbls, pct) # add percents to labels and by default separate them by space
lbls <- paste(lbls,"%",sep="") # ad % to labels
pie(freq1,labels = lbls, col=rainbow(length(lbls)),
    main="Pie Chart of IN/OUT Temp")


barplot(c(count[1], count[2]), main="IN/OUT Temperature",
        ylab="Number",col = 'blue',horiz = FALSE)

barplot(c(mean[1], mean[2]), main="IN/OUT Temperature",
        ylab="Number",col = 'blue',horiz = FALSE)

IoT$month <- floor_date(IoT$noted_date, "month")
head(IoT)
IoT


#Weekly Tempature average
#bivariage analysis noted_date vs temp
library(dplyr)
library(lubridate)
IoT.out$month <- floor_date(IoT.out$noted_date,"month")
IoT$month<- as.numeric(format(IoT$noted_date,"%m"))


head(IoT.out)
IoT.out<-IoT.out[-6]
#find mean sales by week
IoT %>%
  group_by(week) %>%
  summarize(mean = mean(temp))

IoT %>%
  group_by(week) %>%
  summarize(Freq = length(temp))

IoT %>%
  group_by(week) %>%
  summarize(mean = mean(temp))

IoT
table(IoT$noted_date, IoT$out.in)
table(IoT$week,IoT$temp)
table(IoT$week,IoT$out.in)


ggplot(IoT, aes(fill=out.in, temp, x=month)) + 
  geom_bar(position="dodge", stat="identity")


tbl<-table(IoT$noted_date, IoT$temp)
chisq.test(tbl)
addmargins(table(IoT$noted_date, IoT$out.in))
prop.table(table(IoT$noted_date, IoT$out.in))
xtabs(~noted_date+out.in ,data=IoT)
addmargins(xtabs(~noted_date+out.in ,data=IoT))
tbl <- table(IoT$noted_date,IoT$out.in)
tbl
chisq.test(tbl)
cor(IoT$noted_date.Length,IoT$out.in.Length,method = "spearman")
ggplot(month , out.in, data = IoT,
       geom="boxplot")
pairs.panels(IoT, scale=TRUE)
hist(IoT$noted_date, breaks = 4)

qplot(out.in, temp, data = IoT, 
      geom="boxplot", fill = out.in)

##Ploting Histogram for temp vs out/in
p<-ggplot(IoT, aes(x=temp, fill=out.in, color=out.in)) +
  geom_histogram(position="identity", alpha=0.5)
p

##
##Ploting Histogram for weekly count of data_collection vs for both out/in
##
q<-ggplot(IoT, aes(x=week, fill=mean(out.in), color=out.in)) +
  geom_histogram(position="identity", alpha=0.5)
q

h<-ggplot(IoT, aes(x=week, y=temp, color=out.in)) +
  geom_histogram(position="identity", alpha=0.5)
h
sendemail<-function(sender,recepient)
{
  
  send.mail(from = sender,
            to = recepient,
            subject = "Test Using R Scrpt",
            body = "Test emails Using R Script",
            smtp = list(host.name = "exmail.emirates.net.ae", port = 465,
                        user.name = "myemail@eim.ae",
                        passwd = "xxxx", ssl = TRUE),
            authenticate = TRUE,
            send = TRUE
            #attach.files = "C:\\Users\\DELL\\Downloads\\Data Sciense\\R\\Day 1- Revised on Jan10th.pdf"
            )
}

sendemail("my_email@eim.ae","dst_email@gmail.com")
