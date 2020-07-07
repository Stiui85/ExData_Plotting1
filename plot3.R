df <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

library(lubridate)
df$Date <- dmy(df$Date)
df2 <- df[df$Date %within% interval(dmy("01/02/2007"), dmy("02/02/2007")),]

es1 <- as.numeric(df2$Sub_metering_1)
es2 <- as.numeric(df2$Sub_metering_2)
es3 <- as.numeric(df2$Sub_metering_3)

dates <- as_datetime(paste(df2$Date, df2$Time), format = "%Y-%m-%d %H:%M:%S")

png("plot3.png")
plot(dates, es1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(dates, es2, type = "l", col = "red")
lines(dates, es3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering3"), col = c("black", "red", "blue"), lty = c(1,1,1))
dev.off()