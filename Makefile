# Makefile for Case Study 2
# 
# Contributors: Georges Michel, Jack Nelson, Nicole Shaver, Nathan Tuttle
 
all: paper/CaseStudy2_Q3i.md paper/CaseStudy2_Q3ii.md paper/CaseStudy2_Q3iii.md


clean:
	rm -f paper/*.html
	rm -f paper/*.md

paper/CaseStudy2_Q3i.md: paper/CaseStudy2_Q3i.Rmd
	Rscript -e 'library(rmarkdown); Sys.setenv(RSTUDIO_PANDOC="/usr/lib/rstudio/bin/pandoc");rmarkdown::render("$<")'

paper/CaseStudy2_Q3ii.md: paper/CaseStudy2_Q3ii.Rmd
	Rscript -e 'library(rmarkdown); Sys.setenv(RSTUDIO_PANDOC="/usr/lib/rstudio/bin/pandoc");rmarkdown::render("$<")'

paper/CaseStudy2_Q3iii.md: paper/CaseStudy2_Q3iii.Rmd
	Rscript -e 'library(rmarkdown); Sys.setenv(RSTUDIO_PANDOC="/usr/lib/rstudio/bin/pandoc");rmarkdown::render("$<")'
