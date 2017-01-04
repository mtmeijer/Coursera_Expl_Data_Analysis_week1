##Plot 1

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

#Creating Plot 1
png(filename = "Plot 1.PNG", width = 480, height = 480) #same as default values

hist(data_hhpwr$Global_active_power,
     col = "red",
     ylab = "Frequency",
     xlab = "Global Active Power (kilowats)",
     main =  "Global Active Power"
)
dev.off()




