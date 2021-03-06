# Import data.
# The precondition is that the "household_power_consumption.txt" file is saved in
# working directory.
dataimport <- read.table("household_power_consumption.txt",header = TRUE, sep = ";",
                         stringsAsFactors = FALSE)
mydata <- subset(dataimport,Date == "1/2/2007" | Date == "2/2/2007")
rm(dataimport)

# Plot graph
DateTime <- paste(mydata$Date,mydata$Time,sep = " ")
DateTime <- strptime(DateTime,"%d/%m/%Y %H:%M:%S")
plot(DateTime,as.numeric(mydata$Global_active_power),type = "l",xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.copy(png,"plot2.png")
dev.off()
