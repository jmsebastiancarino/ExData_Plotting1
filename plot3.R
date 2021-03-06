##To load the dataset
md <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

##To convert the Date and Time variables to Date/Time classes
##To add another column, datetime
library(lubridate)
md$Date <- dmy(md$Date)
md$datetime <- paste(md$Date, md$Time)
md$datetime <- as.POSIXct(strptime(md$datetime, "%Y-%m-%d %H:%M:%S"))

##To extract only data from dates 2007-02-01 and 2007-02-02
data1 <- md[ which(md$Date == "2007-02-01"), ]
data2 <- md[ which(md$Date == "2007-02-02"), ]
data3 <- rbind(data1, data2)

#To convert the following variables into numeric classes
data3$Global_active_power <- as.numeric(data3$Global_active_power)
data3$Sub_metering_1 <- as.numeric(data3$Sub_metering_1)
data3$Sub_metering_2 <- as.numeric(data3$Sub_metering_2)
data3$Sub_metering_3 <- as.numeric(data3$Sub_metering_3)

##To create a plot of Energy Submetering
dev.cur()
png(file="plot3.png", height=480, width=480)
plot(Sub_metering_1 ~ datetime,data=data3, type="S", col="black", ylab="Energy sub metering")
points(Sub_metering_2 ~ datetime, data=data3, type="S", col="red")
points(Sub_metering_3 ~ datetime, data=data3, type="S", col="blue")
legend("topright", lty=1 ,col=c("black", "red", "blue"),legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3")) 
dev.off()




