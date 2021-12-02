# Rule for making report
report: R/Info550_project.Rmd figs/hist1.png figs/hist2.png figs/hist3.png
	cd R; Rscript -e "rmarkdown::render('Info550_project.Rmd',output_file = '../output/report.html')"
	
# Making figure 1
figs/hist1.png: R/histogram1.R 
	Rscript R/histogram1.R
# Making figure 2
figs/hist2.png: R/histogram2.R 
	Rscript R/histogram2.R
# Making figure 3
figs/hist3.png: R/histogram3.R 
	Rscript R/histogram3.R
	