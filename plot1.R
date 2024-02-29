
##Get data for Household power consumption from the text file and save in power_consumption variable
power_consumption <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt", sep=";", header=TRUE)

#Convert Date format
power_consumption$Date <- as.Date(power_consumption$Date, format = "%d/%m/%Y")
#Filter only dates 2007-02-01 to 2007-02-02
power_consumption_feb <- subset(power_consumption, Date >= c(as.Date("2007-02-01")) & Date < c(as.Date("2007-02-03")))

#Open a png file to write the data
png(file = "plot1.png", width = 480, height = 480)
par(mfcol = c(1,1))

#Create histogram of the given data with appropriate title and color
hist(as.numeric(power_consumption_feb$Global_active_power), xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")

#Close the png file
dev.off()
