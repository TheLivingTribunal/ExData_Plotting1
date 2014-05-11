## Code to replicate plot 4

#Reads the dataset household_power_consumption.txt from current working directory and subsets required data
dataset<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",colClasses=c(rep("character",2),rep("numeric",7)))
sub<-subset(dataset,Date %in% c("1/2/2007","2/2/2007"))
sub$DateTime<-paste(sub$Date,sub$Time)
sub$DateTime<-strptime(sub$DateTime,format="%d/%m/%Y %H:%M:%S")

#Produces required line plot as plot4.png in current working directory and does not display on screen
#To display plot on screen, run below code without png() and dev.off() functions
png('plot4.png',480,480)
par(mfrow=c(2,2))
plot(sub$DateTime,sub$Global_active_power,type="l",ylab="Global Active Power",xlab="")
plot(sub$DateTime,sub$Voltage,type="l",ylab="Voltage",xlab="datetime")
plot(sub$DateTime,sub$Sub_metering_1,xlab="",ylab="Energy sub metering",type="l")
lines(sub$DateTime,sub$Sub_metering_2,col="red",type="l")
lines(sub$DateTime,sub$Sub_metering_3,col="blue",type="l")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n",lty=c(1,1,1),col=c("black","red","blue"))
plot(sub$DateTime,sub$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")
dev.off()