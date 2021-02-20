# Data Science Specialization
# 4-Exploratory Data Analysis
# Week 1 - Course Project
# Plot 4

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

# Print the Plot 4
png("plot4.png", width = 480, height = 480)

# Set the distribution of the four pictures
par(mfrow = c(2,2))

with(power, {
  # Picture 1
  plot(dateTime, Global_active_power,
       type = "l",
       lty = 1,
       xlab = NA,
       ylab="Global Active Power (Kilowatts)")
  # Picture 2
  plot(dateTime, Voltage,
       type = "l", 
       lty = 1,
       xlab = "datetime",
       ylab= "Voltage")
  # Picture 3
  plot(dateTime, Sub_metering_1 ,
       type = "l",
       lty = 1,
       col = "black",
       xlab = NA,
       ylab = "Energy sub metering")
  lines(dateTime, Sub_metering_2,
        type = "l",
        lty = 1,
        col = "red")    
  lines(dateTime, Sub_metering_3,
        type = "l",
        lty = 1,
        col = "blue")    
  legend("topright",
         pch = 95,
         col = c("black", "red", "blue" ),
         bty = "n",
         legend = c("Sub_metering_1",
                    "Sub_metering_2",
                    "Sub_metering_3")
  )
  # Picture 4
  plot(dateTime, Global_active_power,
       type = "l", 
       lty = 1,
       xlab = "datetime",
       ylab = "Global_reactive_power")
})

dev.off()  
