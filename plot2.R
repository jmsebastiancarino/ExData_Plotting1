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

##To create xyplot of Global Active Power according to day
data3$Global_active_power <- as.numeric(data3$Global_active_power)
data3$Time <- as.POSIXct(data3$Time)
png(file="plot2.png", height=480, width=480)
xyplot(Global_active_power ~ Time, data=data3, type="l")