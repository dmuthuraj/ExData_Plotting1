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
subdata$Sub_metering_1 <- as.numeric(subSetData$Sub_metering_1)
subdata$Sub_metering_2 <- as.numeric(subSetData$Sub_metering_2)
subdata$Sub_metering_3 <- as.numeric(subSetData$Sub_metering_3)

#call PNG Graphic engine
png(filename = "plot3.png", width = 480, height = 480, units = "px")

#Plot
## PLOT 3 ##
plot(dateandtime, subdata$Sub_metering_1, type="l", xlab="", ylab="Energy Sub metering")
lines(dateandtime, subdata$Sub_metering_2, type="l", col="red")
lines(dateandtime, subdata$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))

dev.off()
