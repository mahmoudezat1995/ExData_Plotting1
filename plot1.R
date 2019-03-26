library(data.table)

        setwd("C:/Users/mahmoud/Documents/R_data")
        
        data <- data.table::fread(input = "household_power_consumption.txt" ,na.strings = "?")
        
        data$Date <-as.Date(data$Date ,format = "%d/%m/%Y")

        data <- data[(Date >= "2007-02-01") & (Date <= "2007-02-02")]
        
        png("plot1.png", width=480, height=480)
        
        hist(data$Global_active_power ,col = "red",
             
        main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
        
        dev.off()


