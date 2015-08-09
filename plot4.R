# Exploratory Data Analytis, Course Project 1
## Plot 4
## Data Source: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

## Load necessary packages and set working directory
install.packages("sqldf")
setwd("~/Dropbox/CodeProjects/R/ExploratoryDataAnalysis-Project1/ExData_Plotting1")

## Read data file, only loading the dates required to plot for this assignment
df_power <- read.csv.sql("data/household_power_consumption.txt",
                   sep=";",
                   header=TRUE,
                   sql = 'select * from file where Date == "1/2/2007" or Date == "2/2/2007"')

# Save as 480px by 480px PNG file
png(filename = "plot4.png",
    width=480, 
    height=480, 
    units="px")

# Create plot
par(mfrow=c(2,2))

plot(as.POSIXct(paste(df_power$Date,df_power$Time), format = "%d/%m/%Y %H:%M:%S"),
     df_power$Global_active_power,
     type="l",
     ylab="Global Active Power (kilowatts)",
     xlab="")

plot(as.POSIXct(paste(df_power$Date,df_power$Time), format = "%d/%m/%Y %H:%M:%S"),
     df_power$Voltage,
     type="l",
     ylab="Voltage",
     xlab="datetime")

color_1 <- "black"
plot(as.POSIXct(paste(df_power$Date,df_power$Time), format = "%d/%m/%Y %H:%M:%S"),
     df_power$Sub_metering_1,
     type="l",
     col= color_1,
     ylab="Energy sub metering",
     xlab="")

color_2 <- "red"
lines(as.POSIXct(paste(df_power$Date,df_power$Time), format = "%d/%m/%Y %H:%M:%S"),
      df_power$Sub_metering_2,
      type="l",
      col= color_2,
      ylab="",
      xlab="")

color_3 <- "blue"
lines(as.POSIXct(paste(df_power$Date,df_power$Time), format = "%d/%m/%Y %H:%M:%S"),
      df_power$Sub_metering_3,
      type="l",
      col= color_3,
      ylab="",
      xlab="")

legend("topright",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),
       col=c(color_1,color_2,color_3))

plot(as.POSIXct(paste(df_power$Date,df_power$Time), format = "%d/%m/%Y %H:%M:%S"),
     df_power$Global_reactive_power,
     type="l",
     ylab="Global_reactive_power",
     xlab="datetime")

dev.off ()