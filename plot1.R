# Exploratory Data Analytis, Course Project 1
## Plot 1
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
png(filename = "plot1.png",
    width=480, 
    height=480, 
    units="px")

# Create histogram
hist(df_power$Global_active_power,
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     main="Global Active Power",
     col="red")

dev.off ()