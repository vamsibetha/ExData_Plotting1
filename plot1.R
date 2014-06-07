## This script creates the first plot

### Reading the required data from the file
datad <- read.table("household_power_consumption.txt", sep = ";", col.names = as.vector(unname(unlist(read.table("household_power_consumption.txt", sep = ";", na.strings = "?", nrows = 1)[1,]))), na.strings = "?", nrows = 2880, skip= 66637)

### Creating the png graphics device
png(filename= "plot1.png")

### Drawing the histogram with the required parameters
hist(datad$Global_active_power, col= "red",main= "Global Active Power", xlab= "Global Active Power (kilowatts)")

### Cleaning up
dev.off()
rm(list=ls())