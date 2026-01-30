data <- read.table("../household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?",
                   stringsAsFactors = FALSE)

data_subset <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

data_subset$datetime <- strptime(paste(data_subset$Date, data_subset$Time),
                                  "%d/%m/%Y %H:%M:%S")

png("plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))

plot(data_subset$datetime, data_subset$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power")

plot(data_subset$datetime, data_subset$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

plot(data_subset$datetime, data_subset$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")
lines(data_subset$datetime, data_subset$Sub_metering_2, col = "red")
lines(data_subset$datetime, data_subset$Sub_metering_3, col = "blue")
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1,
       bty = "n",
       cex = 0.8)

plot(data_subset$datetime, data_subset$Global_reactive_power,
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power")

dev.off()
