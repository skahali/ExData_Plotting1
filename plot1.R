##############################################################
## Plot1
## Coursera: Exploratory Data Analysis
## Purpose: To plot a Histogram of Global Active Power
## Assumptions: 
##  Data File and Code are in same folder. 
## 
##############################################################

## Read data into a Data Frame
m_power_data <- read.csv("household_power_consumption.txt", na.strings = "?", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), sep = ";")

## Subsetting Data based on Date we need data from the dates 2007-02-01 and 2007-02-02
## As date data is stored as string in m/d/Y format using 1/2/2007 and 2/2/2007 to 
##filter the raw data
m_power_data <- m_power_data[(m_power_data$Date == "1/2/2007") | (m_power_data$Date == "2/2/2007"),]

## Set the Device to png so that we can create plot1.png file with a 
## width of 480 pixels and a height of 480 pixels
png(filename = "plot1.png",width = 480, height = 480, units = "px")

## Build the Histogram Graph
hist(m_power_data$Global_active_power, col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

## Release the png Device
dev.off()
