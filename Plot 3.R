# Plot 3
# Read chart data

chart.data <- read.csv(".\\ExData_Plotting1\\chart.data.csv")

# Ensure correct format of DateTime
chart.data$DateTime <- paste(chart.data$Date, chart.data$Time)
chart.data$DateTime <- as.POSIXct(strptime(chart.data$DateTime, format="%d/%m/%Y %H:%M:%S"))

# Create Plot 3
png(filename = ".\\ExData_Plotting1\\Plot 3.png", width = 480, height = 480)
plot(chart.data$DateTime,chart.data$Sub_metering_1, xlab="", ylab="Energy Sub Metering", type="l")
lines(chart.data$DateTime, chart.data$Sub_metering_2, col = "red")
lines(chart.data$DateTime, chart.data$Sub_metering_3, col = "blue")
legend("topright", legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),col=c('black', 'red', 'blue'), lty = 1)
dev.off()