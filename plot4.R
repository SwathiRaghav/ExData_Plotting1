
#Getting Whole Data
file1<-unzip("exdata_data_household_power_consumption.zip")
wholedata<-read.table("household_power_consumption.txt", header=TRUE, sep=";")

#Getting subset of the data
data<-wholedata[wholedata$Date %in% c("1/2/2007","2/2/2007"),]

#Converting to dates 
date<-strptime(paste(data$Date,data$Time,sep=" "),"%d/%m/%Y %H:%M:%S")

#Converting to numeric values
Global_active_power<-as.numeric(levels(data$Global_active_power)[data$Global_active_power])
Sub_metering_1<-as.numeric(levels(data$Sub_metering_1)[data$Sub_metering_1])
Sub_metering_2<-as.numeric(levels(data$Sub_metering_2)[data$Sub_metering_2])
Sub_metering_3<-as.numeric(data$Sub_metering_3)
voltage<-as.numeric(levels(data$Voltage)[data$Voltage])
Global_reactive_power<-as.numeric(levels(data$Global_reactive_power)[data$Global_reactive_power])

#Plot
par(mfrow=c(2,2), mar=c(4,4,2,1),oma=c(0,0,2,0))
plot(date,Global_active_power,xlab="",ylab="Global Active Power(Killowatt)",type="l")
plot(date,voltage,xlab="Datetime",ylab="Voltage",type="l")
plot(date,Sub_metering_1,xlab="",ylab="Energy Sub Metering",type="l")
lines(date,Sub_metering_2,col="red")
lines(date,Sub_metering_3,col="blue")
legend("topright",lty=1,cex=0.4,c("sub_metering_1","sub_metering_2","sub_metering_3"),col=c("black","red","blue"))
plot(date,Global_reactive_power,xlab="datetime",ylab="Global_reactive_power", type="l")


#Copying to png file
dev.copy(png,"plot4.png",height=480,width=480)
dev.off()




