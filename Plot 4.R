# Plot 4
# Read chart data

chart.data <- read.csv(".\\ExData_Plotting1\\chart.data.csv")

# Ensure correct format of DateTime
chart.data$DateTime <- paste(chart.data$Date, chart.data$Time)
chart.data$DateTime <- as.POSIXct(strptime(chart.data$DateTime, format="%d/%m/%Y %H:%M:%S"))

# Create Plot 4
png(filename = ".\\ExData_Plotting1\\Plot 4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
# Plot (1, 1)
plot(chart.data$DateTime, chart.data$Global_active_power, xlab="", ylab="Global Active Power", type="l")

# Plot (1, 2)
plot(chart.data$DateTime, chart.data$Voltage, xlab = "datetime", ylab="Voltage", type="l")

# Plot (2, 1)
plot(chart.data$DateTime,chart.data$Sub_metering_1, xlab="", ylab="Energy Sub Metering", type="l")
lines(chart.data$DateTime, chart.data$Sub_metering_2, col = "red")
lines(chart.data$DateTime, chart.data$Sub_metering_3, col = "blue")
legend("topright", cex = 0.7, bty = "n", legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),col=c('black', 'red', 'blue'), lty = 1)

# Plot (2, 2)
plot(chart.data$DateTime, chart.data$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")
dev.off()