# Import data.
# The precondition is that the "household_power_consumption.txt" file is saved in
# working directory.
dataimport <- read.table("household_power_consumption.txt",header = TRUE, sep = ";",
                         stringsAsFactors = FALSE)
mydata <- subset(dataimport,Date == "1/2/2007" | Date == "2/2/2007")
rm(dataimport)

# Open png device
png(filename = "plot4.png")

# Set canvas layout
par(mfcol = c(2,2))

# Graph 1
DateTime <- paste(mydata$Date,mydata$Time,sep = " ")
DateTime <- strptime(DateTime,"%d/%m/%Y %H:%M:%S")
plot(DateTime,as.numeric(mydata$Global_active_power),type = "l",xlab = "",
     ylab = "Global Active Power")

# Graph 2
plot(DateTime,as.numeric(mydata$Sub_metering_1), type = "l",xlab = "",
     ylab = "Energy sub metering")
lines(DateTime,as.numeric(mydata$Sub_metering_2),type = "l",col="red")
lines(DateTime,as.numeric(mydata$Sub_metering_3),type = "l",col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"),lwd = 1,bty = "n")

# Graph 3
plot(DateTime,as.numeric(mydata$Voltage),type = "l",ylab = "Voltage")

# Graph 4
plot(DateTime,as.numeric(mydata$Global_reactive_power),type = "l",
     ylab = "Global_reactive_power")

# Close png device
dev.off()
