## This script creates the second plot

### Reading the required data from the file
datad <- read.table("household_power_consumption.txt", sep = ";", col.names = as.vector(unname(unlist(read.table("household_power_consumption.txt", sep = ";", na.strings = "?", nrows = 1)[1,]))), na.strings = "?", nrows = 2880, skip= 66637)

### Creating the png graphics device
png(filename= "plot2.png")

### Creating the date-time variable
Tempa <- paste(datad$Date, datad$Time)
Tempa <- gsub("2007","07", Tempa)
Tempa <- strptime(Tempa, "%d/%m/%y %H:%M:%S")

### Drawing the plot with the required parameters
plot(Tempa, datad$Global_active_power, type = "n", ylab = "Global Active Power (kilowatts)", xlab= NA)
lines(Tempa, datad$Global_active_power)

### Cleaning up
dev.off()
rm(list=ls())