library(dplyr)
#library(lubridate)

full_df <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
exact_df <- filter(full_df, Date == "1/2/2007" | Date == "2/2/2007")
exact_df$date_time <- paste(exact_df$Date, exact_df$Time, sep = " ")
exact_df$date_time <- strptime(exact_df$date_time, "%d/%m/%Y %H:%M:%S")

#plot2
exact_df$Global_active_power <- as.numeric(exact_df$Global_active_power)

png(filename = "./plot2.png", width = 480, height = 480)
plot(exact_df$date_time, exact_df$Global_active_power, type = "l",  xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()

rm("full_df", "exact_df")