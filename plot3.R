data <- read.table("../household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?",
                   stringsAsFactors = FALSE)

data_subset <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

data_subset$datetime <- strptime(paste(data_subset$Date, data_subset$Time),
                                  "%d/%m/%Y %H:%M:%S")

png("plot3.png", width = 480, height = 480)

plot(data_subset$datetime, data_subset$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")

lines(data_subset$datetime, data_subset$Sub_metering_2, col = "red")
lines(data_subset$datetime, data_subset$Sub_metering_3, col = "blue")

legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1)

dev.off()
