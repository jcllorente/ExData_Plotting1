# Course Project 1 - Exploratory Data Analysis
# plot2.R - Global Active Power time evolution

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

# Open file plot2.png as graphics device
png("plot2.png",height=480,width=480)

# Plot required evolution of Global Active Power variable
Sys.setlocale("LC_TIME","English") #Labels in English, not local language
plot(data$DaTi,data$Global_active_power,type="l",
     xlab="",ylab="Global Active Power (kilowatts)")

# Close graphics device
dev.off()