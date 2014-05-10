# Course Project 1 - Exploratory Data Analysis
# plot1.R - Histogram of Global Active Power

# Check file availability
filename <- "./household_power_consumption.txt"
if (!file.exists(filename)) {
    quit (paste("File",filename,"not found"))
}

# Read file
data <- read.table (filename, sep=";", header=TRUE, na.strings="?")

# Convert date and time and generate new Dati = Date + Time column
#data$Date <- as.Date(data$Date, format="%d/%m/%Y")
#data$DaTi <- strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
#data$DaTi <- as.POSIXct(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")
#data$Date <- as.Date(data$Date, format="%Y-%m-%d")

# Select data from the dates 2007-02-01 and 2007-02-02
good <- grep("^[1|2]/2/2007",data$Date)
data <- data[good,]

# Open file plot1.png as graphics device
png("plot1.png",height=480,width=480)

# Plot/build required histogram of Global Active Power variable
hist(data$Global_active_power, main="Global Active Power",
     col="red", xlab="Global Active Power (kilowatts)")

# Close graphics device
dev.off()