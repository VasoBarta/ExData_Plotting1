# Import data.
# The precondition is that the "household_power_consumption.txt" file is saved in
# working directory.
dataimport <- read.table("household_power_consumption.txt",header = TRUE, sep = ";",
                         stringsAsFactors = FALSE)
mydata <- subset(dataimport,Date == "1/2/2007" | Date == "2/2/2007")
rm(dataimport)

# Plot graph
hist(as.numeric(mydata$Global_active_power),col = "red",
     main = "Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.copy(png,"plot1.png")
dev.off()
