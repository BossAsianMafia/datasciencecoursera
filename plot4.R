rawdata<-read.csv2("household_power_consumption.txt",na.strings="?",dec=".",stringsAsFactors = FALSE) 
## Import data.  Need to set dec as parameter otherwise read.csv won't convert last 7 columns to numeric

chartdata<-subset(rawdata,Date=="1/2/2007"|Date=="2/2/2007")
## subset out the 2 relevant dates

chartdata$Time<-strptime(paste(chartdata$Date,chartdata$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
chartdata$Date<-as.Date(chartdata$Date,"%d/%m/%Y")
## Convert Date and Time into relevant classes

png(file="plot4.png")
## Save file as png

par(mfrow=c(2,2))

## Set up chart panels

plot(chartdata$Time,chartdata$Global_active_power,type="l",xlab="",ylab="Global Active Power")

plot(chartdata$Time,chartdata$Voltage,type="l",xlab="datatime",ylab="Voltage")

plot(chartdata$Time,chartdata$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(chartdata$Time,chartdata$Sub_metering_2,col="red")
lines(chartdata$Time,chartdata$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,bty="n")  

plot(chartdata$Time,chartdata$Global_reactive_power,type="l",xlab="datatime",ylab="Global_reactive_power")  

## Plot charts

dev.off()
