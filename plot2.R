
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
png(filename="plot2.PNG", width=480, height=480, units="px")

# plot data
plot(consum$dateTime, consum$Global_active_power, xlab="",
     ylab="Global Active Power(kilowatts)", type="l")

# close
dev.off()