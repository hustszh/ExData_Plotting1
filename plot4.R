
# load library
if ( !require("sqldf") ) {
    install.packages("sqldf")
}
library(sqldf)

# read data
colClass <- c(rep("character",2), rep("numeric",7))
sqlText <- "SELECT * FROM file WHERE Date in ( '1/2/2007', '2/2/2007' )"
consum <- read.csv.sql(file="household_power_consumption.txt", sql=sqlText, sep=";",
                       header=TRUE, colClasses=colClass)

# get date and time data
Sys.setlocale("LC_TIME","english")
dateTime <- paste(consum$Date, consum$Time)
consum$dateTime <- strptime(dateTime, format="%d/%m/%Y %H:%M:%S")

# open device
png(filename="plot4.PNG", width=480, height=480, units="px")

# plot data
par(mfrow=c(2,2))
# No. 1
with(consum, {
    plot(dateTime, Global_active_power, xlab="",
         ylab="Global Active Power", type="l")
})

# No. 2
with(consum, {
    plot(dateTime, Voltage, xlab="datetime", ylab="Voltage", type="l")
})

# NO. 3
with(consum, { 
    plot(dateTime, Sub_metering_1, xlab="", ylab="Energy sub metering",
         type="l", col="black")
    lines(dateTime, Sub_metering_2, type="l", col="red")
    lines(dateTime, Sub_metering_3, type="l", col="blue")
    legend("topright", lty=1, bty="n", cex=0.75,
           col=c("black", "red", "blue"), 
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})

# NO. 4
with(consum, {
    plot(dateTime, Global_reactive_power, xlab="datetime", 
         ylab="Global_reactive_power", type="l")
})

#close device
dev.off()