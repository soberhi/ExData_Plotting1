library(dplyr)

myDir <- "C:/Data Science/Assignments/Course 4/Week 1"
myFile <- "exdata_data_household_power_consumption/household_power_consumption.txt"

df <- tbl_df(read.table(paste(myDir,myFile,sep="/"), header=TRUE, sep= ";", na.strings = c("?","")))
df <- subset(df, Date == "2/1/2007" | Date == "2/2/2007")

##Plot #3

## convert to dates and time
df$myDate <- as.Date(df$Date, format = "%m/%d/%Y")
df$myTime <- strptime(paste(df$myDate, df$Time), format = "%Y-%m-%d %H:%M:%S")

plot(x = df$myTime, y = df$Sub_metering_1, type = "l", col= "black", xlab = "", ylab = "Energy sub metering", ylim=c(0,30))
lines(x = df$myTime, y = df$Sub_metering_2, type = "l", col = "red")
lines(x = df$myTime, y = df$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
myFile <- "exdata_data_household_power_consumption/plot3.png"
dev.copy(png, filename=paste(myDir,myFile,sep="/"))
dev.off()