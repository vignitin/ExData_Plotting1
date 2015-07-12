# Read data
data <- read.table("household_power_consumption.txt", header = TRUE,sep=";",skip=66636,nrows=2880, stringsAsFactors = FALSE,na.strings="?")
data1 <- read.table("household_power_consumption.txt", header = TRUE, sep=";",nrow=1, stringsAsFactors = FALSE,na.strings="?")
setnames(data, names(data1))
# Format data
dt <- strptime(data$Date,"%d/%m/%Y")
data$Date <- as.Date(format(dt, usetz = FALSE))
data <- within(data, datetime <- as.POSIXct(paste(Date, Time)))
# Build the graph
png(filename="plot3.png", height = 480, width = 480, units = "px", type = "quartz")
with(data, plot(data$datetime,data$Sub_metering_1, type = "l",xlab="",ylab = "Energy sub metering"))
points(data$datetime,data$Sub_metering_2, type = "l", col = "Red")
points(data$datetime,data$Sub_metering_3, type = "l", col = "Blue")
legend("topright",col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),pch=NA,  lwd=1, lty=1)
dev.off()