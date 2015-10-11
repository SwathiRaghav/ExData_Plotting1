

#Getting Whole Data
file1<-unzip("exdata_data_household_power_consumption.zip")
wholedata<-read.table("household_power_consumption.txt", header=TRUE, sep=";")

#Getting subset of the data
data<-wholedata[wholedata$Date %in% c("1/2/2007","2/2/2007"),]

#Converting Global_active_power to numeric
Global_active_power<-as.numeric(levels(data$Global_active_power)[data$Global_active_power])

#Histogram plot
hist(Global_active_power,col="red",main="Global Active Power",xlab="Global Active Powers(Killowatts)")


#Copying to png file
dev.copy(png,"plot1.png",height=480, width=480)
dev.off()
