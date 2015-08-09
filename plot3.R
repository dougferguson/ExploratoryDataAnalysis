# cleanup
rm(list=ls())

# get file
path <- "explorato/household_power_consumption.txt"
x <- read.table(path, header=TRUE, sep=";", colClasses="character")

# convert dates
x[,1] <- as.Date(x$Date,"%d/%m/%Y")

# subset between 2007-02-01 and 2007-02-02
sub_x <- subset(x, x$Date %in% as.Date(c("2007-02-01","2007-02-02")))

sub_x$DateTime <- as.POSIXct(paste(sub_x$Date, sub_x$Time), format="%Y-%m-%d %H:%M:%S")

# columns as numeric
sub_x[,3] <- as.numeric(sub_x[,3])
sub_x[,4] <- as.numeric(sub_x[,4])
sub_x[,5] <- as.numeric(sub_x[,5])
sub_x[,6] <- as.numeric(sub_x[,6])
sub_x[,7] <- as.numeric(sub_x[,7])
sub_x[,8] <- as.numeric(sub_x[,8])
sub_x[,9] <- as.numeric(sub_x[,9])

# third plot
plot(sub_x$DateTime, sub_x[,7], type = "l", xlab = " ", ylab = "Energy sub metering")
lines(sub_x[,10], sub_x[,8], col = "Red")
lines(sub_x[,10], sub_x[,9], col = "Blue")
legend(x="topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("Black","Red","Blue"), lwd = 1)

# make PNG
dev.copy(png,file="plot3.png")

dev.off()
