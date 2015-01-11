# Exploratory Data Analysis
# Course Project 1

# Downloaded the dataset to local directory
# Setting working directory
setwd("C:/Users/Miah Alexa/Documents/Coursera - Data Science Specialization Track/Exploratory Data Analysis/Week 1/Project")

# Loading dataset into RStudio
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

# Subsetting the required data table
# Only need data from 2007-02-01 and 2007-02-02
# Converting data$Date to date format
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
dataRequired <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Plotting first graph, Global Active Power
hist(as.numeric(as.character(dataRequired$Global_active_power)), 
       main="Global Active Power",
       xlab="Global Active Power (kilowatts)",
       ylab="Frequency",
       col="Red",
)

dev.off()





