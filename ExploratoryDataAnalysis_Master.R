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

#create histogram in window()
hist(power$Global_active_power, ylab = "Frequency", xlab = "Global Active Power (kilowatts)", col="red", main = "Global Active Power")

#set new path for png files (git)
stPath = "C:\\RData\\ExploratoryDataAnalysis\\ExData_Plotting1\\"

#create png file and close device
dev.copy(png, file=paste(stPath, "plot1.png", sep=""), width=480, height=480)
dev.off()


with(power, plot(Global_active_power ~ as.POSIXct(paste(power$Date,power$Time)), type="l", ylab = "Global Active Power(kilowatts)", xlab=""))
dev.copy(png, file=paste(stPath, "plot2.png", sep=""), width=480, height=480)
dev.off()

with(power, plot(Sub_metering_1 ~ as.POSIXct(paste(power$Date,power$Time)), type="n", ylab = "Global Active Power(kilowatts)", xlab=""))
with(power, lines(Sub_metering_1 ~ as.POSIXct(paste(power$Date,power$Time)), col="black"))
with(power, lines(Sub_metering_2 ~ as.POSIXct(paste(power$Date,power$Time)), col="red"))
with(power, lines(Sub_metering_3 ~ as.POSIXct(paste(power$Date,power$Time)), col="blue"))
dev.copy(png, file=paste(stPath, "plot3.png", sep=""), width=480, height=480)
dev.off()

with(power, plot(Global_reactive_power ~ as.POSIXct(paste(power$Date,power$Time)), type="l", ylab = "Global Reactive Power", xlab=""))


with(power, plot(Voltage ~ as.POSIXct(paste(power$Date,power$Time)), type="l", ylab = "Voltage", xlab=""))







dev.copy(png, file=paste(stPath, "plot4.png", sep=""), width=480, height=480)
dev.off()
