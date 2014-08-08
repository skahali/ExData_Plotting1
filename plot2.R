##############################################################
## Plot2
## Coursera: Exploratory Data Analysis
## Purpose: To plot a graph using Global Active Power and Date/Time
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

## We need to use Date and Time value to Plot the Line Graph
## For this we can use the Date and Time columns in the data set and create a vector of
## DateTime values.
## Using paste to combine the dates and then using strptime to convert to DateTime variable. 
m_datetime <- strptime(paste(m_power_data$Date, m_power_data$Time), "%d/%m/%Y %H:%M:%S")

## Convert the type of Time column from Factor to DateTime,
## Use paste function to combine Date andTime column, if you use to Convert Time column
## only then R will add time to current Date, where as we need the Time Column to represent 
## datetime for the Date and Time column.

## Set the Device to png so that the graph created is stored in plot1.png file
png(filename = "plot2.png",width = 480, height = 480, units = "px")

## Build the Line Graph using the plot function
plot(m_datetime, m_power_data$Global_active_power,  
     type="l", 
     ylab = "Global Active Power (kilowatts)", 
     xlab=NA)

## Release the png Device
dev.off()
