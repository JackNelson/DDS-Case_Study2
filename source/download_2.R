
#assign the two files to dataframes-replace blanks with NA
TEMP<-read.csv("data/TEMP.csv",stringsAsFactors=FALSE, header=TRUE)

# reading in CityTemp.csv to a dataframe
CityTemp<-read.csv("data/CityTemp.csv",stringsAsFactors=FALSE, header=TRUE)
