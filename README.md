# TITLE

Orange Trees and Land Temperature Data

Contributors: Georges Michel, Jack Nelson, Nicole Shaver, Nathan Tuttle

# PURPOSE OF PROJECT
Examine Orange tree growth against age. And temperature comparisons in city and country...

# COPYRIGHT INFO

This project was generated for Southern Methodist University course MSDS 6306
Doing Data Science: An Introduction to Data Science to complete Case Study 1

*Datasets sources*

Orange: Built in R data set

CityTemp: Provided by instructor

# FILE ORGANIZATION

____ <- signifies a folder (i.e. data <- = data folder)

"|" separates multiple files in the same folder (i.e. file1 | file2) 

The original file structure is as follows:

  + ReadME.md

  + Makefile.txt

  + data <- CityTemp.csv | TEMP.csv

  + paper <- CaseStudy2.Rmd | Case Study 2.docx

  + source <- CityTemp_cleanup.R | cleanup_2.R | download_2.R

*After running the Makefile in the command line...*

The file structure should be as follows:

  + ReadME.md
  
  + Makefile.txt
  
  + data <- CityTemp.csv | TEMP.csv
  
  + paper <- CaseStudy2.Rmd | Case Study 2.docx
             
    + CaseStudy2_files 
  
  + source <- CityTemp_cleanup.R | cleanup_2.R | download_2.R

# FILE INFO

README.md

  + md file containing the details of the project and how to reproduce it

 Makefile.txt
 
  + Builds Case Study 2 markdown
	
Orange

  + Data for Orange trees

TEMP.csv
  
  + Data for country trees

CityTemp.csv

  + Data for city trees

CaseStudy2_Q3i.Rmd

  + Question 1 R markdown file that generates the analysis and conclusion for the case study

CaseStudy2_Q3ii.Rmd

  + Question 2 + R markdown file that generates the analysis and conclusion for the case study

CityTemp_cleanup.R  

  + R code file that cleans the City Temp data
  
cleanup_2.R  
  
  + R code file that downloads the GDP.csv and EDDATA.csv from the internet

download_2.R

  + R code file that downloads the GDP.csv and EDDATA.csv from the internet
  
# DATA INFO

*TEMP.csv*

_Variables used for study:_

Date

  + Date in Year-Month-Day or Month/Day/Year format (char)
MonthlyAverageTemp

  + The monthly average land temperature, in degrees Celsius(num)
Country

  + The name of the country (char)

_Unused variables:_

MonthlyAverageTempUncertainty

  + Uncertainty in monthly average land temperature, in degrees Celsius (num)

*CityTemp.csv*

_Variables used for study and their description:_

Date

  + Date in Year-Month-Day or Month/Day/Year format (char)
MonthlyAverageTemp

  + The monthly average land temperature, in degrees Celsius(num)

City

  + The name of the city (char)

Country

  + The name of the country (char)


*Orange*

_Variables used for study:_

_Unused variables:_

Tree
  
  + Type of tree

age

  + Age of tree days since 1968/12/31
  
circumference

  + Circumference of tree in mm

MonthlyAverageTempUncertainty

  + Uncertainty in monthly average land temperature, in degrees Celsius (num)

Latitude

  + Latitude, in degrees north or south of the equator (char)

Longitude

  + Longitude, in degrees east of west of the meridian (char)

# HOW TO REPRODUCE RESEARCH

To reproduce the study download the project to the desired file path.  Open up the 
command line on your machine.  Navigate to the file path the project was downloaded to
in the command line.  Type 'make clean' in the command line.  Then type 'make all' in
the command line.  The remaining files along with the GDPandEducation_CaseStudy1.html
should be populated in the project's paper folder.

# SESSIONINFO()

R version 3.3.3 (2017-03-06)
Platform: x86_64-pc-linux-gnu (64-bit)
Running under: Ubuntu 16.04.2 LTS

locale:
 [1] LC_CTYPE=en_US.UTF-8       LC_NUMERIC=C               LC_TIME=en_US.UTF-8        LC_COLLATE=en_US.UTF-8     LC_MONETARY=en_US.UTF-8   
 [6] LC_MESSAGES=en_US.UTF-8    LC_PAPER=en_US.UTF-8       LC_NAME=C                  LC_ADDRESS=C               LC_TELEPHONE=C            
[11] LC_MEASUREMENT=en_US.UTF-8 LC_IDENTIFICATION=C       

attached base packages:
[1] stats     graphics  grDevices utils     datasets  methods   base     

other attached packages:
[1] reshape2_1.4.2 gdata_2.17.0   ggplot2_2.2.1  dplyr_0.5.0    plyr_1.8.4    

loaded via a namespace (and not attached):
 [1] Rcpp_0.12.10     knitr_1.15.1     magrittr_1.5     munsell_0.4.3    colorspace_1.3-2 R6_2.2.0         stringr_1.2.0    tools_3.3.3      grid_3.3.3      
[10] gtable_0.2.0     DBI_0.6-1        htmltools_0.3.5  gtools_3.5.0     yaml_2.1.14      lazyeval_0.2.0   assertthat_0.2.0 rprojroot_1.2    digest_0.6.12   
[19] tibble_1.3.0     evaluate_0.10    rmarkdown_1.4    stringi_1.1.5    scales_0.4.1     backports_1.0.5 
