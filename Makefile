report_group7.html: final_report.Rmd covid_data_cleaned.rds code/06_render_final_report.R table1.rds .png
	Rscript code/04_render_final_report.R

# creates cleaned data
covid_data_cleaned.rds: code/01_data_processing.R
	Rscript code/01_data_processing.R

# creates table 1
table1.rds: code/02_make_table1.R
	Rscript code/02_make_table1.R

# creates figures
figures: code/03_make_heatmap.R
	Rscript code/03_make_heatmap.R
	
# creates regression analysis results
model: code/05_models.R
	Rscript code/05_models.R

.PHONY: clean
clean:
	rm -f figure/*.rds && rm -f table/table1.rds && rm -f data/covid_data_cleaned.rds && rm -f output/*.rds
