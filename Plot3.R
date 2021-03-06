##Plot 3
#Getting the Data

hhpwr <- read.delim(
  "exdata_household_pwr_consumption/household_power_consumption.txt", 
  sep = ";",
  na.strings = "?",
  colClasses = c("character", "character", "numeric", 
                 "numeric", "numeric", "numeric", 
                 "numeric", "numeric", "numeric")
)

#extracting the data from the dates of interest
subset1<-subset(hhpwr, Date == "1/2/2007")
subset2<-subset(hhpwr, Date == "2/2/2007")

#combining the data from the dates of interest
data_hhpwr <- rbind(subset1,subset2)

#re-format the date and time columns from character to date and time vectors
data_hhpwr$Date_Time <- paste(data_hhpwr$Date, data_hhpwr$Time)
data_hhpwr$Date_Time <- strptime(data_hhpwr$Date_Time, format = "%d/%m/%Y %H:%M:%S")


#Open graphics device for PNG
png(filename = "Plot 3.PNG", width = 480, height = 480) #same as default values

#Construct plot 
#(first: plot one variable. Then: include next variables with lines() command)

with(data_hhpwr, 
     plot(y = Sub_metering_1, x = Date_Time,
          type = "l",
          ylab = "Energy sub metering",
          xlab = ""))
with(data_hhpwr, lines(x = Date_Time, y = Sub_metering_2, col = "red"))
with(data_hhpwr, lines(x = Date_Time, y = Sub_metering_3, col = "blue"))
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1,
       col = c("black", "red", "blue"))     

#Close graphics device
dev.off()