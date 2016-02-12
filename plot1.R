
#Load the data into the table and extract only two days of data
epc <- read.table("household_power_consumption.txt",
                  header = TRUE,sep = ";",na.strings = "?")
epcdata <- subset(epc,as.Date(as.character(epc$Date),"%d/%m/%Y") == "2007-02-01" 
                  | as.Date(as.character(epc$Date),"%d/%m/%Y") == "2007-02-02")

#Get the histogram as seen in the assignment
png("plot1.png")
hist(epcdata$Global_active_power,freq = TRUE,col = "red",
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()