## In this file I plot the first figure of the first proyect

# First I read all the file. The two first rows are character and the other
# are numbers
data <- read.table("household_power_consumption.txt",sep=";", nrows=2075259,
                   header = TRUE,na.strings = "?",
                   colClasses=c("character","character",rep("numeric",7)))
# Convert the character Date column in date column
data$Date <- as.Date(data$Date, "%d/%m/%Y")
# choose the data that I use in the plot
data <- subset(data,Date=="2007-02-01" | Date=="2007-02-02" )
# convert the Time column in time with the date
data$Time <- strptime(paste(data$Date,data$Time),"%Y-%m-%d %H:%M:%S")

# Plot the histogram in a PNG file
png(file="plot1.png")
        hist(data$Global_active_power,main = "Global Active Power",col="red",
             xlab="Global Active Power (kilowatts)")
dev.off()
