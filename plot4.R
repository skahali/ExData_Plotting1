##############################################################
## Plot4
## Coursera: Exploratory Data Analysis
## Purpose: To plot multiple graph
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

## Set the Device to png so that the graph created is stored in plot1.png file
png(filename = "plot4.png",width = 480, height = 480, units = "px")

## As we are creating 4 Graphs lets set the Plotting area into 2 rows by 2 columns
par(mfrow = c(2, 2))

## Plot and Save the Global Active Power Line Graph
plot(m_datetime, m_power_data$Global_active_power,  type="l", 
     ylab = "Global Active Power", xlab=NA)

## Plot and Save the Global Active Power Line Graph
plot(m_datetime, m_power_data$Voltage,  type="l", 
     ylab = "Voltage", xlab="datetime")

## Plot and Save the Sub metering Line Graph
## use points(...) function to draw subsequent sub meterings
plot(m_datetime, m_power_data$Sub_metering_1,  type="n", 
     ylab = "Energy sub metering", xlab=NA, col="black")
points(m_datetime, m_power_data$Sub_metering_1,  type="l" , xlab=NA, col="black")
points(m_datetime, m_power_data$Sub_metering_2,  type="l" , xlab=NA, col="red")
points(m_datetime, m_power_data$Sub_metering_3,  type="l" , xlab=NA, col="blue")
## Add Legend to top right of the graph
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lwd=1, lty=c(1,1,1), bty="n")

## Plot and Save the Global Active Power Line Graph
plot(m_datetime, m_power_data$Global_reactive_power,  
     type="l", ylab = "Global_reactive_power", xlab="datetime")

## Release the png Device
dev.off()
