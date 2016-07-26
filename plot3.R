#Read in the data

initial <- read.table("household_power_consumption.txt", stringsAsFactors= FALSE,sep = ";",
                      colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric") ,header = TRUE, na.strings = "?")
library(dplyr)
initial2 <- mutate(initial, dateTime = paste(Date,Time))
initial2$dateTime<- strptime(initial2$dateTime, "%d/%m/%Y %H:%M:%S")
initial2$dateTime <- as.POSIXct(initial2$dateTime)
subSet <- filter(initial2, dateTime > as.POSIXct( "2007-02-01 00:00:00") & dateTime < as.POSIXct( "2007-02-03 00:00:00"))

#plot 3
png(file = "plot3.png",width = 480, height = 480)

with(subSet,plot(dateTime,Sub_metering_1,pch = ".",xlab = "",ylab = "Energy sub metering"))
with(subSet,lines(dateTime,Sub_metering_1,pch = "."))
with(subSet,lines(dateTime,Sub_metering_2,pch = ".",col = "red"))
with(subSet,lines(dateTime,Sub_metering_3,pch = ".",col = "blue"))

legend("topright", col =c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),xjust = 1)
dev.off()