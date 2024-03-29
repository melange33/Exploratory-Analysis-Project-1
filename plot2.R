#Read in packages
library(ggplot2)

#Read in File
db_file="household_power_consumption.txt"
data <- read.table(db_file, header = TRUE, sep = ";", dec = ".", na.strings = "?", colClasses = c(NA, NA, rep ("numeric", 7)))
data<-subset(data,data$Date=="1/2/2007" | Date == "2/2/2007")

#Convert Date and Time
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

#Graph2
png(filename = "plot2.png",width = 480,height = 480)


plot(data$DateTime,data$Global_active_power,type="l",ylab="Global Active Power (kilowatts)")

dev.off