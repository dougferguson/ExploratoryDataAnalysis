# cleanup
rm(list=ls())

# get file
path <- "explorato/household_power_consumption.txt"
x <- read.table(path, header=TRUE, sep=";", colClasses="character")

# convert dates
x[,1] <- as.Date(x$Date,"%d/%m/%Y")
x[,2] <- as.Date(x$Time,"%H/%M/%S")

# subset data between 2007-02-01 and 2007-02-02
sub_x <- subset(x, x$Date %in% as.Date(c("2007-02-01","2007-02-02")))

# columns as numeric
sub_x[,3] <- as.numeric(sub_x[,3])
sub_x[,4] <- as.numeric(sub_x[,4])
sub_x[,5] <- as.numeric(sub_x[,5])
sub_x[,6] <- as.numeric(sub_x[,6])
sub_x[,7] <- as.numeric(sub_x[,7])
sub_x[,8] <- as.numeric(sub_x[,8])
sub_x[,9] <- as.numeric(sub_x[,9])

# first plot 
hist(sub_x[,3], col = "Red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# make PNG
dev.copy(png, file="plot1.png")

dev.off()
