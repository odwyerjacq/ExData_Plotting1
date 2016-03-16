## Load source data
Orig_Data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

##subset to date range required
Orig_Data$Date <- as.Date(Orig_Data$Date, format="%d/%m/%Y")
Data <- subset(Orig_Data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

datetime <- paste(as.Date(Data$Date), Data$Time)
Data$Datetime <- as.POSIXct(datetime)

## Plot 2
plot(as.numeric(Data$Global_active_power)~Data$Datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

dev.copy(png, file="plot2.png", height = 480, width = 480)
dev.off()
