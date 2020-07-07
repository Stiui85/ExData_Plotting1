df <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

library(lubridate)
df$Date <- dmy(df$Date)
df2 <- df[df$Date %within% interval(dmy("01/02/2007"), dmy("02/02/2007")),]

gap <- as.numeric(df2$Global_active_power)
gap <- gap[!is.na(gap)]

png("plot1.png")
hist(gap, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")
dev.off()