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
subdata$Global_reactive_power <- as.numeric(subSetData$Global_reactive_power)
subdata$Sub_metering_1 <- as.numeric(subSetData$Sub_metering_1)
subdata$Sub_metering_2 <- as.numeric(subSetData$Sub_metering_2)
subdata$Sub_metering_3 <- as.numeric(subSetData$Sub_metering_3)
subdata$Voltage <- as.numeric(subSetData$Voltage)

#call PNG Graphic engine
png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2, 2))

#Plot
## PLOT 1 ##
plot(dateandtime, subdata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

## PLOT 2 ##
plot(dateandtime, subdata$Voltage, type="l", xlab="datetime", ylab="Voltage")

## PLOT 3 ##
plot(dateandtime, subdata$Sub_metering_1, type="l", xlab="", ylab="Energy Sub metering")
lines(dateandtime, subdata$Sub_metering_2, type="l", col="red")
lines(dateandtime, subdata$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=3, col=c("black", "red", "blue"))

## PLOT 4 ##
plot(dateandtime, subdata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
