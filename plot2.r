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
# Constructing the plot.
par(mfcol =  c(1, 1))
with( p1data,  plot(datetime, Global_active_power, xlab =" ", 
	ylab="Global active power (kilowatts)", type="l", main=NULL))
# Coping the plot picture into the png file.
dev.copy(png, file = "plot1.png", width=480, height=480)
dev.off()