x=read.table("household_power_consumption.txt",header=T,sep=";",na.strings="?")
attach(x)
head(x)

x$Date <- as.Date(x$Date, format="%d/%m/%Y")
df <- subset(x, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

png("plot1.png",width=480,height=480)

hist(Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

dev.off()