## Load source data
Orig_Data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

##subset to date range required
Orig_Data$Date <- as.Date(Orig_Data$Date, format="%d/%m/%Y")
Data <- subset(Orig_Data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

datetime <- paste(as.Date(Data$Date), Data$Time)
Data$Datetime <- as.POSIXct(datetime)

## Plot 1
hist(as.numeric(Data$Global_active_power), main= "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")
dev.copy(png, file="plot1.png", height = 480, width = 480)
dev.off()