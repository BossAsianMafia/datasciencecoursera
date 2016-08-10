rawdata<-read.csv2("household_power_consumption.txt",na.strings="?",dec=".",stringsAsFactors = FALSE) 
## Import data.  Need to set dec as parameter otherwise read.csv won't convert last 7 columns to numeric

chartdata<-subset(rawdata,Date=="1/2/2007"|Date=="2/2/2007")
## subset out the 2 relevant dates

chartdata$Time<-strptime(paste(chartdata$Date,chartdata$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
chartdata$Date<-as.Date(chartdata$Date,"%d/%m/%Y")
## Convert Date and Time into relevant classes

png(file="plot3.png")
## Save file as png

plot(chartdata$Time,chartdata$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(chartdata$Time,chartdata$Sub_metering_2,col="red")
lines(chartdata$Time,chartdata$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)     

## Plot chart using lines to add lines to existing chart

dev.off()