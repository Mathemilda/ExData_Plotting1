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
# changing options for 2 columns and 2 rows of plots.
par(mfcol =  c(2, 2))
# Constructing the plots.
with( p1data,   {
   plot(datetime, Global_active_power, xlab =" ", 
	ylab="Global active power (kilowatts)", type="l", main=NULL)
   plot(datetime, Sub_metering_1, type="l",  
        ylab="Energy sub metering", xlab=" ", main=NULL)
       lines(datetime, Sub_metering_2,col="red")
       lines(datetime, Sub_metering_3,col="blue")
legend("topright", 
           legend = c("Sub_metering_1", 
                      "Sub_metering_2", 
                      "Sub_metering_3"), 
           col = c("black", "red", "blue"), 
           lwd = .75, cex = .75, bty = "n"
           )
   plot(datetime, Voltage, xlab ="datetime", 
	ylab="Voltage", type="l", main=NULL)
   plot(datetime, Global_reactive_power, xlab ="datetime", 
	ylab="Global_reactive_power", type="l", main=NULL)
   })
# Coping the plot pictures into the png file.
dev.copy(png, file = "plot4.png", width     = 480, height    = 480,
                      units     = "px",type="cairo-png")
dev.off()
