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
hpc_raw_dated[,7] <- as.numeric(as.character(hpc_raw_dated[,7]))
hpc_raw_dated[,8] <- as.numeric(as.character(hpc_raw_dated[,8]))
hpc_raw_dated[,9] <- as.numeric(as.character(hpc_raw_dated[,9]))
#hpc_raw_dated <- mutate(hpc_raw_dated,weekday = wday(paste(Date,Time)))

#PNG file with specified width and height

png("plot3.png",width = 480,height = 480)

#Margins and Layout
par(mar = c(4,4,4,4),oma = c(0,0,0,0))

#Plotting 
with(hpc_raw_dated,plot(Sub_metering_1,type = "l",ylab = "Energy sub metering",xaxt = "n",col = "black",xlab = ""))
with(hpc_raw_dated,lines(Sub_metering_2,col = "red"))
with(hpc_raw_dated,lines(Sub_metering_3,col = "blue"))

#setting up the x axis with the custom labels
axis(1,at = c(1,1441,2881),labels = c("Thu","Fri","Sat"))
legend("topright",pch = c(NA,NA,NA),lwd = 1,col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


dev.off()