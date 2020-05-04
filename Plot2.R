Main_Data <- read.csv("household_power_consumption.txt", header=T, stringsAsFactors = FALSE, sep=';', dec = ".")
#separating the data for plot2 ranged between dates 1/2/2007 and 2/2/2007
Partdata <- Main_Data[Main_Data$Date %in% c("1/2/2007", "2/2/2007"), ]
#for convenience converted to data table
#load Library(data.table)
Plot2Data <- data.table(Partdata)
#Conversion of Date and Time Comumns together and into datetime new column using strptime
datetime <- strptime(paste(Plot2Data$Date, Plot2Data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
Plot2Data$datetime <- as.POSIXct(datetime)
#Converting Global_active_power rom character to Numeric
Plot2Data$Global_active_power <- as.numeric(Plot2Data$Global_active_power)
#open Graphic Device
png("plot2.png", width = 480, height = 480)
#Plot the variables datatime and Global active power
plot(Plot2Data$datetime, Plot2Data$Global_active_power, type="l", xlab="", ylab = "Global Active Power(kilowatts)")
#Do not forget to put off the graphic device
dev.off()

