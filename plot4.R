# Course Project 1 - Exploratory Data Analysis
# plot4.R - Multiplot 2x2

# Check file availability
filename <- "./household_power_consumption.txt"
if (!file.exists(filename)) {
    quit (paste("File",filename,"not found"))
}

# Read file
data <- read.table (filename, sep=";", header=TRUE, na.strings="?")

# Select data from the dates 2007-02-01 and 2007-02-02
good <- grep("^[1|2]/2/2007",data$Date)
data <- data[good,]

# Convert date and generate new DaTi column = Date + Time 
data$DaTi <- strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Open file plot4.png as graphics device
png("plot4.png",height=480,width=480)

#Initialize multiplot
par(mfcol=c(2,2))
Sys.setlocale("LC_TIME","English") #Labels in English, not local language

# Plot 1 - evolution of Global Active Power variable
plot(data$DaTi,data$Global_active_power,type="l",
     xlab="",ylab="Global Active Power (kilowatts)")

# Plot 2 - time series of Energy sub metering
plot(data$DaTi,data$Sub_metering_1,col="black",type="l",
     xlab="",ylab="Energy sub metering")
lines(data$DaTi,data$Sub_metering_2,col="red",type="l")
lines(data$DaTi,data$Sub_metering_3,col="blue",type="l")
legend("topright",lty=c(1,1,1),col=c("black","red","blue"),bty="n",
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Plot 3 - Voltage
with(data,plot(DaTi,Voltage,xlab="datetime",type="l"))

# Plot 4 - Global reactive power
with(data,plot(DaTi,Global_reactive_power,xlab="datetime",type="l"))

# Close graphics device
dev.off()