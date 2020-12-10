
#read database

pd <- read.csv("C:/Users/Famil/OneDrive/COURSERA COURSES/Exploratory Data Analysis/household_power_consumption.txt", sep=";")

View(pd)

# subset using data from the dates 2007-02-01 and 2007-02-02.
pd2 = subset(pd, pd$Date == "1/2/2007" | pd$Date == "2/2/2007")

#Class 

pd2$Global_active_power <- as.numeric(as.character(pd2$Global_active_power))
pd2$Global_reactive_power <- as.numeric(as.character(pd2$Global_reactive_power))

pd2$Voltage <- as.numeric(as.character(pd2$Voltage))

pd2$Date3 <- as.character(pd2$Date)
pd2$Time3<- as.character(pd2$Time)
pd2$datetime <- strptime(paste(pd2$Date3, pd2$Time3), "%d/%m/%Y %H:%M:%S")

pd2$Sub_metering_1 <- as.numeric(as.character(pd2$Sub_metering_1))
pd2$Sub_metering_2 <- as.numeric(as.character(pd2$Sub_metering_2))

View(pd2)

#plot1
png(file = "Plot1.png", width = 480, height = 480, units = "px")
hist(pd2$Global_active_power,
     main = 'Global Active Power',
     xlab = 'Global Active power (kilowatts)',
     ylab = 'Frequency',
     ylim = range(0,1200),
     col = 'red')  
dev.off()