#Load the data into the table and extract only two days of data
epc <- read.table("household_power_consumption.txt",
                  header = TRUE,sep = ";",na.strings = "?")
epcdata <- subset(epc,as.Date(as.character(epc$Date),"%d/%m/%Y") == "2007-02-01" 
                  | as.Date(as.character(epc$Date),"%d/%m/%Y") == "2007-02-02")

#Get a vector which has both date and time as required in the plot
timedata <- strptime(paste(epcdata$Date,epcdata$Time),"%d/%m/%Y %H:%M:%S")

#Plotting --
png("plot3.png")
plot(timedata,epcdata$Sub_metering_1, type = "l", xlab = "", 
     ylab = "Energy Sub metering")
points(timedata,epcdata$Sub_metering_2 , type = "l", col = "red")
points(timedata,epcdata$Sub_metering_3 , type = "l", col = "blue")
legend("topright", lty = 1, col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()