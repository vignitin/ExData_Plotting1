# Read data
data <- read.table("household_power_consumption.txt", header = TRUE,sep=";",skip=66636,nrows=2880, stringsAsFactors = FALSE,na.strings="?")
data1 <- read.table("household_power_consumption.txt", header = TRUE, sep=";",nrow=1, stringsAsFactors = FALSE,na.strings="?")
setnames(data, names(data1))
# Format data
dt <- strptime(data$Date,"%d/%m/%Y")
data$Date <- as.Date(format(dt, usetz = FALSE))
data <- within(data, datetime <- as.POSIXct(paste(Date, Time)))
# Build the graph
png(filename="plot2.png", height = 480, width = 480, units = "px", type = "quartz")
with(data, plot(data$datetime,data$Global_active_power, type = "l",xlab="",ylab = "Global Active power (kilowatts)"))
dev.off()