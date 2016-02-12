#Load the data into the table and extract only two days of data

epc <- read.table("household_power_consumption.txt",
                  header = TRUE,sep = ";",na.strings = "?")
epcdata <- subset(epc,as.Date(as.character(epc$Date),"%d/%m/%Y") == "2007-02-01" 
                  | as.Date(as.character(epc$Date),"%d/%m/%Y") == "2007-02-02")

#Get a vector which has both date and time as required in the plot
timedata <- strptime(paste(epcdata$Date,epcdata$Time),"%d/%m/%Y %H:%M:%S")

#Plotting
png("plot4.png")

#Create a 2x2 frame
par(mfrow = c(2,2), mar = c(4,4,2,2))

# Plot 1
plot(timedata,epcdata$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power")

#Plot 2
plot(timedata, epcdata$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

#Plot 3
plot(timedata,epcdata$Sub_metering_1, type = "l", xlab = "", 
     ylab = "Energy Sub metering")
points(timedata,epcdata$Sub_metering_2 , type = "l", col = "red")
points(timedata,epcdata$Sub_metering_3 , type = "l", col = "blue")
legend("topright", lty = 1, col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Plot 4
plot(timedata,epcdata$Global_reactive_power, type = "l", xlab = "datetime", 
     ylab = "Global_reactive_power")

dev.off()