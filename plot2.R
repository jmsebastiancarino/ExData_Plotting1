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

##To create a plot of Global Active Power according to day
data3$Global_active_power <- as.numeric(data3$Global_active_power)
dev.cur()
png(file="plot2.png", height=480, width=480)
plot(Global_active_power ~ datetime, data=data3, type="l", lwd=2, xlab="", ylab="Global Active Power (kilowatts)", col="black")
dev.off()
