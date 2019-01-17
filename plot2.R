library(sqldf)
household<-"./household_power_consumption.txt"
myfile<-file(household)
mydata<-sqldf("select * from myfile where Date== '1/2/2007' or Date=='2/2/2007'",
              file.format = list(header = TRUE, sep=";", na.string="?"))

##transfer the date and time variables to date-time class
DateTime<-strptime(paste(mydata$Date, mydata$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S")

plot(DateTime,mydata$Global_active_power, type = "l", ylab = "Global Active power (kilowatts)")
dev.copy(png, file="plot2.png")
dev.off()