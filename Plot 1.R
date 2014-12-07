# Plot 1
# Reading data
file.url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(file.url, "HPCdata.zip")

unzip("HPCdata.zip")
hpcdata <- read.table("household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")

# Create "DateTime" variable and setting it to the POSIXct class
hpcdata$DateTime <- paste(hpcdata$Date, hpcdata$Time)
hpcdata$DateTime <- as.POSIXct(strptime(hpcdata$DateTime, format="%d/%m/%Y %H:%M:%S"))

# Subset the data for the chart
chart.data <- subset(hpcdata, hpcdata$Date == "1/2/2007" | hpcdata$Date == "2/2/2007")

# Save chart.data in .csv format for further use
write.csv(chart.data, file = ".\\ExData_Plotting1\\chart.data.csv")

# Create Plot 1.png
png(filename = ".\\ExData_Plotting1\\Plot 1.png", width = 480, height = 480)

hist(chart.data$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatt)")

dev.off()