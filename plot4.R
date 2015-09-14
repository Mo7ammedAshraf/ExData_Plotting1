setwd("f:/Coursera/Exploratory Data Analysis/Week1/Project")
# Source data URL
url <- "https://d396qusza40orc.cloudfront.net/"+
  "exdata%2Fdata%2Fhousehold_power_consumption.zip"
# Download the source data
download.file(url = url , 
              destfile = "./household_power_consumption.zip", 
              mode= "wb")
# Extract the source data
unzip(zipfile = "./household_power_consumption.zip" , 
      exdir ="./" )
# Load data source into a data frame
hhd <- read.csv(file = "./household_power_consumption.txt",
                sep = ";")
# get only the requested dates 1st and 2nd Feb 2007
hhds <- hhd[ as.Date(hhd$Date, "%d/%m/%Y") %in% 
               c(as.Date("1/2/2007", "%d/%m/%Y"), as.Date("2/2/2007", "%d/%m/%Y") ), ]
# Convert the Global_active_power as numeric
hhds$Global_active_power <- as.numeric(hhds$Global_active_power)
hhds$Global_reactive_power <- as.numeric(hhds$Global_reactive_power)
hhds$Sub_metering_1 = as.numeric(hhds$Sub_metering_1)
hhds$Sub_metering_2 = as.numeric(hhds$Sub_metering_2)
hhds$Sub_metering_3 = as.numeric(hhds$Sub_metering_3)
hhds$Voltage <- as.numeric(hhds$Voltage)
# Convert the date and time to new DateTime Column
hhds$datetime <- strptime(paste(hhds$Date, hhds$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Set the plot columns and rows count
par(mfrow = c(2, 2))
# Drow the plot 
plot(hhds$datetime, 
     hhds$Global_active_power, 
     type="l", 
     xlab="", 
     ylab="Global Active Power", 
     cex=0.2)

plot(hhds$datetime, 
     hhds$Voltage, 
     type="l", 
     xlab="datetime", 
     ylab="Voltage")

plot(hhds$datetime, 
     hhds$Sub_metering_1, 
     type="l", 
     ylab="Energy Submetering", 
     xlab="")

lines(hhds$datetime, 
      hhds$Sub_metering_2, 
      type="l", 
      col="red")

lines(hhds$datetime, 
      hhds$Sub_metering_3, 
      type="l", 
      col="blue")

legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=, 
       lwd=2.5, 
       col=c("black", "red", "blue"), 
       bty="o")

plot(hhds$datetime, 
     hhds$Global_reactive_power, 
     type="l", 
     xlab="datetime", 
     ylab="Global_reactive_power")
# Copy the plot to PNG file device
dev.copy(png,
         file="plot4.png",
         height=480,
         width=480)
# Close the PNG device
dev.off()