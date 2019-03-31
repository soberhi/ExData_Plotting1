library(dplyr)

myDir <- "C:/Data Science/Assignments/Course 4/Week 1"
myFile <- "exdata_data_household_power_consumption/household_power_consumption.txt"

df <- tbl_df(read.table(paste(myDir,myFile,sep="/"), header=TRUE, sep= ";", na.strings = c("?","")))
df <- subset(df, Date == "2/1/2007" | Date == "2/2/2007")

##Plot #4

## convert to dates and time
df$myDate <- as.Date(df$Date, format = "%m/%d/%Y")
df$myTime <- strptime(paste(df$myDate, df$Time), format = "%Y-%m-%d %H:%M:%S")

myFile <- "exdata_data_household_power_consumption/plot4.png"
png(file=paste(myDir,myFile,sep="/"), width = 480, height = 480)
par(mfrow=c(2,2))
plot(x = df$myTime, y = df$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "", ylim=c(0,6))
plot(x = df$myTime, y = df$Voltage, type = "l", ylab = "Voltage", xlab = "datetime", ylim=c(234,246))
plot(x = df$myTime, y = df$Sub_metering_1, type = "l", col= "black", xlab = "", ylab = "Energy sub metering", ylim=c(0,30))
lines(x = df$myTime, y = df$Sub_metering_2, type = "l", col = "red")
lines(x = df$myTime, y = df$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(x = df$myTime, y = df$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime", ylim=c(0.0,0.5))
dev.off()