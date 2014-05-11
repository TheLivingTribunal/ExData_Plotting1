## Code to replicate plot 1

#Reads the dataset household_power_consumption.txt from current working directory and subsets required data
dataset<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",colClasses=c(rep("character",2),rep("numeric",7)))
sub<-subset(dataset,Date %in% c("1/2/2007","2/2/2007"))
sub$Date<-as.Date(sub$Date,format="%d/%m/%Y")

#Produces required histogram as plot1.png in current working directory and does not display on screen
#To display plot on screen, run below code without png() and dev.off() functions
png('plot1.png',480,480)
hist(sub$Global_active_power,col="red",main="Global Active Power",ylim=c(0,1200),xlab="Global Active Power (kilowatts)")
dev.off()