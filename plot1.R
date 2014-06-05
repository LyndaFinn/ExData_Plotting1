# Read Data
#
household_power_consumption <- read.csv("household_power_consumption.txt", sep=";")

# Choose Desire Dates
#
wanted_date=c("1/2/2007", "2/2/2007")
hpc<-household_power_consumption[household_power_consumption$Date %in% wanted_date,]

# Format Date and Convert data to Number
#
hpc$Date<-as.Date(hpc$Date, format="%d/%m/%Y")
hpc$Global_active_power<- as.numeric(as.character(hpc$Global_active_power))

# Make and Save hist as png
#
png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"))
hist(hpc$Global_active_power, col="red",breaks=13,main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()