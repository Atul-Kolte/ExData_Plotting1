Main_Data <- read.csv("household_power_consumption.txt", header=T, stringsAsFactors = FALSE, sep=';', dec = ".")
#separating the data for plot4 ranged between dates 1/2/2007 and 2/2/2007
Partdata <- Main_Data[Main_Data$Date %in% c("1/2/2007", "2/2/2007"), ]
#for convenience converted to data table
#load Library(data.table)
Plot2Data <- data.table(Partdata)
#Conversion of Date and Time Comumns together and into datetime new column using strptime
datetime <- strptime(paste(Plot2Data$Date, Plot2Data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
Plot2Data$datetime <- as.POSIXct(datetime)
#Converting Global_active_power from character to Numeric
Plot2Data$Global_active_power <- as.numeric(Plot2Data$Global_active_power)
#Converting Global_reactive_power from character to Numeric
Plot2Data$Global_reactive_power <- as.numeric(Plot2Data$Global_reactive_power)
#Converting Voltage from character to Numeric
Plot2Data$Voltage <- as.numeric(Plot2Data$Voltage)
#Converting other colunms from character to numeric
SubMetering_1 <- as.numeric(Plot2Data$Sub_metering_1)
SubMetering_2 <- as.numeric(Plot2Data$Sub_metering_2)
SubMetering_3 <- as.numeric(Plot2Data$Sub_metering_3)
#open Graphic Device
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(datetime, Plot2Data$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, Plot2Data$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, SubMetering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, SubMetering_2, type="l", col="red")
lines(datetime, SubMetering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2.5, col=c("black", "red", "blue"))
plot(datetime, Plot2Data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
#Do not forget to put off the graphic device
dev.off()

