#Add the required libraries
library(lubridate)
library(dplyr)

#Read the file fully
hpc_raw <- read.delim("household_power_consumption.txt",header = TRUE,sep = ";")

#standardize the date
hpc_raw[,1] <- as.Date(hpc_raw[,1],"%d/%m/%Y")

#filter the days we need
hpc_raw_dated <- filter(hpc_raw,Date >= "2007-02-01" & Date <= "2007-02-02" )


#Converting to numeric value for plotting
hpc_raw_dated[,3] <- as.numeric(as.character(hpc_raw_dated[,3]))
hpc_raw_dated[,4] <- as.numeric(as.character(hpc_raw_dated[,4]))
hpc_raw_dated[,5] <- as.numeric(as.character(hpc_raw_dated[,5]))
hpc_raw_dated[,7] <- as.numeric(as.character(hpc_raw_dated[,7]))
hpc_raw_dated[,8] <- as.numeric(as.character(hpc_raw_dated[,8]))
hpc_raw_dated[,9] <- as.numeric(as.character(hpc_raw_dated[,9]))
#hpc_raw_dated <- mutate(hpc_raw_dated,weekday = wday(paste(Date,Time)))

#PNG file with specified width and height

png("plot4.png",width = 480,height = 480)

#Margins and Layout
par(mfcol = c(2,2),mar = c(4,2.2,4,2.2))

#Plot 1 - Global Active Power
with(hpc_raw_dated,plot(Global_active_power,type = "l",ylab = "Global Active Power(kilowatts)",xaxt = "n",xlab = ""))
axis(1,at = c(1,1441,2881),labels = c("Thu","Fri","Sat"))


#Plot 2 - Energy Sub Metering 
with(hpc_raw_dated,plot(Sub_metering_1,type = "l",ylab = "Energy sub metering",xaxt = "n",col = "black",xlab = ""))
with(hpc_raw_dated,lines(Sub_metering_2,col = "red"))
with(hpc_raw_dated,lines(Sub_metering_3,col = "blue"))
legend(1000,35,pch = c(NA,NA,NA),lwd = 1,col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty = "n")
axis(1,at = c(1,1441,2881),labels = c("Thu","Fri","Sat"))

#Plot 3 - Voltage
with(hpc_raw_dated,plot(Voltage,type = "l",xaxt = "n",yaxt = "n",xlab = "datetime"))
axis(1,at = c(1,1441,2881),labels = c("Thu","Fri","Sat"))
axis(2,at = c(234,236,238,240,242,244,246),labels = c("234",NA,"238",NA,"242",NA,"246"))

#Plot 4 - Global Reactive Power
with(hpc_raw_dated,plot(Global_reactive_power,type = "l",xaxt = "n",xlab = "datetime"))
axis(1,at = c(1,1441,2881),labels = c("Thu","Fri","Sat"))

dev.off()