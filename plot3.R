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

# Plotting graph 3

plot(dataRequired$Datetime, 
     as.numeric(as.character(dataRequired$Sub_metering_1)),
     type = "l",
     xlab = "", 
     ylab = "Energy sub metering")
lines(dataRequired$Datetime, 
       as.numeric(as.character(dataRequired$Sub_metering_2)), 
       type = "l",
       xlab = "", 
       ylab = "Energy sub metering", 
       col = "Red")
lines(dataRequired$Datetime, 
       as.numeric(as.character(dataRequired$Sub_metering_3)), 
       type = "l", 
       xlab = "", 
       ylab = "Energy sub metering", 
       col = "Blue")

# Adding legend to the graph
legend("topright", cex = 0.5, col = c("Black", "Red", "Blue"), lty = 1, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
par()
?legend
?par
