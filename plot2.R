# Read Data
#
household_power_consumption <- read.csv("~/Work/Coursera Data Science Track/Exploratory Data Analysis/household_power_consumption.txt", sep=";")

# Choose Desire Dates
#
wanted_date=c("1/2/2007", "2/2/2007")
hpc<-household_power_consumption[household_power_consumption$Date %in% wanted_date,]

# Make Combined Date Time Column and Convert data to Number
#
hpc$dt <- strptime(paste(hpc$Date,hpc$Time), "%d/%m/%Y %H:%M:%S")
hpc$Global_active_power<- as.numeric(as.character(hpc$Global_active_power))

# Make PNG Line Plot
#
png(filename = "plot2.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"))
plot(hpc$dt, hpc$Global_active_power,  type="l",ylab="Global Active Power (kilowatts)", xlab="")
dev.off()

