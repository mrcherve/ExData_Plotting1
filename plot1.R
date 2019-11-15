
data_url <- "C:/Users/mikael.herve/Documents/R/household_power_consumption.txt"
class <- c(Voltage="numeric", Global_active_power="numeric",Global_intensity="numeric",Sub_metering_1="numeric",Sub_metering_2="numeric",Sub_metering_3="numeric",Global_reactive_power="numeric")
origin <-read.table(data_url, header=TRUE,sep=";",dec=".", stringsAsFactors=FALSE, na.strings = "?",colClasses = class)

#data<-subset(origin,origin$Date=="1/2/2007" | origin$Date=="2/2/2007")
#data$Date <- as.Date(data$Date, format="%d/%m/%Y")

origin$Date <- as.Date(origin$Date, format="%d/%m/%Y")
data<-subset(origin,origin$Date=="2007-2-1" | origin$Date=="2007-2-2")

png("plot1.png",480,480)
hist(data$Global_active_power, col="red", main="Global Active Power",xlab="Global Active Power (kilowatts)" ,ylab="Frequency")
dev.off()