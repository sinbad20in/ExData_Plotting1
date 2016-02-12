#Load the data into the table and extract only two days of data
epc <- read.table("household_power_consumption.txt",
                  header = TRUE,sep = ";",na.strings = "?")
epcdata <- subset(epc,as.Date(as.character(epc$Date),"%d/%m/%Y") == "2007-02-01" 
                  | as.Date(as.character(epc$Date),"%d/%m/%Y") == "2007-02-02")

#Get a vector which has both date and time as required in the plot
timedata <- strptime(paste(epcdata$Date,epcdata$Time),"%d/%m/%Y %H:%M:%S")

#Plotting --
png("plot2.png")
plot(timedata,epcdata$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)")

dev.off()