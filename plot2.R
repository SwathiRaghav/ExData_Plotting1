
#Getting Whole Data
file1<-unzip("exdata_data_household_power_consumption.zip")
wholedata<-read.table("household_power_consumption.txt", header=TRUE, sep=";")

#Getting subset of the data
data<-wholedata[wholedata$Date %in% c("1/2/2007","2/2/2007"),]

#Converting to numeric and dates 
Global_active_power<-as.numeric(levels(data$Global_active_power)[data$Global_active_power])
date<-strptime(paste(data$Date,data$Time,sep=" "),"%d/%m/%Y %H:%M:%S")

#plot
plot(date,Global_active_power,xlab="",ylab="Global Active Power(Killowatt)",type="o")

#Copying to png file
dev.copy(png,"plot2.png",height=480,width=480)
dev.off()