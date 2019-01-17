##load sqldf package to subset the data while reading
library(sqldf)

household<-"./household_power_consumption.txt"
myfile<-file(household)
mydata<-sqldf("select * from myfile where Date== '1/2/2007' or Date=='2/2/2007'",
              file.format = list(header = TRUE, sep=";", na.string="?"))

##transfer the date and time variables to date-time class
DateTime<-strptime(paste(mydata$Date, mydata$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2))
plot(DateTime,mydata$Global_active_power, type = "l", ylab = "Global Active power (kilowatts)", xlab = "")
with(mydata,plot(DateTime,Voltage, type = "l"))
with(mydata,plot(x=DateTime, y=Sub_metering_1, type = "l", ylab = "Energy Sub Metering"))
lines(x=DateTime, y=mydata$Sub_metering_2, col="red")
lines(x=DateTime,y=mydata$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd=0.25, col=c("black", "red", "blue"),cex = 0.6)
with(mydata, plot(DateTime,Global_reactive_power, type = "l"))

dev.copy(png, "plot4.png")
dev.off()