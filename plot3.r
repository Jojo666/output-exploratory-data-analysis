x=read.table("household_power_consumption.txt",header=T,sep=";",na.strings="?")
attach(x)
head(x)

x$Date <- as.Date(x$Date, format="%d/%m/%Y")
df <- subset(x, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

datetime <- paste(as.Date(x$Date), x$Time)
x$Datetime <- as.POSIXct(datetime)


png("plot3.png",width=480,height=480)
with(x, {
    plot(Sub_metering_1~Datetime, type="l",
         ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
