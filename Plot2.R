##Plot 2
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
png(filename = "Plot 2.PNG", width = 480, height = 480) #same as default values

#Construct plot

with(data_hhpwr, 
     plot(y = Global_active_power, x = Date_Time,
          type = "l",
          ylab = "Global Active Power (kilowatts)",
          xlab = ""
     ))

#Close graphics device
dev.off()