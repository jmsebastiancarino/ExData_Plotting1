##To load the dataset
md <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

##To convert the Date and Time variables to Date/Time classes
library(lubridate)
md$Date <- dmy(md$Date)
md$Date <- ymd(md$Date)
md$Time <- strptime(md$Time, format="%H:%M:%S")


##To extract only data from dates 2007-02-01 and 2007-02-02
data1 <- md[ which(md$Date == "2007-02-01"), ]
data2 <- md[ which(md$Date == "2007-02-02"), ]
data3 <- rbind(data1, data2)

##To create xyplot of Energy Submetering
data3$Global_active_power <- as.numeric(data3$Global_active_power)
data3$Time <- as.POSIXct(data3$Time)
data3$Sub_metering_1 <- as.numeric(data3$Sub_metering_1)
data3$Sub_metering_2 <- as.numeric(data3$Sub_metering_2)
data3$Sub_metering_3 <- as.numeric(data3$Sub_metering_3)
library(lattice)
dev.cur()
png(file="plot3.png", height=480, width=480)
xyplot(Sub_metering_1 + Sub_metering_2 + Sub_metering_3 ~ Time, 
	data=data3, 
	type="S", 
	ylab="Energy Submetering", 
	col=c("black", "red", "blue"))
legend("topright", pch=1, 
	col=c("black", "red", "blue"), 
	legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))) 
	
dev.off()


