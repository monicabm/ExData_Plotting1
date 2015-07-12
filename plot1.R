plot1 <- function(){
  
  #read the entire data
  fileIn <- "C:\\Users\\monicabm\\Documents\\machine_learning_class\\data_science\\data\\household_power_consumption.txt"
  tableAll <- read.csv(fileIn, header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
  
  #reformat the date
  tableAll$Date <- as.Date(tableAll$Date , format="%d/%m/%Y")
  
  #subset the data
  dataToUse <- tableAll[tableAll$Date == "2007-02-01" | tableAll$Date == "2007-02-02", ]
  
  #set png file for writing
  fileOut = "C:\\Users\\monicabm\\Documents\\machine_learning_class\\data_science\\results\\plot1.png"
  png(fileOut, width=480, height=480)
  
  #plot
  lim <- c(0,1200)
  hist(dataToUse$Global_active_power,main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)", ylim=lim)
  
  #close device
  dev.off()
}