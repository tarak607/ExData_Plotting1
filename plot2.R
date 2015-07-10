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


png("plot2.png",width = 480,height = 480)

#Plotting the global active power supressing the xaxisa
with(hpc_raw_dated,plot(Global_active_power,type = "l",ylab = "Global Active Power(kilowatts)",xaxt = "n",xlab = ""))

#setting up the x axis with the custom labels
axis(1,at = c(1,1441,2881),labels = c("Thu","Fri","Sat"))

dev.off()