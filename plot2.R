#Setting working directory
setwd("C:/Users/durairam/Desktop/Coursera/Exploratory Data Analysis")

#Reading data file
masterdata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors=FALSE)

#subset of data range between 2007-02-01 and 2007-02-02
subdata <- masterdata[masterdata$Date=="2/2/2007" | masterdata$Date=="1/2/2007",]

#Strip time and date
dateandtime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Convert to numeric
subdata$Global_active_power <- as.numeric(subdata$Global_active_power)

#call PNG Graphic engine
png(filename = "plot2.png", width = 480, height = 480, units = "px")

#Plot
## PLOT 2 ##
plot(dateandtime, subdata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
