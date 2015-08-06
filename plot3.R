#set working directory
setwd("/Users/DELL 1/Documents/Module4")

#load from library data.table
library(data.table)
dt<-fread("./household_power_consumption.txt", na.strings="?")

dt$Date <- as.Date(dt$Date, format="%d/%m/%Y")

## Subsetting the data
data <- subset(dt, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(dt)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

##output line plot to PNG
png(filename="plot3.png", width=480, height=480)
with(data, {
          plot(Sub_metering_1~Datetime, type="l",
          ylab="Energy sub metering", xlab="")
          lines(Sub_metering_2 ~ Datetime,col='Red')
          lines(Sub_metering_3 ~ Datetime,col='Blue')}
)
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()