DateTime <- paste(mydata$Date,mydata$Time,sep = " ")
DateTime <- strptime(DateTime,"%d/%m/%Y %H:%M:%S")
plot(DateTime,as.numeric(mydata$Global_active_power),type = "l",xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.copy(png,"plot1.png")
dev.off()
