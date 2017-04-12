#keep only the date rows containg a "/" at these are after
TEMPSubset<-TEMP[grep("/", TEMP$Date), ]

#change the date column into real dates
TEMPSubset$Date <- as.Date(TEMPSubset$Date, "%m/%d/%Y")
