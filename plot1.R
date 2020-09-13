URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(URL, "./electric_power_consumption.zip")
unzip ("./electric_power_consumption.zip")
data <- read.csv2 ("./household_power_consumption.txt", header = T)
data_sub <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007") ,]

#plot 1
png(file = "plot1.png")
par(mfrow = c(1, 1))
plot1 <- data_sub$Global_active_power
plot1_data <- as.numeric(levels(plot1)[plot1] )
hist(plot1_data, col = "red", main = "Global Active Power", ylab = "Frequency", xlab = "Global Active Power (kilowatts)")
dev.off()