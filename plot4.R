library(dplyr)
#library(lubridate)

full_df <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
exact_df <- filter(full_df, Date == "1/2/2007" | Date == "2/2/2007")
exact_df$date_time <- paste(exact_df$Date, exact_df$Time, sep = " ")
exact_df$date_time <- strptime(exact_df$date_time, "%d/%m/%Y %H:%M:%S")

#plot4
exact_df$Global_active_power <- as.numeric(exact_df$Global_active_power)
exact_df$Sub_metering_1 <- as.numeric(exact_df$Sub_metering_1)
exact_df$Sub_metering_2 <- as.numeric(exact_df$Sub_metering_2)
exact_df$Sub_metering_3 <- as.numeric(exact_df$Sub_metering_3)
exact_df$Global_reactive_power <- as.numeric(exact_df$Global_reactive_power)
exact_df$Voltage <- as.numeric(exact_df$Voltage)

png(filename = "./plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))

#1
plot(exact_df$date_time, exact_df$Global_active_power, type = "l",  xlab = "", ylab = "Global Active Power")

#2
plot(exact_df$date_time, exact_df$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

#3
plot(exact_df$date_time, exact_df$Sub_metering_1, type = "l",  xlab = "", ylab = "Energy sub metering")
points(exact_df$date_time, exact_df$Sub_metering_2, type = "l", col = "red")
points(exact_df$date_time, exact_df$Sub_metering_3, type = "l", col = "blue")
legend("topright", bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#4
plot(exact_df$date_time, exact_df$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()

rm("full_df", "exact_df")