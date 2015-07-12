plot2 <- function(){
  
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
  fileOut = "C:\\Users\\monicabm\\Documents\\machine_learning_class\\data_science\\results\\plot2.png"
  png(fileOut, width=480, height=480)
  
  #plot
  plot(dataToUse$Global_active_power~dataToUse$DateTime, 
       type="l",
       ylab="Global Active Power (kilowatts)", 
       xlab="") 
  
  #close device
  dev.off()
  
}