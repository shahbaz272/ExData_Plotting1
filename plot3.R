plot3 <- function() {

        require("lubridate")
        alldata <- read.table("household_power_consumption.txt",
                              sep = ";",
                              header = TRUE,
                              na.strings = "?",
                              colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

        data <- subset(alldata, Date == "1/2/2007"|Date == "2/2/2007")
        data$datetime <- paste(data$Date,data$Time, sep = " ")
        data$datetime <- dmy_hms(data$datetime)

        rm("alldata")
        dev.set(3)
        png(filename = "plot3.png", width = 480, height = 480,units = "px")
        plot(data$datetime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
        points(data$datetime, data$Sub_metering_2, col = "red", type = "l")
        points(data$datetime, data$Sub_metering_3, col = "blue", type = "l")
        legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1)
        dev.off()
}