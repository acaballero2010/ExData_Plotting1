# Exploratory Data Analysis
# Course Project 1

# Setting working directory
setwd("C:/Users/Miah Alexa/Documents/Coursera - Data Science Specialization Track/Exploratory Data Analysis/Week 1/Project")

# Loading dataset into RStudio
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

# Subsetting the required data table
# Only need data from 2007-02-01 and 2007-02-02
# Converting data$Date to date format
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
dataRequired <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# For easier manipulation, its better to combine Date and Time column
datetime <- paste(as.Date(dataRequired$Date), dataRequired$Time)
dataRequired$Datetime <- as.POSIXct(datetime)

# Plotting graph 4
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))

# Plot 1 of 4
plot(dataRequired$Datetime, 
     as.numeric(as.character(dataRequired$Global_active_power)), 
     type = "l", 
     ylab = "Global Active Power", 
     xlab = "")

# Plot 2 of 4
plot(dataRequired$Datetime, 
     as.numeric(as.character(dataRequired$Voltage)), 
     type = "l", 
     ylab = "Voltage", 
     xlab = "datetime")

# Plot 3 of 4 (same with plot3.R)
plot(dataRequired$Datetime, 
     as.numeric(as.character(dataRequired$Sub_metering_1)), 
     type = "l", 
     xlab = "", 
     ylab = "Energy sub metering")
points(dataRequired$Datetime, 
       as.numeric(as.character(dataRequired$Sub_metering_2)), 
       type = "l", 
       xlab = "", 
       ylab = "Energy sub metering", 
       col = "Red")
points(dataRequired$Datetime, 
       as.numeric(as.character(dataRequired$Sub_metering_3)), 
       type = "l", 
       xlab = "", 
       ylab = "Energy sub metering", 
       col = "Blue")
legend("topright", cex = 0.2, lty = 1, col = c("Black", "Red", "Blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Plot 4 of 4
plot(dataRequired$Datetime, 
     as.numeric(as.character(dataRequired$Global_reactive_power)), 
     type = "l", 
     xlab = "datetime", 
     ylab = "Global_reactive_power", 
     ylim = c(0, 0.5))

dev.off()


