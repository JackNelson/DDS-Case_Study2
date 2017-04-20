# TITLE

TODO

Contributors: Georges Michel, Jack Nelson, Nicole Shaver, Nathan Tuttle

# PURPOSE OF PROJECT


# COPYRIGHT INFO

This project was generated for Southern Methodist University course MSDS 6306
Doing Data Science: An Introduction to Data Science to complete Case Study 1

*Datasets sources*
Orange and CityTemp
TODO

# FILE ORGANIZATION

____ <- signifies a folder (i.e. data <- = data folder)

"|" separates multiple files in the same folder (i.e. TODO) 

The original file structure is as follows:

  + ReadME.md

  + Makefile.txt

  + data <-CityTemp.csv,TEMP.csv

  + paper <- CaseStudy2_Q3i.Rmd, CaseStudy2_Q3i.md, CaseStudy2_Q3ii.Rmd,CaseStudy2_Q3ii.md, Case Study 2.docx

  + source <- CityTemp_cleanup.R, cleanup_2.R, download_2.R

*After running the Makefile in the command line...*

The file structure should be as follows:

  + ReadME.md
  
  + Makefile.txt
  
  + data <- CityTemp.csv,TEMP.csv
  
  + paper <- CaseStudy2_Q3i.Rmd, CaseStudy2_Q3i.md, CaseStudy2_Q3ii.Rmd,CaseStudy2_Q3ii.md
             
    + TODO : Investigate how make will lay out final structure.
    | TODO
  
  + source <- CityTemp_cleanup.R, cleanup_2.R, download_2.R

# FILE INFO

README.md

  + md file containing the details of the project and how to reproduce it

 Makefile.txt
 
  + Text file to run in the command line to populate TODO
	
TODO: Explain the rest of the variables

	
_Unused variables:_
TODO find all variables and list the ones not used

# HOW TO REPRODUCE RESEARCH

To reproduce the study download the project to the desired file path.  Open up the 
command line on your machine.  Navigate to the file path the project was downloaded to
in the command line.  Type 'make clean' in the command line.  Then type 'make all' in
the command line.  The remaining files along with the GDPandEducation_CaseStudy1.html
should be populated in the project's paper folder.

# SESSIONINFO()

R version 3.3.2 (2016-10-31)
Platform: x86_64-apple-darwin13.4.0 (64-bit)
Running under: macOS Sierra 10.12

locale:
[1] en_US.UTF-8/en_US.UTF-8/en_US.UTF-8/C/en_US.UTF-8/en_US.UTF-8

attached base packages:
[1] stats     graphics  grDevices utils     datasets  methods  
[7] base     

loaded via a namespace (and not attached):
 [1] backports_1.0.4 magrittr_1.5    rprojroot_1.1 
 htmltools_0.3.5
 [5] tools_3.3.2     yaml_2.1.14     Rcpp_0.12.8     stringi_1.1.2
 [9] rmarkdown_1.3   knitr_1.15.1    stringr_1.2.0   digest_0.6.11
[13] evaluate_0.10  
