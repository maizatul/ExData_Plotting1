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

#Output four graphs to png
png(filename="plot4.png", width=480, height=480)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data, {
  plot(Global_active_power ~ Datetime, type="l", 
       ylab="Global Active Power", xlab="")
  plot(Voltage ~ Datetime, type="l", 
       ylab="Voltage", xlab="datetime")
  plot(Sub_metering_1 ~ Datetime, type="l", 
       ylab="Energy Sub Meteringr", xlab="")
  lines(Sub_metering_2 ~ Datetime, col='Red')
  lines(Sub_metering_3 ~ Datetime, col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power ~ Datetime, type="l", 
       ylab="Global_reactive_power",xlab="datetime") }
  )
dev.off()