
#read in data
house<-read.table("~/Math378/household_power_consumption.txt", sep=";", quote="\"",header=T,na.strings="?",nrows=80000)

#convert the data to desired format and select dates of interest
house$New_Date<-as.Date(house[,1],"%d/%m/%Y")
Subset1<-which(house$New_Date=="2007-02-01")
Subset2<-which(house$New_Date=="2007-02-02")
newdata<-house[c(Subset1,Subset2),]

#create the fourth graph
png(file="plot4.png")
par(mfrow=c(2,2))
Datetime<-paste(newdata$Date,newdata$Time)
newdata$Datetime<-strptime(Datetime, "%d/%m/%Y %H:%M:%S")
with(newdata,plot(Datetime,Global_active_power,type="l",ylab="Global Active Power (kilowatts)"),xlab="")
with(newdata,plot(Datetime,Voltage,type="l",ylab="Voltage"),xlab="")
with(newdata,plot(Datetime, Sub_metering_1,col="brown",type="l"))
lines(newdata$Datetime,newdata$Sub_metering_2,col="orange",type="l")
lines(newdata$Datetime,newdata$Sub_metering_3,col="blue",type="l")
legend('topright', c("Sub Metering 1","Sub Metering 2", "Sub Metering 3"), cex=0.6, col=c("brown","orange","blue"), lty=1:3)
with(newdata,plot(Datetime,Global_reactive_power,type="l",ylab="Global Reactive Power"),xlab="")
dev.off()
