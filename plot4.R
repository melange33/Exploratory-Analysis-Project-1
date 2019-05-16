#Read in packages
library(ggplot2)

#Read in File
db_file="household_power_consumption.txt"
data <- read.table(db_file, header = TRUE, sep = ";", dec = ".", na.strings = "?", colClasses = c(NA, NA, rep ("numeric", 7)))
data<-subset(data,data$Date=="1/2/2007" | Date == "2/2/2007")

#Convert Date and Time
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")


#Graph4
png(filename = "plot4.png",width = 480,height = 480)

par(mfrow=c(2,2),mar=c(4,4,4,4))

with(data,plot(DateTime,Global_active_power,type="l",xlab="",ylab = "Global Active Power"))
with(data,plot(DateTime,Voltage,type="l",xlab = "datetime",ylab = "Voltage"))
with(data,plot(DateTime,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
lines(data$DateTime,data$Sub_metering_2,col="red")
lines(data$DateTime,data$Sub_metering_3,col="blue")
legend("topright",lty=1,lwd=2,c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
with(data,plot(DateTime,Global_reactive_power,type="l",xlab="datetime"))

dev.off()