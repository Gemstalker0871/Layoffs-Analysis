Global Layoffs Analysis (2020–2023)
Project Overview

This project analyzes global layoffs between 2020 and 2023 using SQL. The objective was to clean a real-world dataset, standardize inconsistent records, and uncover trends across companies, industries, countries, and time periods.

Problem Statement

Workforce reductions affected organizations worldwide during and after the COVID-19 pandemic. This project aims to answer questions such as:

Which companies reported the highest number of layoffs?
Which industries were most affected?
How did layoffs change over time?
Which countries experienced the highest layoffs?
What trends can be observed across funding stages and years?
Dataset

The dataset contains layoff records from 2020 to 2023, including:

Company
Location
Industry
Total employees laid off
Percentage laid off
Date
Funding stage
Country
Funds raised
Tools Used
MySQL
SQL
GitHub
Data Cleaning Process

The following steps were performed:

Created staging tables to preserve raw data.
Identified and removed duplicate records using ROW_NUMBER().
Standardized company names, industries, countries, and date formats.
Converted date fields to SQL DATE format.
Replaced blank values with NULL.
Filled missing industry values using self-joins.
Removed records with insufficient information.
Dropped temporary columns after cleaning.
SQL Concepts Used
Common Table Expressions (CTEs)
Window Functions
ROW_NUMBER()
DENSE_RANK()
Self Joins
Aggregate Functions
Date Functions
Rolling Totals
Exploratory Analysis

The analysis focused on:

Total layoffs by company
Total layoffs by country
Total layoffs by industry
Layoffs by funding stage
Year-over-year layoffs
Monthly layoff trends
Rolling cumulative layoffs
Top companies by layoffs each year
Key Findings
Layoffs increased significantly during 2022 and 2023.
The United States recorded the highest number of layoffs.
Certain industries experienced substantially higher layoffs than others.
Several companies conducted multiple rounds of layoffs across different years.
Monthly layoff trends revealed distinct periods of workforce reductions.
Repository Structure

global-layoffs-analysis/

├── data/
│ └── layoffs.csv

├── sql/
│ ├── 01_data_cleaning.sql
│ └── 02_exploratory_analysis.sql

└── README.md
