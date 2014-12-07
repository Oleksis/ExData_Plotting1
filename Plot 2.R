# Plot 2
# Read chart data

chart.data <- read.csv(".\\ExData_Plotting1\\chart.data.csv")

# Ensure correct format of DateTime
chart.data$DateTime <- paste(chart.data$Date, chart.data$Time)
chart.data$DateTime <- as.POSIXct(strptime(chart.data$DateTime, format="%d/%m/%Y %H:%M:%S"))

# Create Plot 2
png(filename = ".\\ExData_Plotting1\\Plot 2.png", width = 480, height = 480)
plot(chart.data$DateTime, chart.data$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l")
dev.off()