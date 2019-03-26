library(data.table)

        setwd("C:/Users/mahmoud/Documents/R_data")

        data <- data.table::fread(input = "household_power_consumption.txt" ,na.strings = "?")
        
        data$dateTime <- as.POSIXct(paste(data$Date, data$Time), 
                                format = "%d/%m/%Y %H:%M:%S")
        data <- data[(dateTime >= "2007-02-01") & (dateTime <= "2007-02-02 23:59:00")]
        
        png("plot2.png", width=480, height=480)
        
        plot(data$dateTime ,data$Global_active_power , type = "l",xlab="", ylab="Global Active Power (kilowatts)")
        
        dev.off()



        