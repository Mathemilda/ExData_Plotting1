 gc() # cleaning working space
# Downloading Project 1 data as zipped file and unpacking it.
fileurl <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, destfile="household_power_consumption.zip", method="curl", mode = "wb")
unzip("household_power_consumption.zip",  exdir = "./")
# Reading the data and choosing the required subset.
alldata=read.delim("household_power_consumption.txt", sep=";",header=T)
p1data=alldata[alldata$Date=="1/2/2007" | alldata$Date=="2/2/2007",]
# Setting options for the histogram and drawing it.
par(mfcol =  c(1, 1))
 hist(as.numeric(as.character(p1data$Global_active_power)), col="red", 
	xlab="Global active power (kilowatts)", main="Global active power") 
# Coping the histogram picture into the png file.
dev.copy(png, file = "plot1.png", width=480, height=480)
dev.off()