# Read data
data <- read.table("household_power_consumption.txt", header = TRUE,sep=";",skip=66636,nrows=2880, stringsAsFactors = FALSE,na.strings="?")
data1 <- read.table("household_power_consumption.txt", header = TRUE, sep=";",nrow=1, stringsAsFactors = FALSE,na.strings="?")
setnames(data, names(data1))
# Format data
dt <- strptime(data$Date,"%d/%m/%Y")
data$Date <- as.Date(format(dt, usetz = FALSE))
# Build the graph
png(filename="plot1.png", height = 480, width = 480, units = "px", type = "quartz")
hist(data$Global_active_power, xlab = "Global Active power (kilowatts)", main = "Global Active Power", col = "Red")
dev.off()