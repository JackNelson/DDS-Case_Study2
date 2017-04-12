# separate two differnt date formats
Temp1 <- TEMP[which(grepl('\\/',Temp$Date) == TRUE), ]
Temp2 <- TEMP[which(grepl('\\-',Temp$Date) == TRUE), ]

# convert each date format into a date type
Temp1$Date2 <- as.Date(Temp1$Date, "%m/%d/%Y")
Temp2$Date2 <- as.Date(Temp2$Date, "%Y-%m-%d")

# union both subsets back together
Temp_clean <- union(Temp1, Temp2)

# remove NA values from Monthly.AverageTemp
Temp_clean <- Temp_clean[!is.na(Temp_clean$Monthly.AverageTemp), ]

# remove old Date variable and rename new one
Temp_clean <- Temp_clean[ ,2:5]
names(Temp_clean)[names(Temp_clean) == 'Date2'] <- 'Date'