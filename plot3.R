filepath<-"C:\\Users\\dell\\Downloads\\exdata_data_household_power_consumption.zip"
unzip<-unzip(filepath)
HPC<-read.table(unzip,header = TRUE,sep = ";")
HPC$DateTime <- strptime(paste(HPC$Date, HPC$Time), "%d/%m/%Y %H:%M:%S")
HPC$Date <- as.Date(HPC$Date, format = "%d/%m/%Y")
FebData <- subset(HPC, Date %in% c("2007-02-02", "2007-02-01"))
FebData<-na.omit(FebData)
png(filename = "plot3.png", width = 480, height = 480,units = "px")
plot3Data<-data.frame(x=FebData$DateTime,y1=FebData$Sub_metering_1,y2=FebData$Sub_metering_2,y3=FebData$Sub_metering_3)
matplot(plot3Data$x, plot3Data[, -1], type = 'l', col = c(1,2,4), lty = 1, lwd = 2, xlab = "", ylab = "Energy sub metering")
legend("topright", legend = c("sub_metering_1","sub_metering_2","sub_metering_3"),col = c("black","red","blue"),lty = c(1,1,1),lwd = c(2,2,2))
dev.off()
