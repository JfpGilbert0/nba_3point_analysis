# Replication Package for The impact of 3 point shooting volumes in the4th quarter

## Overview

This repository contains the replication package for the paper titled "The impact of 3 point shooting volumes in the4th quarter". The package includes all the necessary files and code to reproduce the analysis presented in the paper.

## File Structure

The repository is organized as follows:

- **code**: Contains R scripts used as such; `download.R` retreived databases using [NBAstatR](https://github.com/abresler/nbastatR) ; `cleaning.R` utilized R packages and cleaned the dataset, saving the cleaned data in the `data/analysis` folder.; `models.R` contains code for building and saving the models in the paper; `testing.R` includes some test of the data used in the models and paper
- **data**: Contains all the datasets used in the analysis as parquet files. They are divided into the raw subfolder and analysis folder for subsets and cleaned data. Aditionally there is a subfolder for storing the models as RDS files
- **paper**: contains the `paper.qmd` file used o construct the paper in pdf format aswell as a copy of the paper. references.bib contains all references in the paper in bibtex format
- **.lintr**: Simply sets preferences for a built in R lintr, can be changed or removed at a users preference.
- **.RData**: Works as a link to take user straight to Rstudio
- **License**: MIT license
- **README.md**: This file, providing an overview of the replication package and instructions for use.

## Purpose

The purpose of this repository is to provide researchers and practitioners with the tools and data necessary to replicate the analysis presented in the paper. By sharing the code and data, we aim to promote transparency, reproducibility, and further research in the field.

## Using the LLM 
LLM were used primarily as a debugging tool when cod either in R or qmd files threw unexpected errors. ChatGPT3.5 was used however its success in this department varied and as, more often than not, the llm suggestion was not used the conversation has not been added here.
LLM's were also used in the editorial phases of the paper. Mostly to correct grammar and formatting issues.
