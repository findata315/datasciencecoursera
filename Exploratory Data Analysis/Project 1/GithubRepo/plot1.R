#Before plotting, we need to read in data, combine column Date and Time into one, and convert it into date object

##Set working directory to the folder under which the unzipped data is stored
initial <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, nrows = 100)
##Use first 100 rows to figure out the classes of each column for faster read in of the whole data set
classes <- sapply(initial, class)
##Looking at raw data in a text editor, we know data between date 2007-02-01 and 2007-02-02 are stored between line 66637 and 69516 (excluding header)
power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", skip = 66636, nrows = 2880, colClasses = classes, na.strings = "?")
names(power) <- names(initial)
##Combine column Date and Time into one, and convert them into date object
power_com <- data.frame(paste(power$Date, power$Time, sep = " "), power[, 3:9])
names(power_com)[1] <- "DateTime"
power_com$DateTime <- strptime(power_com$DateTime, "%d/%m/%Y %H:%M:%S")

#Now we can start to plot 1
hist(power_com$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.copy(png, file = "plot1.png")
dev.off()