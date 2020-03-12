# Import data.
# The precondition is that the "household_power_consumption.txt" file is saved in
# working directory.
dataimport <- read.table("household_power_consumption.txt",header = TRUE, sep = ";",
                         stringsAsFactors = FALSE)
mydata <- subset(dataimport,Date == "1/2/2007" | Date == "2/2/2007")
rm(dataimport)

png(filename = "plot3.png")

# Plot graph
DateTime <- paste(mydata$Date,mydata$Time,sep = " ")
DateTime <- strptime(DateTime,"%d/%m/%Y %H:%M:%S")
plot(DateTime,as.numeric(mydata$Sub_metering_1), type = "l",xlab = "",
     ylab = "Energy sub metering")
lines(DateTime,as.numeric(mydata$Sub_metering_2),type = "l",col="red")
lines(DateTime,as.numeric(mydata$Sub_metering_3),type = "l",col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"),lwd = 1)

dev.off()
