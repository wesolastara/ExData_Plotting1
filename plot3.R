URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(URL, "./electric_power_consumption.zip")
unzip ("./electric_power_consumption.zip")
data <- read.csv2 ("./household_power_consumption.txt", header = T)
data_sub <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007") ,]

plot3_SUB1 <- data_sub$Sub_metering_1
plot3_SUB1 <- as.numeric(levels(plot3_SUB1)[plot3_SUB1])

plot3_SUB2 <- data_sub$Sub_metering_2
plot3_SUB2 <- as.numeric(levels(plot3_SUB2)[plot3_SUB2])

plot3_SUB3 <- data_sub$Sub_metering_3
plot3_SUB3 <- as.numeric(levels(plot3_SUB3)[plot3_SUB3])

plot3_DATE <- as.Date(data_sub$Date, format = "%d/%m/%Y" )
plot3_TIME <- as.character(data_sub$Time)
plot3_D_T <- as.POSIXct(paste(plot3_DATE, plot3_TIME), format = "%Y-%m-%d %H:%M:%S")

plot3 <- cbind(timect=plot3_D_T, sub1=plot3_SUB1, sub2=plot3_SUB2, sub3=plot3_SUB3)
plot3 <- as.data.frame(plot3)

png(file = "plot3.png")
par(mfrow = c(1, 1))
plot(plot3$timect, plot3$sub1, type = "n", ylab = "Energy sub metering", xlab = "")
lines(plot3$timect, plot3$sub1, type = "l")
lines(plot3$timect, plot3$sub2, type = "l", col = "red")
lines(plot3$timect, plot3$sub3, type = "l", col = "blue")
legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )
dev.off()


rm(list = ls())
