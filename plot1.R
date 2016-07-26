

#Read in the data
  
initial <- read.table("household_power_consumption.txt", stringsAsFactors= FALSE,sep = ";",
                  colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric") ,header = TRUE, na.strings = "?")
library(dplyr)
initial2 <- mutate(initial, dateTime = paste(Date,Time))
initial2$dateTime<- strptime(initial2$dateTime, "%d/%m/%Y %H:%M:%S")
initial2$dateTime <- as.POSIXct(initial2$dateTime)
subSet <- filter(initial2, dateTime > as.POSIXct( "2007-02-01 00:00:00") & dateTime < as.POSIXct( "2007-02-03 00:00:00"))

#Plot 1

png(file = "plot1.png",width = 480, height = 480)
with(subSet,hist(subSet$Global_active_power,col = "red", xlab = "Global Active Power(kilowatts)",main = "Global Active Power"))
dev.off()


