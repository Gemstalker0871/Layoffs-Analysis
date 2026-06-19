# Global Layoffs Analysis (2020–2023)

## Project Overview

This project analyzes global layoffs between 2020 and 2023 using SQL. The objective was to clean a real-world dataset, standardize inconsistent records, and uncover trends across companies, industries, countries, and time periods.

---

## Problem Statement

Workforce reductions affected organizations worldwide during and after the COVID-19 pandemic. This project aims to answer the following questions:

* Which companies reported the highest number of layoffs?
* Which industries were most affected?
* How did layoffs change over time?
* Which countries experienced the highest layoffs?
* What trends can be observed across funding stages and years?

---

## Dataset

The dataset contains layoff records from 2020 to 2023, including:

* Company
* Location
* Industry
* Total employees laid off
* Percentage laid off
* Date
* Funding stage
* Country
* Funds raised

---

## Tools Used

* MySQL
* SQL
* GitHub

---

## Data Cleaning Process

The following steps were performed:

1. Created staging tables to preserve raw data.
2. Identified and removed duplicate records using `ROW_NUMBER()`.
3. Standardized company names, industries, countries, and date formats.
4. Converted date fields to the SQL `DATE` format.
5. Replaced blank values with `NULL`.
6. Filled missing industry values using self-joins.
7. Removed records with insufficient information.
8. Dropped temporary columns after cleaning.

---


## Exploratory Analysis

The analysis focused on:

* Total layoffs by company
* Total layoffs by country
* Total layoffs by industry
* Layoffs by funding stage
* Year-over-year layoffs
* Monthly layoff trends
* Rolling cumulative layoffs
* Top companies by layoffs each year
* Industry-wise growth in layoffs
* Country contribution to global layoffs

---

## Key Findings

* The dataset recorded **383,659 layoffs** across **1,628 companies** worldwide between 2020 and 2023.

* Layoffs peaked in **January 2023**, with **84,714 employees** affected in a single month.

* The **United States** accounted for **256,559 layoffs**, representing **66.9%** of all reported layoffs globally, while **India** ranked second with **35,993 layoffs (9.4%)**.

* Global layoffs surged in **2022**, reaching **160,661 employees**, more than double the total recorded in 2020.

* The **Consumer** and **Retail** industries were the most affected sectors, reporting **45,182** and **43,613 layoffs**, respectively.

* The **"Other"** industry category experienced the largest year-over-year increase in layoffs, rising by **22,216 employees** between 2022 and 2023. Retail recorded the highest industry-specific increase in 2022, with layoffs increasing by **19,826 employees** year over year.

* **Post-IPO** companies accounted for **204,132 layoffs** across **286 organizations**, averaging **714 layoffs per company**, significantly higher than early-stage startups.

* **Amazon, Google, Meta, Salesforce, and Microsoft** ranked among the companies with the highest total layoffs during the analysis period.

* **116 companies** reported laying off **100% of their workforce**, indicating complete shutdowns or business closures.

* Several companies, including **Loft, Swiggy, Uber, and WeWork**, conducted multiple rounds of layoffs, suggesting prolonged restructuring efforts rather than one-time cost-cutting measures.

* Industry layoff peaks were concentrated in **2022 and 2023**, with **Retail, Consumer, Transportation, Healthcare, and Finance** experiencing their highest workforce reductions during this period.

---
---

