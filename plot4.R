# Read Data
#
household_power_consumption <- read.csv("~/Work/Coursera Data Science Track/Exploratory Data Analysis/household_power_consumption.txt", sep=";")

# Choose Desire Dates
#
wanted_date=c("1/2/2007", "2/2/2007")
hpc<-household_power_consumption[household_power_consumption$Date %in% wanted_date,]

# Make Combined Date Time Column and Convert all plotted data to Numbers
#
hpc$dt <- strptime(paste(hpc$Date,hpc$Time), "%d/%m/%Y %H:%M:%S")
hpc$Global_active_power<- as.numeric(as.character(hpc$Global_active_power))
hpc$Voltage<- as.numeric(as.character(hpc$Voltage))
hpc$Global_reactive_power<- as.numeric(as.character(hpc$Global_reactive_power))
hpc$Sub_metering_1<- as.numeric(as.character(hpc$Sub_metering_1))
hpc$Sub_metering_2<- as.numeric(as.character(hpc$Sub_metering_2))
hpc$Sub_metering_3<- as.numeric(as.character(hpc$Sub_metering_3))

# Make PNG line Plot with three lines
#
png(filename = "plot4.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"))
par(mfrow = c(2, 2))
plot(hpc$dt, hpc$Global_active_power,  type="l",ylab="Global Active Power (kilowatts)", xlab="")
plot(hpc$dt, hpc$Voltage,  type="l",ylab="Voltage", xlab="datetime")
plot(hpc$dt, hpc$Sub_metering_1,  type="l",ylab="Energy Sub Metering", xlab="")
lines(hpc$dt, hpc$Sub_metering_2,col="red")
lines(hpc$dt, hpc$Sub_metering_3,col="blue")
legend("topright", lty = 1, col = c("black", "blue", "red"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(hpc$dt, hpc$Global_reactive_power,  type="l",ylab="Global_reactive_power", xlab="datetime")
dev.off()