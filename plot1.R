#Read in packages
library(ggplot2)

#Read in File
db_file="household_power_consumption.txt"
data <- read.table(db_file, header = TRUE, sep = ";", dec = ".", na.strings = "?", colClasses = c(NA, NA, rep ("numeric", 7)))
data<-subset(data,data$Date=="1/2/2007" | Date == "2/2/2007")

#Convert Date and Time
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")


#Graph 1
png(filename = "plot1.png",width = 480,height = 480)


hist(data$Global_active_power,xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power",col="red")

dev.off()
