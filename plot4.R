#import txt file
household_power_consumption <- read.csv("~/R/household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
#get data from the dates 2007-02-01 and 2007-02-02
hpc<-household_power_consumption[household_power_consumption$Date=="1/2/2007"|household_power_consumption$Date=="2/2/2007",]
#put time
hpc$Date <- as.Date(hpc$Date, "%d/ %m/ %Y")
hpc$DateTime<-strftime(paste(hpc$Date, hpc$Time), format="%Y-%m-%d  %H:%M:%S")
#save directly to a png file
png(file="plot4.png")
#make histogram
par(mfrow = c(2, 2), mar= c(4,4,2,2))
#1
with(hpc, plot(as.POSIXct(DateTime), as.numeric(Global_active_power), type = "l",
               ylab = "Global Active Power",
               xlab = "목=Thu, 금=Fri, 토=Sat (It's written in Korean)"))
#2
with(hpc, plot(as.POSIXct(DateTime), as.numeric(Voltage), type = "l",
               ylab = "Voltage",
               xlab = "datetime"))
#3
with(hpc, plot(as.POSIXct(DateTime), Sub_metering_1, type = "l",
               xlab ="",
               ylab = "Energy sub metering"))
with(hpc, points(as.POSIXct(DateTime), Sub_metering_2, col= "red" , type = "l"))
with(hpc, points(as.POSIXct(DateTime), Sub_metering_3, col= "blue" , type = "l"))
legend("topright", lty=1, bty="n", col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#4
with(hpc, plot(as.POSIXct(DateTime), as.numeric(Global_reactive_power), type = "l",
               ylab = "Global_reactive_power",
               xlab = "datetime"))
#close png file
dev.off()
