Main_Data <- read.csv("household_power_consumption.txt", header=T, stringsAsFactors = FALSE, sep=';', dec = ".")
#separating the data for plot1 ranged between dates 1/2/2007 and 2/2/2007
SubSetData <- Main_Data[Main_Data$Date %in% c("1/2/2007", "2/2/2007"), ]
#converting the Global active power from character to Numeric
P <- as.numeric(SubSetData$Global_active_power)
#open Graphic Device
png("plot1.png", width = 480, height = 480)
#Plot the histogram
hist(P, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")
#Do not forget to put off the graphic device
dev.off()
                      