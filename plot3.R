#Read in packages
library(ggplot2)

#Read in File
db_file="household_power_consumption.txt"
data <- read.table(db_file, header = TRUE, sep = ";", dec = ".", na.strings = "?", colClasses = c(NA, NA, rep ("numeric", 7)))
data<-subset(data,data$Date=="1/2/2007" | Date == "2/2/2007")

#Convert Date and Time
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")


#Graph3
png(filename = "plot3.png",width = 480,height = 480)


plot(data$DateTime,data$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(data$DateTime,data$Sub_metering_2,col="red")
lines(data$DateTime,data$Sub_metering_3,col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, bty = "n")

dev.off()