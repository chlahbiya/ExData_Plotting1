filepath<-"C:\\Users\\dell\\Downloads\\exdata_data_household_power_consumption.zip"
unzip<-unzip(filepath)
HPC<-read.table(unzip,header = TRUE,sep = ";")
HPC$DateTime <- strptime(paste(HPC$Date, HPC$Time), "%d/%m/%Y %H:%M:%S")
HPC$Date <- as.Date(HPC$Date, format = "%d/%m/%Y")
FebData <- subset(HPC, Date %in% c("2007-02-02", "2007-02-01"))
FebData<-na.omit(FebData)
png(filename = "plot1.png", width = 480, height = 480,units = "px")
hist(FebData$Global_active_power,xlab = "Global Active Power (kilowats)",col = "red",main = "Global Active Power")
dev.off()



