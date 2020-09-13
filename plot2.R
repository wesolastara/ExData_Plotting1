URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(URL, "./electric_power_consumption.zip")
unzip ("./electric_power_consumption.zip")
data <- read.csv2 ("./household_power_consumption.txt", header = T)
data_sub <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007") ,]

plot2_GAP <- data_sub$Global_active_power
plot2_GAP <- as.numeric(levels(plot2_GAP)[plot2_GAP] )
plot2_DATE <- as.Date(data_sub$Date, format = "%d/%m/%Y" )
plot2_TIME <- as.character(data_sub$Time)
plot2_D_T <- as.POSIXct(paste(plot2_DATE, plot2_TIME), format = "%Y-%m-%d %H:%M:%S")
plot2 <- cbind(plot2_D_T, plot2_GAP)
png(file = "plot2.png")
par(mfrow = c(1, 1))
plot(plot2, type = "l", ylab = "Global Active Power (kilowatts)")
dev.off()
