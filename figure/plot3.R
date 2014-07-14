#import txt file
household_power_consumption <- read.csv("~/R/household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
#get data from the dates 2007-02-01 and 2007-02-02
hpc<-household_power_consumption[household_power_consumption$Date=="1/2/2007"|household_power_consumption$Date=="2/2/2007",]
#put time
hpc$Date <- as.Date(hpc$Date, "%d/ %m/ %Y")
hpc$DateTime<-strftime(paste(hpc$Date, hpc$Time), format="%Y-%m-%d  %H:%M:%S")
#save directly to a png file
png(file="plot3.png")
#make histogram
with(hpc, plot(as.POSIXct(DateTime), Sub_metering_1, type = "l",
               ylab = "Energy sub metering",
               xlab = "¸ñ=Thu, ±Ý=Fri, Åä=Sat (It's written in Korean)"))
with(hpc, points(as.POSIXct(DateTime), Sub_metering_2, col= "red" , type = "l"))
with(hpc, points(as.POSIXct(DateTime), Sub_metering_3, col= "blue" , type = "l"))
legend("topright", lty=1,  col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#close png file
dev.off()

