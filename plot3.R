#Getting Whole Data
file1<-unzip("exdata_data_household_power_consumption.zip")
wholedata<-read.table("household_power_consumption.txt", header=TRUE, sep=";")

#Getting subset of the data
data<-wholedata[wholedata$Date %in% c("1/2/2007","2/2/2007"),]

#Converting to dates 
date<-strptime(paste(data$Date,data$Time,sep=" "),"%d/%m/%Y %H:%M:%S")


#Converting to numeric
Sub_metering_1<-as.numeric(levels(data$Sub_metering_1)[data$Sub_metering_1])
Sub_metering_2<-as.numeric(levels(data$Sub_metering_2)[data$Sub_metering_2])
Sub_metering_3<-as.numeric(data$Sub_metering_3)

#Plot
plot(date,Sub_metering_1,xlab="",ylab="Energy Sub Metering",type="o")
lines(date,Sub_metering_2,col="red")
lines(date,Sub_metering_3,col="blue")
legend("topright",lty=1,c("sub_metering_1","sub_metering_2","sub_metering_3"),col=c("black","red","blue"))


#Copying to png file
dev.copy(png,"plot3.png",height=480,width=480)
dev.off()
