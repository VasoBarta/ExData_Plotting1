dataimport <- read.table("household_power_consumption.txt",header = TRUE, sep = ";",
                     stringsAsFactors = FALSE)
mydata <- subset(dataimport,Date == "1/2/2007" | Date == "2/2/2007")
