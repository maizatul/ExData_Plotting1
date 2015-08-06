#set working directory

getwd()
setwd("/Users/DELL 1/Documents/Module 4 - Exploratory Data Analysis")

#set working directory
setwd("C:/Users/Kuan/Desktop/exdata/")

#load from library data.table
library(data.table)
dt<-fread("./household_power_consumption.txt", na.strings="?")

#set date as d:m:y
dt$strDate <- as.Date(dt$Date,"%d/%m/%Y")

#select data from 01/02/2007 and 02/02/2007
dt.filter<-dt[dt$strDate=="2007-02-01" | dt$strDate=="2007-02-02",]
dt.filter$Global_active_power<-as.numeric(dt.filter$Global_active_power)
rm(dt)

#output histogram to PNG
png(filename="plot1.png", width=480, height=480)
hist(dt.filter$Global_active_power, 
     col="red", 
     xlab="Global Active Power (kilowatts)", 
     main="Global Active Power")
dev.off()