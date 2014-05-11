# Exploratory Data Analysis
# Assignment 1
# Plot 3

# set working data, obtain data and load into dataframe
setwd("~/Education/MOOCs/Data Science Specialization/Exploratory Data Analysis/Assignment1")
url <-'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
download.file(url, 'household_power_consumption.zip', method = 'curl')
unzip('household_power_consumption.zip')
data <- read.table('household_power_consumption.txt', sep = ';', header = TRUE, 
                   na.strings = "?") 

# convert dates to standard date types, subset data by dates, and convert times to 
# include date
data$Date <- as.Date(data$Date, '%d/%m/%Y')
data <- data[data$Date >= '2007-02-01' & data$Date <= '2007-02-02',]
data$Time <- strptime(paste(data$Date,data$Time), '%Y-%m-%d %H:%M:%S')

# form and save figure 3
png('plot1.png', width = 480, height = 480, bg="transparent")
plot(data$Time, data$Sub_metering_1, type = 'l', xlab = '', 
     ylab = 'Energy sub metering', col = 'black')
lines(data$Time, data$Sub_metering_2, type = 'l', col = 'red')
lines(data$Time, data$Sub_metering_3, type = 'l', col = 'blue')
legend('topright', lty = 1, col = c('black', 'red', 'blue'),
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
dev.off()