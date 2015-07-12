plot4 <- function(){
  
  #read the entire data
  fileIn <- "C:\\Users\\monicabm\\Documents\\machine_learning_class\\data_science\\data\\household_power_consumption.txt"
  tableAll <- read.csv(fileIn, header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
  
  #reformat the date
  tableAll$Date <- as.Date(tableAll$Date , format="%d/%m/%Y")
  
  #subset the data
  dataToUse <- tableAll[tableAll$Date == "2007-02-01" | tableAll$Date == "2007-02-02", ]
  
  #combine date and time
  dateTime <- paste(as.Date(dataToUse$Date), dataToUse$Time)
  dataToUse$DateTime <- as.POSIXct(dateTime)
  
  #set png file for writing
  fileOut = "C:\\Users\\monicabm\\Documents\\machine_learning_class\\data_science\\results\\plot4.png"
  png(fileOut, width=480, height=480)
  
  par(mfrow=c(2,2), mar=c(4, 4, 2, 1))
  
  #plot1 top left
  plot(dataToUse$Global_active_power~dataToUse$DateTime, 
       type="l",
       ylab="Global Active Power (kilowatts)", 
       xlab="") 
  
  #plot2 top right
  plot(dataToUse$Voltage~dataToUse$DateTime, 
       type="l",
       ylab="Voltage", 
       xlab="datetime") 
  
  #plot3 bottom left
  with(dataToUse,{
    plot(Sub_metering_1~DateTime,
         col="black",
         type="l",
         ylab="Energy sub metering", 
         xlab="")
    lines(Sub_metering_2~DateTime,col="red")
    lines(Sub_metering_3~DateTime,col="blue")
  })
  
  legend("topright", 
         col=c("black", "red", "blue"), 
         lty=1, lwd=2,
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         bty="n")
  
  #plot4 bottom right
  lim <- c(0,0.5)
  plot(dataToUse$Global_reactive_power~dataToUse$DateTime, 
       type="l",
       ylab="Global_reactive_power", 
       xlab="datetime",
       ylim=lim) 
  
  #close device
  dev.off()
  
}