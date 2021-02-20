# Data Science Specialization
# 4-Exploratory Data Analysis
# Week 1 - Course Project
# Plot 3

# Download the data (if it's necessary)
if(!file.exists("./household_power_consumption.txt")) {
  url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"  #set the URL
  download.file(url, destfile = "power.zip")                                           #download the zip file  
  unzip("power.zip")
  file.remove("power.zip")
}

# Reading the data
power_all_days<-read.table("./household_power_consumption.txt",
                           header=TRUE,
                           sep=";",
                           stringsAsFactors=FALSE,
                           na.strings="?")


# Convert the dates to Date class
power_all_days$Date <- as.Date(power_all_days$Date,
                               format = "%d/%m/%Y")

# Create a date-time column
power_all_days$dateTime <- as.POSIXct(paste(power_all_days$Date,
                                            power_all_days$Time),
                             format= "%Y-%m-%d %H:%M:%S")

# Work with the days that we need
power<-subset(power_all_days, Date == "2007-02-01"
              | Date == "2007-02-02")

# Print the Plot 3
png("plot3.png", width = 480, height = 480)
plot(power$dateTime, power$Sub_metering_1 ,
     type = "l",
     lty = 1,
     col = "black",
     xlab = NA,
     ylab = "Energy sub metering")
lines(power$dateTime,power$Sub_metering_2,
      type = "l",
      lty = 1,
      col = "red")    
lines(power$dateTime, power$Sub_metering_3,
      type = "l",
      lty = 1,
      col = "blue")    
   
legend("topright",
       pch = 95,
       col = c("black", "red", "blue" ), 
       legend = c("Sub_metering_1",
                  "Sub_metering_2",
                  "Sub_metering_3")
       )
dev.off()