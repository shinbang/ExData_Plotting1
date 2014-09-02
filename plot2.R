#import txt file
household_power_consumption <- read.csv("~/R/household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
#get data from the dates 2007-02-01 and 2007-02-02
hpc<-household_power_consumption[household_power_consumption$Date=="1/2/2007"|household_power_consumption$Date=="2/2/2007",]
#put time
hpc$Date <- as.Date(hpc$Date, "%d/ %m/ %Y")
hpc$DateTime<-strftime(paste(hpc$Date, hpc$Time), format="%Y-%m-%d  %H:%M:%S")
#make histogram
with(hpc, plot(as.POSIXct(DateTime), as.numeric(Global_active_power), type = "l",
     ylab = "Global Active Power (killowatts)",
     xlab = "목=Thu, 금=Fri, 토=Sat (It's written in Korean)"))
#save as png file
dev.copy(png, file = "plot2.png")  
dev.off()

