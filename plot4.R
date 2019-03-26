library(data.table)

setwd("C:/Users/mahmoud/Documents/R_data")

data <- data.table::fread(input = "household_power_consumption.txt" ,na.strings = "?")

data$dateTime <- as.POSIXct(paste(data$Date, data$Time), 
                            format = "%d/%m/%Y %H:%M:%S")
data <- data[(dateTime >= "2007-02-01") & (dateTime <= "2007-02-02 23:59:00")]

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(data$dateTime ,data$Global_active_power , type = "l",xlab="", ylab="Global Active Power")
plot(data$dateTime,data$Voltage, type = "l",xlab="datetime", ylab="Voltage")
plot(data$dateTime,data$Sub_metering_1,type="l", xlab="", ylab="Energy sub metering")
lines(data$dateTime,data$Sub_metering_2 ,col = "red")
lines(data$dateTime,data$Sub_metering_3 ,col = "blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))
plot(data$dateTime,data$Global_reactive_power,type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()


