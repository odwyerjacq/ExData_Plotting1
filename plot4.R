## Load source data
Orig_Data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

##subset to date range required
Orig_Data$Date <- as.Date(Orig_Data$Date, format="%d/%m/%Y")
Data <- subset(Orig_Data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## plot 4
par(mfrow = c(2,2))

##top left
plot(as.numeric(as.character(Data$Global_active_power))~Data$Datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

##top right
plot(as.numeric(as.character(Data$Voltage))~Data$Datetime, type = "l", ylab = "Voltage", xlab = "datetime")

##bottom left
with(Data, {
  plot(as.numeric(Sub_metering_1)~Datetime, type = "l", ylab = "Global Active Power (kilowatts)"
       ,xlab = "")
  lines(as.numeric(Data$Sub_metering_2)~Data$Datetime, type = "l", col = "red")
  lines(as.numeric(Data$Sub_metering_3)~Data$Datetime, type = "l", col = "Blue")
})
legend("topright", col=c("black", "red","blue"), lty = 1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

