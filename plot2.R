
##Get data for Household power consumption from the text file and save in power_consumption variable
power_consumption <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt", sep=";", header=TRUE)

#Convert Date format
power_consumption$Date <- as.Date(power_consumption$Date, format = "%d/%m/%Y")
#Filter only dates 2007-02-01 to 2007-02-02
power_consumption_feb <- subset(power_consumption, Date >= c(as.Date("2007-02-01")) & Date < c(as.Date("2007-02-03")))

#Combine Date and Time
power_consumption_feb$DateTime <- as.POSIXct(paste(power_consumption_feb$Date, power_consumption_feb$Time), format="%Y-%m-%d %H:%M:%S")

#Open a png file to write the data
png(file = "plot2.png", width = 480, height = 480)
par(mfcol = c(1,1))

#Create plot of the given Global Active Power data with appropriate title and x-axis labels
plot(power_consumption_feb$DateTime, as.numeric(power_consumption_feb$Global_active_power), type="l", ylab = "Global Active Power (kilowatts)", xlab = "", xaxt = "n")
axis(1, at=c(as.numeric(min(power_consumption_feb$DateTime)),as.numeric(median(power_consumption_feb$DateTime)+30),as.numeric(max(power_consumption_feb$DateTime))+60), 
     labels=weekdays(c((min(power_consumption_feb$DateTime)),(median(power_consumption_feb$DateTime)+30),(max(power_consumption_feb$DateTime)+60)), abbreviate=TRUE))

#Close the png file
dev.off()
