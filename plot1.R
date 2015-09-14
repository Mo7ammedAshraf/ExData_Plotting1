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
# Print the Histogram in the screen device
hist(hhds$Global_active_power, 
     col="Red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
# Copy the plot to PNG file device
dev.copy(png,
         file="plot1.png",
         height=480,
         width=480)
# Close the PNG device
dev.off()




