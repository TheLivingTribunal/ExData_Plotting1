## Code to replicate plot 2

#Reads the dataset household_power_consumption.txt from current working directory and subsets required data
dataset<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",colClasses=c(rep("character",2),rep("numeric",7)))
sub<-subset(dataset,Date %in% c("1/2/2007","2/2/2007"))
sub$DateTime<-paste(sub$Date,sub$Time)
sub$DateTime<-strptime(sub$DateTime,format="%d/%m/%Y %H:%M:%S")

#Produces required line plot as plot2.png in current working directory and does not display on screen
#To display plot on screen, run below code without png() and dev.off() functions
png('plot2.png',480,480)
plot(sub$DateTime,sub$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()