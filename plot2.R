#set working directory
setwd("/Users/DELL 1/Documents/Module 4 - Exploratory Data Analysis")

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

#output line plot to PNG
png(filename="plot2.png", width=480, height=480)
plot(data$Global_active_power ~ data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
