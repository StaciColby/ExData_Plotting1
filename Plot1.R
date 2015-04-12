#read in data
house<-read.table("~/Math378/household_power_consumption.txt", sep=";", quote="\"",header=T,na.strings="?",nrows=80000)

#convert the data to desired format and select dates of interest
house$New_Date<-as.Date(house[,1],"%d/%m/%Y")
Subset1<-which(house$New_Date=="2007-02-01")
Subset2<-which(house$New_Date=="2007-02-02")
newdata<-house[c(Subset1,Subset2),]

#create the first graph
png(file="plot1.png")
with(newdata,hist(Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red"))
dev.off()
