# separate two differnt date formats
CityTemp1 <- CityTemp[which(grepl('\\/',CityTemp$Date) == TRUE), ]
CityTemp2 <- CityTemp[which(grepl('\\-',CityTemp$Date) == TRUE), ]

# convert each date format into a date type
CityTemp1$Date2 <- as.Date(CityTemp1$Date, "%m/%d/%Y")
CityTemp2$Date2 <- as.Date(CityTemp2$Date, "%Y-%m-%d")

# union both subsets back together
CityTemp_clean <- union(CityTemp1, CityTemp2)

# remove NA values from Monthly.AverageTemp
CityTemp_clean <- CityTemp_clean[!is.na(CityTemp_clean$Monthly.AverageTemp), ]

# remove old Date variable and rename new one
CityTemp_clean <- CityTemp_clean[ ,2:8]
names(CityTemp_clean)[names(CityTemp_clean) == 'Date2'] <- 'Date'