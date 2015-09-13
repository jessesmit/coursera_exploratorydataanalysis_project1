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

#Plot 1
png(width=480, height=480, filename = "plot1.png", bg="transparent")
with(hpc, hist(Global_active_power, col="#FF0000", 
               main = "Global Active Power", 
               xlab = "Global Active Power (kilowatts)"))
dev.off()