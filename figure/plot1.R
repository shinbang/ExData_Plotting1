#import txt file
household_power_consumption <- read.csv("~/R/household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
#get data from the dates 2007-02-01 and 2007-02-02
hpc<-household_power_consumption[with(household_power_consumption, Date=="1/2/2007"|Date=="2/2/2007"),]
#make histogram
hist(as.numeric(hpc$Global_active_power), col = "red", 
     xlab = "Global Active Power (killowatts)",
     main = "Global Active Power")
#save as png file
dev.copy(png, file = "plot1.png")  
dev.off()

