
# load library
if ( !require("sqldf") ) {
    install.packages("sqldf")
}
library(sqldf)

# read data
colClass <- c(rep("character",2), rep("numeric",7))
sqlText <- "SELECT * FROM file WHERE Date in ( '1/2/2007', '2/2/2007' )"
consum <- read.csv.sql(file="household_power_consumption.txt", sql=sqlText, sep=";",
                       header=TRUE,colClasses=colClass)

# open device
png(filename="plot1.PNG", width=480, height=480, units="px")

# plot data
hist(consum$Global_active_power, main="Global Acitve Power",
     xlab="Global Active Power(kilowatts)", col="red")

#close device
dev.off()