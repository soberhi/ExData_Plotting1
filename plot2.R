library(dplyr)

myDir <- "C:/Data Science/Assignments/Course 4/Week 1"
myFile <- "exdata_data_household_power_consumption/household_power_consumption.txt"

df <- tbl_df(read.table(paste(myDir,myFile,sep="/"), header=TRUE, sep= ";", na.strings = c("?","")))
df <- subset(df, Date == "2/1/2007" | Date == "2/2/2007")

##Plot #2

## convert to dates and time
df$myDate <- as.Date(df$Date, format = "%m/%d/%Y")
df$myTime <- strptime(paste(df$myDate, df$Time), format = "%Y-%m-%d %H:%M:%S")

## create plot
myFile <- "exdata_data_household_power_consumption/plot2.png"
png(file=paste(myDir,myFile,sep="/"), width = 480, height = 480)
plot(x = df$myTime, y = df$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "", ylim=c(0,6))
dev.off()