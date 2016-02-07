# Plot 2.R

# Read Power Data - semicolon delimited and "?" representing missing values
data <- read.csv("household_power_consumption.txt", na.string="?", sep=";")

# Subsetting the 2 days we need from the full dataset
data <- data[(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]

# Combine Date and Time
data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "), 
                          format="%d/%m/%Y %H:%M:%S")

# Open png graphic device
png("plot2.png", width=480, height=480)

# Plot the graph
plot(data$DateTime, data$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power (kilowatts)")

# Turn off png graphic device
dev.off()