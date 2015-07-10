#Add the required libraries
library(dplyr)

#Read the file fully
hpc_raw <- read.delim("household_power_consumption.txt",header = TRUE,sep = ";")

#standardize the date
hpc_raw[,1] <- as.Date(hpc_raw[,1],"%d/%m/%Y")

#filter the days we need
hpc_raw_dated <- filter(hpc_raw,Date >= "2007-02-01" & Date <= "2007-02-02" )


#Converting to numeric value for plotting
hpc_raw_dated[,3] <- as.numeric(as.character(hpc_raw_dated[,3]))

png("plot1.png",width = 480,height = 480)


#Plots the histogram
hist(hpc_raw_dated$Global_active_power,main = "Global Active Power",xlab = "Global Active Power(kilowatts)",col = "red")


dev.off()

