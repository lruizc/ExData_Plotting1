data <- read.table("../household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?",
                   stringsAsFactors = FALSE)

data_subset <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

data_subset$datetime <- strptime(paste(data_subset$Date, data_subset$Time),
                                  "%d/%m/%Y %H:%M:%S")

png("plot2.png", width = 480, height = 480)

plot(data_subset$datetime, data_subset$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()
