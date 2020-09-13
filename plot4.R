URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(URL, "./electric_power_consumption.zip")
unzip ("./electric_power_consumption.zip")
data <- read.csv2 ("./household_power_consumption.txt", header = T)
data_sub <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007") ,]
png(file = "plot4.png")
par(mfrow = c(2, 2))

plot4_1_GAP <- data_sub$Global_active_power
plot4_1_GAP <- as.numeric(levels(plot4_1_GAP)[plot4_1_GAP] )
plot4_1_DATE <- as.Date(data_sub$Date, format = "%d/%m/%Y" )
plot4_1_TIME <- as.character(data_sub$Time)
plot4_1_D_T <- as.POSIXct(paste(plot4_1_DATE, plot4_1_TIME), format = "%Y-%m-%d %H:%M:%S")
plot4_1 <- cbind(time=plot4_1_D_T, gap=plot4_1_GAP)
plot4_1 <- as.data.frame(plot4_1)
#
plot(plot4_1, type = "l", ylab = "Global Active Power", xlab = "")

plot4_2_V <- data_sub$Voltage
plot4_2_V <- as.numeric(levels(plot4_2_V)[plot4_2_V])
plot4_2 <- cbind(time=plot4_1_D_T, voltage=plot4_2_V)
#
plot(plot4_2, type = "l", ylab = "Voltage", xlab = "datetime")

plot4_SUB1 <- data_sub$Sub_metering_1
plot4_SUB1 <- as.numeric(levels(plot4_SUB1)[plot4_SUB1])
plot4_SUB2 <- data_sub$Sub_metering_2
plot4_SUB2 <- as.numeric(levels(plot4_SUB2)[plot4_SUB2])
plot4_SUB3 <- data_sub$Sub_metering_3
plot4_SUB3 <- as.numeric(levels(plot4_SUB3)[plot4_SUB3])
plot4_DATE <- as.Date(data_sub$Date, format = "%d/%m/%Y" )
plot4_TIME <- as.character(data_sub$Time)
plot4_D_T <- as.POSIXct(paste(plot4_DATE, plot4_TIME), format = "%Y-%m-%d %H:%M:%S")
plot4_3 <- cbind(timect=plot4_D_T, sub1=plot4_SUB1, sub2=plot4_SUB2, sub3=plot4_SUB3)
plot4_3 <- as.data.frame(plot4_3)
#
plot(plot4_3$timect, plot4_3$sub1, type = "n", ylab = "Energy sub metering", xlab = "")
lines(plot4_3$timect, plot4_3$sub1, type = "l")
lines(plot4_3$timect, plot4_3$sub2, type = "l", col = "red")
lines(plot4_3$timect, plot4_3$sub3, type = "l", col = "blue")
legend("topright", bty = "n",  lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )

plot4_GRP <- data_sub$Global_reactive_power
plot4_GRP <- as.numeric(levels(plot4_GRP))[plot4_GRP]
plot4_4 <- cbind(timect = plot4_D_T, grp = plot4_GRP)
plot4_timelt <-  as.POSIXlt(plot4_D_T, format = "%Y-%m-%d %H:%M:%S", tz = "CET" )
plot(plot4_4, type = "l", ylab = "Global_reactive_power")
dev.off()
