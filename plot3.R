# Exploratory Data Analytis, Course Project 1
## Plot 3
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
png(filename = "plot3.png",
    width=480, 
    height=480, 
    units="px")

# Create plot
color_1 <- "black"
color_2 <- "red"
color_3 <- "blue"
plot(as.POSIXct(paste(df_power$Date,df_power$Time), format = "%d/%m/%Y %H:%M:%S"),
     df_power$Sub_metering_1,
     type="l",
     col= color_1,
     ylab="Energy sub metering",
     xlab="")

lines(as.POSIXct(paste(df_power$Date,df_power$Time), format = "%d/%m/%Y %H:%M:%S"),
      df_power$Sub_metering_2,
      type="l",
      col= color_2,
      ylab="",
      xlab="")

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

dev.off ()