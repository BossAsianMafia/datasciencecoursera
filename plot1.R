rawdata<-read.csv2("household_power_consumption.txt",na.strings="?",dec=".",stringsAsFactors = FALSE) 
## Import data.  Need to set dec as parameter otherwise read.csv won't convert last 7 columns to numeric

chartdata<-subset(rawdata,Date=="1/2/2007"|Date=="2/2/2007")
## subset out the 2 relevant dates

chartdata$Time<-strptime(paste(chartdata$Date,chartdata$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
chartdata$Date<-as.Date(chartdata$Date,"%d/%m/%Y")
## Convert Date and Time into relevant classes

png(file="plot1.png")
## Save file as png

hist(chartdata$Global_active_power,main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)")
## Plot histogram

dev.off()
## Close graphical device