#plot1.R
setwd("D:/Self_Development/Coursera - JHU/4. Exploratory Data Analysis")
#read data with proper class definition for each column
data <- read.table("household_power_consumption.txt", header = TRUE,sep=";",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric" ), na.strings = "?")
#subset data into 2 dates
data.1 <- subset(data, Date %in% '1/2/2007')
data.2 <- subset(data, Date %in% '2/2/2007')
data.1n2 <- rbind(data.1,data.2)
datetime <- paste(data.1n2$Date,data.1n2$Time)
datetime_real <- strptime(datetime, "%d/%m/%Y %H:%M:%S")
data.3 <- cbind(datetime_real, data.1n2)

#generate histogram with labelling
hist(data.3$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")

#create png
png(file="plot1.png",width=480,height=480,units="px",bg="transparent")
hist(data.3$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
dev.off()
