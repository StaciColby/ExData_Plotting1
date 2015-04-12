
house<-read.table("~/Math378/household_power_consumption.txt", sep=";", quote="\"",header=T,na.strings="?",nrows=80000)

house$New_Date<-as.Date(house[,1],"%d/%m/%Y")
Subset1<-which(house$New_Date=="2007-02-01")
Subset2<-which(house$New_Date=="2007-02-02")
newdata<-house[c(Subset1,Subset2),]

#second graph
png(file="plot2.png")
Datetime<-paste(newdata$Date,newdata$Time)
newdata$Datetime<-strptime(Datetime, "%d/%m/%Y %H:%M:%S")
newdata$Datetime[1:10]
#plot(Datetime,newdata$Global_active_power,type="l")
with(newdata,plot(Datetime,Global_active_power,type="l",ylab="Global Active Power (kilowatts)"),xlab="")
dev.off()
