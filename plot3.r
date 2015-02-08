 gc() # cleaning working space
# Downloading Project 1 data as zipped file and unpacking it.
fileurl <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, destfile="household_power_consumption.zip", method="curl", mode = "wb")
unzip("household_power_consumption.zip",  exdir = "./")
# Reading the data and choosing the required subset.
alldata<- read.table("./data/household_power_consumption.txt", header = T,  sep=";",
   comment.char="%", stringsAsFactors=FALSE, na.strings="?")
p1data=alldata[alldata$Date=="1/2/2007" | alldata$Date=="2/2/2007",]
 # Creating date & time column
p1data$datetime <- strptime( paste (p1data$Date, p1data$Time), "%d/%m/%Y %H:%M:%S")
# Converting our data into data frame
p1data=data.frame(p1data)
# Constructing the plot and adding its legend.
with(p1data, plot(datetime, Sub_metering_1, type="l",  main=NULL))
   lines(p1data$datetime, as.numeric(as.character(p1data$Sub_metering_2)),col="red")
   lines(p1data$datetime, as.numeric(as.character(p1data$Sub_metering_3)),col="blue")
   legend("topright",  legend = names(p1data[,7:9]), 
           col = c("black", "red", "blue"), 
          lwd = 1, cex =1.1
           )
# Coping the plot picture into the png file.
dev.copy(png, file = "plot3.png", width=480, height=480, units= "px",type="cairo-png")
dev.off()
