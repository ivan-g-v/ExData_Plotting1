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

# Plot in a PNG file
png(file="plot3.png")
        with(data, plot(Time, Sub_metering_1, xlab="", 
                ylab="Energy sub metering", type="n"))
        # Add the three line plots
        lines(data$Time,data$Sub_metering_1, col="black")
        lines(data$Time,data$Sub_metering_2, col="red")
        lines(data$Time,data$Sub_metering_3, col="blue")
        # Add the legend to the plot
        legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"), 
               legend = c("Sub_metering_1", "Sub_metering_2",
               "Sub_metering_3"))
dev.off()
