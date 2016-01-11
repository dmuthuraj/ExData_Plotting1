#Setting working directory
#Please update the path before run the code
setwd("~/Desktop/Coursera/Exploratory Data Analysis")

#Reading data file
masterdata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors=FALSE)

##PLOT 1 ##
#subset of data range between 2007-02-01 and 2007-02-02
masterdata$Date <- as.Date(masterdata$Date)

subdata <- subset(masterdata, masterdata$Date == "01/02/2007" | masterdata$Date == "02/02/2007")

subdata$Global_active_power <- as.numeric(subdata$Global_active_power)

#call PNG Graphic engine
png(filename = "plot1.png", width = 480, height = 480, units = "px")

#Histogram
## PLOT 1 ##
hist(subdata$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

dev.off()
