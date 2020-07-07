df <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

library(lubridate)
df$Date <- dmy(df$Date)
df2 <- df[df$Date %within% interval(dmy("01/02/2007"), dmy("02/02/2007")),]

gap <- as.numeric(df2$Global_active_power)
gap <- gap[!is.na(gap)]

dates <- as_datetime(paste(df2$Date, df2$Time), format = "%Y-%m-%d %H:%M:%S")

png("plot2.png")
plot(dates, gap, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()