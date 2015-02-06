x=read.table("household_power_consumption.txt",header=T,sep=";",na.strings="?")
attach(x)
head(x)

x$Date <- as.Date(x$Date, format="%d/%m/%Y")
df <- subset(x, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

datetime <- paste(as.Date(x$Date), x$Time)
x$Datetime <- as.POSIXct(datetime)


png("plot2.png",width=480,height=480)
plot(x$Global_active_power~x$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.off()