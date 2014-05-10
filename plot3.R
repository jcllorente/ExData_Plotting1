# Course Project 1 - Exploratory Data Analysis
# plot3.R - Energy sub metering time series

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

# Open file plot3.png as graphics device
png("plot3.png",height=480,width=480)

# Plot time series of Energy sub metering
Sys.setlocale("LC_TIME","English") #Labels in English, not local language
plot(data$DaTi,data$Sub_metering_1,col="black",type="l",
     xlab="",ylab="Energy sub metering")
lines(data$DaTi,data$Sub_metering_2,col="red",type="l")
lines(data$DaTi,data$Sub_metering_3,col="blue",type="l")
legend("topright",lty=c(1,1,1),col=c("black","red","blue"),
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Close graphics device
dev.off()