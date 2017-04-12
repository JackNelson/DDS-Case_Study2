Orange Trees and Land Temperature Data
================
Georges Michel, Jack Nelson, Nicole Shaver, Nathan Tuttle
April 11, 2017

Introduction
------------

NEEDS EDIT--In this study, we will examine the Gross Domestic Product (GDP) rankings for countries across the world and analyze the relationship between GDP and income groups. We will order the countries by GDP and evaluate the average GDP ranking for different income groups, visualize the GDP data for all countries by income group, and examine the relationship between income group and GDP. The analysis will utilize GDP and income group from the data-catalog at the world bank web site.

Code used to download, tidy and merge the data
----------------------------------------------

``` r
dir<-getwd()
#download the TEMP temp file and assign it to dataset name TEMPSubset
source(paste(dir,"/source/download_2.R",sep=""))
#cleanup the data-turn the dates from strings to dates
source(paste(dir,"/source/cleanup_2.R",sep=""))
#source(paste(dir,"/source/merge_ED_GDP.R",sep=""))
```

Analysis Results
----------------

Q3ii. After merging the GDP and education datasets by on country code, 189 of the IDs match between the two datasets, as shown in the structure of the dataframe below. The data frame has 189 rows after merging education data and excluding N/A values.

``` r
#SUMMARIZE THE COMMENT IN SENTENCE FORM LATER

#Subset only US Data, call the output table UStemp. Should have 1365 rows
UStemp<-TEMPSubset[grep("United States", TEMPSubset$Country), ]

#Rename the existing temp column include units (degrees C)
UStemp<-dplyr::rename(UStemp, Monthly.AverageTemp.degC=Monthly.AverageTemp)

#Add a new column converting from Celcius to Farenheight
UStemp$Monthly.AverageTemp.degF<-(UStemp$Monthly.AverageTemp.degC*1.8)+32

#Add a column of just year
UStemp$Year <- getYear(UStemp$Date)

#summarize the temperature by year, in degrees F
UStempYear<-ddply(UStemp,~Year,summarise,Temp.mean.degF=mean(Monthly.AverageTemp.degF))

#plot the temperature by year, in degrees F

#calculate the 1 year deltas (ie 1991-1990,1992-1991), take the absolute value, and then report the max value and the years
UStempYear$UStempYear.delta <- abs(UStempYear$Temp.mean.degF -lag(UStempYear$Temp.mean.degF))
UStempYear[which(UStempYear$UStempYear.delta == max(UStempYear$UStempYear.delta, na.rm=TRUE)), ]
```

    ##    Year Temp.mean.degF UStempYear.delta
    ## 22 1921        49.2722           2.5401

Conclusion
----------
