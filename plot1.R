library(dplyr)
#library(lubridate)

full_df <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
#full_df$Date <- strptime(full_df$Date, "%d/%m/%Y")
exact_df <- filter(full_df, Date == "1/2/2007" | Date == "2/2/2007")

#plot1
exact_df$Global_active_power <- as.numeric(exact_df$Global_active_power)

png(filename = "./plot1.png", width = 480, height = 480)
hist(exact_df$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

rm("full_df", "exact_df")