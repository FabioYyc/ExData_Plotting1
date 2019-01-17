###use sqldf to subset the data while reading
library(sqldf)
household<-"./household_power_consumption.txt"
myfile<-file(household)
mydata<-sqldf("select * from myfile where Date== '1/2/2007' or Date=='2/2/2007'",
file.format = list(header = TRUE, sep=";", na.string="?"))



###plot the histogram
hist(mydata$Global_active_power, xlab ="global active power(kilowatts)", ylab = "frequency",
main = "Global Active Power", col="red" )
###save the plot as png file
dev.copy(png, file="plot1.png")
dev.off()
