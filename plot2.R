
data_url <- "C:/Users/mikael.herve/Documents/R/household_power_consumption.txt"
class <- c(Voltage="numeric", Global_active_power="numeric",Global_intensity="numeric",Sub_metering_1="numeric",Sub_metering_2="numeric",Sub_metering_3="numeric",Global_reactive_power="numeric")
origin <-read.table(data_url, header=TRUE,sep=";",dec=".", stringsAsFactors=FALSE, na.strings = "?",colClasses = class)

data<-subset(origin,origin$Date=="1/2/2007" | origin$Date=="2/2/2007")
#data$Date <- as.Date(data$Date, format="%d/%m/%Y")

#origin$Date <- as.Date(origin$Date, format="%d/%m/%Y")
#data<-subset(origin,origin$Date=="2007-2-1" | origin$Date=="2007-2-2")

#data$Time <- as.POSIXct(data$Time,format="%H:%M:%S")

data$datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

png("plot2.png",480,480)
with(data,plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()