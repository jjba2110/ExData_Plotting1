#Inits and libs
library(chron)
stPath = "C:\\RData\\ExploratoryDataAnalysis\\"

#Read a few records to get column classes, put classes in a vector and remove the temp object
power5 <- read.table(paste(stPath, "household_power_consumption.txt", sep=""), na.strings = "?", header = T, sep=";", nrows = 5)
classes <- sapply(power5, class)
remove(power5)

#Load data
power <- read.csv(paste(stPath, "household_power_consumption.txt", sep=""), na.strings = "?", header = T, sep=";",  colClasses = classes)

#convert Data to a Data class and subset
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")
power <- subset(power, Date >= "2007-02-01" & Date <= "2007-02-02")

#Convert Time to a times class
power$Time <- chron(times = power$Time)

#set par mfrow to contain 4 plots
par(mfrow = c(2, 2))

#create plot 4 - top left
with(power, plot(Global_active_power ~ as.POSIXct(paste(power$Date,power$Time)), type="l", ylab = "Global Active Power", xlab=""))

#create plot 4 - top right
with(power, plot(Voltage ~ as.POSIXct(paste(power$Date,power$Time)), type="l", ylab = "Voltage", xlab=""))

#create plot 4 - bottom left
with(power, plot(Sub_metering_1 ~ as.POSIXct(paste(power$Date,power$Time)), type="n", ylab = "Global Active Power", xlab=""))
with(power, lines(Sub_metering_1 ~ as.POSIXct(paste(power$Date,power$Time)), col="black"))
with(power, lines(Sub_metering_2 ~ as.POSIXct(paste(power$Date,power$Time)), col="red"))
with(power, lines(Sub_metering_3 ~ as.POSIXct(paste(power$Date,power$Time)), col="blue"))

#create plot 4 - bottom right
with(power, plot(Global_reactive_power ~ as.POSIXct(paste(power$Date,power$Time)), type="l", ylab = "Global Reactive Power", xlab=""))

#set new path for png files (git)
stPath = "C:\\RData\\ExploratoryDataAnalysis\\ExData_Plotting1\\"

#make png file
dev.copy(png, file=paste(stPath, "plot4.png", sep=""), width=480, height=480)
dev.off()
