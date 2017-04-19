Orange Trees and Land Temperature Data
================
Georges Michel, Jack Nelson, Nicole Shaver, Nathan Tuttle
April 13, 2017

#### Code used to download and tidy data

``` r
dir<-getwd()
#download the TEMP temp file and assign it to dataset name Temp_clean
source(paste(dir,"/source/download_2.R",sep=""))
#cleanup the data-turn the dates from strings to dates
source(paste(dir,"/source/CityTemp_cleanup.R",sep=""))
```

### 3iii. Download “CityTemp” data set at box.com. Find the difference between the maximum and the minimum temperatures for each major city and report/visualize top 20 cities with maximum differences for the period since 1900.

#### The following code chunk takes the CityTemp\_clean data frame and returns T20MinMaxCityTemp, the top 20 cities with the greatest temperature difference between their minimum and maximum Monthly.AvgTemp observations since 1/1/1900.

##### The variables contained in T20MinMaxCityTemp are as follows:

-   City
-   Min.Monthly.AvgTemp
-   Country
-   Latitude
-   Min.Date
-   Max.Monthly.AvgTemp
-   Max.Date
-   TempDiff

##### The steps taken to obtain T20MinMaxCityTemp are as follows:

-   Subset CityTemp\_clean to take only observations since 1/1/1900
-   Aggregate CityTemp\_clean1900 to receive minimum Monthly.AverageTemp
-   Merge the minimum Monthly.AverageTemp value back with its CityTemp\_clean1900 observation
-   Repeat the previous two steps for maximum Monthly.AverageTemp
-   Merge minimum and maximum subsets into single data frame
-   Take only needed vectors for T20MinMaxCityTemp and rename vectors
-   Calculate TempDiff
-   Reorder data frame in descending order by TempDiff
-   Subset to take only first 20 observations

``` r
# taking observations since 1900
CityTemp_clean1900 <- CityTemp_clean[which(CityTemp_clean$Date >= "1900-01-01"), ]

# arrgregate to receive min Monthly.AverageTemp by City
CityTemp.agg.min <- aggregate(Monthly.AverageTemp ~ City, CityTemp_clean1900, min)
# merge back with original CityTemp.agg.min dataframe to receive date of min observation
CityTemp.agg.min2 <- merge(CityTemp.agg.min, CityTemp_clean1900, by = c('City', 'Monthly.AverageTemp'))

# arrgregate to receive max Monthly.AverageTemp by City
CityTemp.agg.max <- aggregate(Monthly.AverageTemp ~ City, CityTemp_clean1900, max)
# merge back with original Temp.agg.max dataframe to receive date of max observation
CityTemp.agg.max2 <- merge(CityTemp.agg.max, CityTemp_clean1900, by = c('City', 'Monthly.AverageTemp'))

# merge both Temp.agg.min2 and Temp.agg.max2 together
MinMaxCityTemp <- merge(CityTemp.agg.min2, CityTemp.agg.max2, by = 'City')

# remove unneeded variables and rename remaining variables in MinMaxTemp
MinMaxCityTemp <- MinMaxCityTemp[, c(1,2,4,5,7,8,13)]
names(MinMaxCityTemp) <- c('City', 'Min.Monthly.AvgTemp', 'Country', 'Latitude', 
                       'Min.Date', 'Max.Monthly.AvgTemp', 'Max.Date')

# generate difference between the max and min Monthly.AvgTemp for each observation
MinMaxCityTemp$TempDiff <- MinMaxCityTemp$Max.Monthly.AvgTemp - MinMaxCityTemp$Min.Monthly.AvgTemp

# order dataframe in descending order by TempDiff
MinMaxCityTemp <- MinMaxCityTemp[order(-MinMaxCityTemp$TempDiff), ]

# take the top 20 countries with the highest TempDiff
T20MinMaxCityTemp <- MinMaxCityTemp[1:20, ]
```

#### The following code chunk takes the T20MinMaxCityTemp data frame and returns T20MinMaxCityTempLong, the long format of T20MinMaxCityTemp needed for plotting.

##### The variables contained in T20MinMaxCityTempLong are as follows:

-   City
-   Country
-   Latitude
-   Date
-   TempDiff
-   Min.Max
-   Monthly.AvgTemp

##### The steps taken to obtain T20MinMaxCityTempLong are as follows:

-   Converting Monthly.AvgTemp into long format for only minimum values
-   Taking only the first 3 characters needed for the Min.Max indicator variable
-   Repeat the previous two steps for maximum Monthly.AvgTemp values
-   Renaming Min.Date and Max.Date in subsets to a common variable name Date
-   Unioning both subsets together to get one long formatted data frame
-   Reorder T20MinMaxCityTempLong to group values by City ranked by Date
-   Transform City order to be ranked by TempDiff for plotting

``` r
# putting minimum metrics in long format from T20MinMaxCityTemp
T20MinMaxCityTemp1 <- melt(T20MinMaxCityTemp[, c(1:5,8)], id = 
                           c("City", "Country", "Latitude", "Min.Date", "TempDiff"), 
                           variable.name = "Min.Max", value.name = 'Monthly.AvgTemp')
# taking only first 3 character to indicate min observation
T20MinMaxCityTemp1$Min.Max <- substr(T20MinMaxCityTemp1$Min.Max, 0, 3)

# putting maximum metrics in long format from T20MinMaxCityTemp
T20MinMaxCityTemp2 <- melt(T20MinMaxCityTemp[, c(1,3,4,6:8)], id = 
                           c("City", "Country", "Latitude", "Max.Date", "TempDiff"), 
                           variable.name = "Min.Max", value.name = 'Monthly.AvgTemp')
# taking only first 3 characters to indicate max observation
T20MinMaxCityTemp2$Min.Max <- substr(T20MinMaxCityTemp2$Min.Max, 0, 3)

# renaming date variable in both subsets to match eachother
names(T20MinMaxCityTemp1)[names(T20MinMaxCityTemp1) == 'Min.Date'] <- 'Date'
names(T20MinMaxCityTemp2)[names(T20MinMaxCityTemp2) == 'Max.Date'] <- 'Date'

# union 2 subsets together for one long formatted T20MinMaxCityTemp dataframe
T20MinMaxCityTempLong <- union(T20MinMaxCityTemp1, T20MinMaxCityTemp2)

# reorder to group by City and put two dates in order for plotting
T20MinMaxCityTempLong <- T20MinMaxCityTempLong[order(-T20MinMaxCityTempLong$TempDiff,
                                               T20MinMaxCityTempLong$Date), ]

# reorder City in descending order according to TempDiff
T20MinMaxCityTempLong <- transform(T20MinMaxCityTempLong, City=reorder(City, -TempDiff) )
```

#### The following code chunk plots the T20MinMaxCityTemp data frame with City in the x axis ranked by TempDiff and Monthly.AvgTemp in the y axis. The Min and Max values are plotting with labels indicating the year the observation occurred. An arrow then indicates which observation occurred first (Min prior to Max = Up; Max prior to Min = Down)

``` r
ggplot(T20MinMaxCityTempLong, aes(x=City, y=Monthly.AvgTemp, 
                               group=City, factor(TempDiff))) + 
  geom_point(size=2)+geom_path(arrow=arrow()) +
  labs(y = 'Monthly Average Temperature (Celcius)',
       title = 'Minimum & Maximum Monthly Average Temperature by City (Since 1900)') +
  theme(axis.text.x = element_text(angle = -90, hjust = 0, vjust = 0.5),
        plot.title = element_text(size=10, face='bold', hjust=0.5)) + 
  geom_text(data = filter_(T20MinMaxCityTempLong, ~Min.Max == 'Min'), 
            aes(label=format(Date,'%Y'), hjust=0.5, vjust=1.5), size = 3) +
  geom_text(data = filter_(T20MinMaxCityTempLong, ~Min.Max == 'Max'), 
            aes(label=format(Date,'%Y'), hjust=0.5, vjust=-0.5), size =3)
```

![](CaseStudy2_Q3iii_files/figure-markdown_github/T20plot-1.png)

#### The following code chunk plots the T20MinMaxCityTemp data frame with Year in the x axis and Monthly.AvgTemp in the y axis. The Min and Max Monthly.AvgTemp values are plotted by color.

``` r
ggplot(T20MinMaxCityTempLong, aes(x=Date, y=Monthly.AvgTemp, color=Min.Max)) + 
  geom_point(size=2) +
  labs(x = 'Year', y = 'Monthly Avgerage Temperature (Celcius)', 
       title = 'Minimum & Maximum Monthly Average Temperature vs. Year (Since 1900)',
       color = "") +
  theme(plot.title = element_text(size=12, face='bold', hjust=0.5))
```

![](CaseStudy2_Q3iii_files/figure-markdown_github/T20scatterplot-1.png)

### 3iv. Compare the two graphs in (i) and (iii) and comment it.

#### The initial plots with arrows indicating if the minimum or maximum Monthly.AvgTemp occurred first shows commonalities between the top 20 countries and 20 cities with the highest TempDiff since 1/1/1900. 18 out of 20 countries and 15 out of 20 cities have their maximum Monthly.AvgTemp occurring later than the minimum Monthly.AvgTemp. The scatter plot showing minimum and maximum Monthly.AvgTemp by year is even more telling. There is appears to be a grouping for maximum values between 1980-present (18 out of 20 countries, 16 out of 20 cities). Without the use of advanced statistics and only using the visual graphics, it appears Monthly.AvgTemp for the top 20 countries and cities with the highest TempDiff since 1/1/1900 has been rising in the last 40 years.
