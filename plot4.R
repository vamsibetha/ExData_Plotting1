## This script creates the fourth plot

### Reading the required data from the file
datad <- read.table("household_power_consumption.txt", sep = ";", col.names = as.vector(unname(unlist(read.table("household_power_consumption.txt", sep = ";", na.strings = "?", nrows = 1)[1,]))), na.strings = "?", nrows = 2880, skip= 66637)

### Creating the png graphics device
png(filename= "plot4.png")

### Creating the date-time variable
Tempa <- paste(datad$Date, datad$Time)
Tempa <- gsub("2007","07", Tempa)
Tempa <- strptime(Tempa, "%d/%m/%y %H:%M:%S")
par(mfrow = c(2,2))

### Drawing the first graph with the required parameters
plot(Tempa, datad$Global_active_power, type = "n", ylab = "Global Active Power", xlab= NA)
lines(Tempa, datad$Global_active_power)

### Drawing the second graph with the required parameters
plot(Tempa, datad$Voltage, type = "n", ylab = "Voltage", xlab= "datetime")
lines(Tempa, datad$Voltage)

### Drawing the third graph with the required parameters
plot(Tempa, datad$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab= NA)
lines(Tempa, datad$Sub_metering_1)
lines(Tempa, datad$Sub_metering_2,col="red")
lines(Tempa, datad$Sub_metering_3,col="blue")
legend( "topright", lty=c(1,1), col= c("black", "red", "blue"), legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = "n")

### Drawing the fourth graph with the required parameters
plot(Tempa, datad$Global_reactive_power, type = "n", ylab = "Global_reactive_power", xlab= "datetime")
lines(Tempa, datad$Global_reactive_power)

### Cleaning up
dev.off()
rm(list=ls())