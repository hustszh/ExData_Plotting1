
# read data
colClass <- c(rep("character",2), rep("numeric",7))

consum <- read.csv("household_power_consumption.txt",sep=";",
                   na.strings="?",header=TRUE,colClasses=colClass)

# get subset data
plot_data <- subset(consum, consum$Date == "1/2/2007" | consum$Date == "2/2/2007")

# open device
png(filename="plot1.PNG", width=480, height=480, units="px")

# plot data
hist(consum$Global_active_power, main="Global Acitve Power",
     xlab="Global Active Power(kilowatts)", col="red")

#close device
dev.off()
