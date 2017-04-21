# Makefile for Case Study 2
# 
# Contributors: Georges Michel, Jack Nelson, Nicole Shaver, Nathan Tuttle
 
all: paper/CaseStudy2.md


clean:
	rm -f paper/*.html
	rm -f paper/*.md

paper/CaseStudy2.md: paper/CaseStudy2.Rmd
	Rscript -e 'library(rmarkdown); Sys.setenv(RSTUDIO_PANDOC="/usr/lib/rstudio/bin/pandoc");rmarkdown::render("$<")'
