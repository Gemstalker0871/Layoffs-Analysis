-- DATA CLEANING

SELECT *
FROM layoffs;

-- 1 Remove Duplicates
-- 2 Standarise the Data
-- 3 Null Values or Blank Values
-- 4 Remove Any Columns 


CREATE table layoffs_staging
like layoffs;

SELECT *
FROM layoffs_staging;

insert layoffs_staging
select *
from layoffs;


SELECT *,
row_number() over( 
Partition by company, industry, total_laid_off, percentage_laid_off, `date`) As row_num
FROM layoffs_staging;




with duplicate_cte AS 
(
SELECT *,
row_number() over( 
Partition by company, location, 
industry, total_laid_off, percentage_laid_off, `date`, 
stage, country, funds_raised_millions) As row_num
FROM layoffs_staginglayoffs_staging
)
select *
from duplicate_cte
where row_num > 1;


SELECT *
FROM layoffs_staging
where company = 'Casper';


with duplicate_cte AS 
(
SELECT *,
row_number() over( 
Partition by company, location, 
industry, total_laid_off, percentage_laid_off, `date`, 
stage, country, funds_raised_millions) As row_num
FROM layoffs_staging
)
delete
from duplicate_cte
where row_num > 1;



CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



SELECT *
FROM layoffs_staging2
where row_num > 1
;

insert into layoffs_staging2
SELECT *,
row_number() over( 
Partition by company, location, 
industry, total_laid_off, percentage_laid_off, `date`, 
stage, country, funds_raised_millions) As row_num
FROM layoffs_staging;


delete
FROM layoffs_staging2
where row_num > 1
;

SELECT *
FROM layoffs_staging2;

-- Standardising Data

select company,  trim(company)
from layoffs_staging2;

update layoffs_staging2
set company = trim(company);


select distinct industry
from layoffs_staging2;

update layoffs_staging2
set industry = 'Crypto'
where industry like 'Crypto%';

select distinct country, trim(trailing '.' from country)
from layoffs_staging2
order by 1;

update layoffs_staging2
set country = trim(trailing '.' from country)
where country like 'United States%';

select `date`
from layoffs_staging2;

update layoffs_staging2
set `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

alter table layoffs_staging2
modify column `date` DATE;

select *
from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null;

select *
from layoffs_staging2
where industry is null;


update layoffs_staging2
set industry = null
where industry = '';

select *
from layoffs_staging2
where company like 'Bally%';



select t1.industry, t2.industry
from layoffs_staging2 t1
join layoffs_staging2 t2
	on t1.company = t2.company
    and t1.location = t2.location
where (t1.industry is null or t1.industry = '')
and t2.industry is not null;



update layoffs_staging2 t1
join layoffs_staging2 t2
	on t1.company = t2.company
set t1.industry = t2.industry
where (t1.industry is null)
and t2.industry is not null;


select *
from layoffs_staging2;


select *
from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null;

delete
from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null;


select *
from layoffs_staging2;


alter table layoffs_staging2
drop column row_num;




