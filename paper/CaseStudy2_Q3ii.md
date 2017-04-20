Orange Trees and Land Temperature Data
================
Georges Michel, Jack Nelson, Nicole Shaver, Nathan Tuttle
April 11, 2017

Introduction
------------

In this study, we will examine questions related to

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

Q3ii.a. Using the data from 1900 to 2013 for average land temperatures only in the United States, we can convert the temperatures from degrees C to degrees F using the formula Temp (deg F) = Temp (deg C)\* 1.8 +32.

``` r
#The following code chunk will keep only the data since 1900, subset only the data from the United States, rename the temperature column in the existing dataset to be explicitly in degrees C. It will then add a column with the temperature data converted to degrees C and display the first few rows of the resulting table.


Temp_clean1900 <- Temp_clean[which(Temp_clean$Date >= "1900-01-01"), ]
UStemp<-Temp_clean1900[grep("United States", Temp_clean1900$Country), ]
UStemp<-dplyr::rename(UStemp, Monthly.AverageTemp.degC=Monthly.AverageTemp)
UStemp$Monthly.AverageTemp.degF<-(UStemp$Monthly.AverageTemp.degC*1.8)+32
head(UStemp)
```

    ##        Monthly.AverageTemp.degC Monthly.AverageTemp.Uncertainty
    ## 110207                   -1.702                           0.206
    ## 113557                    8.534                           0.103
    ## 116909                    9.848                           0.201
    ## 117050                   -2.286                           0.154
    ## 117915                   21.690                           0.110
    ## 118266                    2.504                           0.186
    ##              Country       Date Monthly.AverageTemp.degF
    ## 110207 United States 1934-12-01                  28.9364
    ## 113557 United States 2009-10-01                  47.3612
    ## 116909 United States 1933-10-01                  49.7264
    ## 117050 United States 1972-02-01                  27.8852
    ## 117915 United States 2008-07-01                  71.0420
    ## 118266 United States 1986-11-01                  36.5072

Q3ii.b. Calculating the average land temperature by Year and plotting it, we see a general trend up in average land temperatures in the United States between 1900 and 2013.

``` r
#The following code chunk will take the year portion of each month, summarize the temperature data in degrees F by year, and then plot the Temperature data by year.

UStemp$Year<-as.POSIXlt(UStemp$Date)$year+1900
UStempYear<-ddply(UStemp,~Year,summarise,Temp.mean.degF=mean(Monthly.AverageTemp.degF))
ggplot(UStempYear, aes(x = Year, y=Temp.mean.degF))+geom_point()+geom_smooth()+labs(y="Average Land Temp (deg F)")+labs(title = "Average Land Temperature by Year in United States")+geom_line()+scale_x_continuous(breaks=seq(1900,2015,5))+theme(axis.text.x = element_text(size=10, angle=90))+scale_y_continuous(breaks=seq(40,56,1))
```

    ## `geom_smooth()` using method = 'loess'

![](CaseStudy2_Q3ii_files/figure-markdown_github/Q3iib-1.png)

Q3ii.c. Calculating the one year difference of average land temperature by year, we find that the maximum absolute temperature difference is 2.5401 degrees F, and occurred between 1920 and 1921.

``` r
#The code chunk below will first sort the data, by year, in ascending order. Then, it will calculate the 1 year deltas (ie 1991-1990,1992-1991), take the absolute value, and then report the max value and the years and the corresponding 2 years. 
UStempYear_sorta<-arrange(UStempYear,Year)
UStempYear_sorta$UStempYear.delta.degF <- abs(UStempYear_sorta$Temp.mean.degF -lag(UStempYear_sorta$Temp.mean.degF))
UStempYear_sorta$Year_lab<-paste(lag(UStempYear_sorta$Year),"-",UStempYear_sorta$Year)
UStempYear_sorta[which(UStempYear_sorta$UStempYear.delta == max(UStempYear_sorta$UStempYear.delta, na.rm=TRUE)), ]
```

    ##    Year Temp.mean.degF UStempYear.delta.degF    Year_lab
    ## 22 1921        49.2722                2.5401 1920 - 1921

Conclusion
----------
