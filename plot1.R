# Data Science Specialization
# 4-Exploratory Data Analysis
# Week 1 - Course Project
# Plot 1

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

# We work with the days that we need
power<-subset(power_all_days, Date == "2007-02-01"
              | Date == "2007-02-02")

# Print the Plot 1
png("plot1.png", width = 480, height = 480)
hist(power$Global_active_power, col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (Kilowatts)")
dev.off() 
