library(dplyr)

myDir <- "C:/Data Science/Assignments/Course 4/Week 1"
myFile <- "exdata_data_household_power_consumption/household_power_consumption.txt"

df <- tbl_df(read.table(paste(myDir,myFile,sep="/"), header=TRUE, sep= ";", na.strings = c("?","")))
df <- subset(df, Date == "2/1/2007" | Date == "2/2/2007")

##Plot #1

x <- df$Global_active_power
hist(x, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", ylim=c(0,1200), xlim=c(0,6))
myFile <- "exdata_data_household_power_consumption/plot1.png"
dev.copy(png, filename=paste(myDir,myFile,sep="/"))
dev.off ()