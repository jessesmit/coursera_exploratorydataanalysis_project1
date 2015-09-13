hpc<-read.csv("household_power_consumption.txt", sep=";", skip = 66637, nrows = 2880)
colnames(hpc) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
hpc<- hpc[hpc$Global_active_power != "?" &
            hpc$Global_reactive_power != "?" &
            hpc$Voltage != "?" &
            hpc$Global_intensity != "?" &
            hpc$Sub_metering_1 != "?" &
            hpc$Sub_metering_2 != "?" &
            hpc$Sub_metering_3 != "?",]
hpc$DateTime <- paste(hpc$Date, hpc$Time)
hpc$DateTime <- strptime(hpc$DateTime, "%d/%m/%Y %H:%M:%S")
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")
hpc$Time <- strptime(hpc$Time, format = "%H:%M:%S")

#Plot 4
png(width=480, height=480, filename = "plot4.png", bg="transparent")
par(mfrow=c(2,2))
plot(hpc$DateTime, hpc$Global_active_power, type="l", 
     col="black", xlab="", ylab="Global Active Power")
plot(hpc$DateTime, hpc$Voltage, type="l", 
     col="black", xlab="datetime", ylab="Voltage")
plot(hpc$DateTime, hpc$Sub_metering_1, type="l", col="black",
     xlab="", ylab="Energy sub metering")
lines(hpc$DateTime, hpc$Sub_metering_2, type="l", col="red")
lines(hpc$DateTime, hpc$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lwd=1, col=c("black", "red", "blue"))
plot(hpc$DateTime, hpc$Global_reactive_power, type="l", 
     col="black", xlab="datetime", ylab="Global_reactive_power")
dev.off()
