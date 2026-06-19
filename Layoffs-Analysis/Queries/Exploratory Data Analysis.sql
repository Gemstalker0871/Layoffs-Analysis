-- Exploratory Data Analysis

select*
from layoffs_staging2;

select max(total_laid_off), max(percentage_laid_off)
from layoffs_staging2;



select*
from layoffs_staging2
where percentage_laid_off = 1
order by funds_raised_millions desc;




select company, sum(total_laid_off)
from layoffs_staging2
group by company
order by 2 desc; 


select min(`date`), max(`date`)
from layoffs_staging2;



select country, sum(total_laid_off)
from layoffs_staging2
group by country
order by 2 desc; 


select*
from layoffs_staging2;


select year (`date`), sum(total_laid_off)
from layoffs_staging2
group by year (`date`)
order by 2 desc; 


select stage, sum(total_laid_off)
from layoffs_staging2
group by stage
order by 2 desc; 


select company, sum(percentage_laid_off)
from layoffs_staging2
group by company
order by 2 desc; 


select substring(`date`, 1,7) as 'Month', sum(total_laid_off)
from layoffs_staging2
where substring(`date`, 1,7) is not null
group by substring(`date`, 1,7)
order by 1 asc;



with Rolling_total as
(
select substring(`date`, 1,7) as Month, sum(total_laid_off) as total_off
from layoffs_staging2
where substring(`date`, 1,7) is not null
group by substring(`date`, 1,7)
order by 1 asc
)
select Month,total_off,
 Sum(total_off) over(order by Month) as rolling_total
from Rolling_total;




select company, sum(total_laid_off)
from layoffs_staging2
group by company
order by 2 desc; 


select company, year(`date`), sum(total_laid_off)
from layoffs_staging2
group by company, year(`date`)
order by 3 desc;




with Company_year (company, years, total_laid_off) as
(
select company, year(`date`), sum(total_laid_off)
from layoffs_staging2
group by company, year(`date`)
), Company_Year_Rank as
(
select *, 
dense_rank() over (partition by years order by total_laid_off desc) as Ranking
from Company_year
where years is not null
)
select * 
from Company_Year_Rank
where Ranking <= 5
;




SELECT country, SUM(total_laid_off) AS layoffs
FROM layoffs_staging2
GROUP BY country
ORDER BY layoffs DESC
LIMIT 10;

SELECT industry, SUM(total_laid_off) AS layoffs
FROM layoffs_staging2
WHERE industry IS NOT NULL
GROUP BY industry
ORDER BY layoffs DESC
LIMIT 10;


SELECT YEAR(`date`) AS year,
       SUM(total_laid_off) AS layoffs
FROM layoffs_staging2
GROUP BY year
ORDER BY year;


SELECT company, SUM(total_laid_off) AS layoffs
FROM layoffs_staging2
GROUP BY company
ORDER BY layoffs DESC
LIMIT 10;


SELECT DATE_FORMAT(`date`, '%Y-%m') AS month,
       SUM(total_laid_off) AS layoffs
FROM layoffs_staging2
GROUP BY month
ORDER BY layoffs DESC
LIMIT 10;




SELECT company, COUNT(*) AS rounds
FROM layoffs_staging2
GROUP BY company
HAVING COUNT(*) > 1
ORDER BY rounds DESC
LIMIT 10;


SELECT COUNT(*) AS complete_shutdowns
FROM layoffs_staging2
WHERE percentage_laid_off = 1;



WITH industry_year AS (
    SELECT
        industry,
        YEAR(`date`) AS year,
        SUM(total_laid_off) AS layoffs
    FROM layoffs_staging2
    WHERE industry IS NOT NULL
    GROUP BY industry, YEAR(`date`)
),

industry_growth AS (
    SELECT
        industry,
        year,
        layoffs,
        LAG(layoffs) OVER (
            PARTITION BY industry
            ORDER BY year
        ) AS prev_year
    FROM industry_year
)

SELECT
    industry,
    year,
    layoffs,
    prev_year,
    layoffs - prev_year AS increase
FROM industry_growth
WHERE prev_year IS NOT NULL
ORDER BY increase DESC
LIMIT 10;




WITH country_totals AS (
    SELECT
        country,
        SUM(total_laid_off) AS layoffs
    FROM layoffs_staging2
    GROUP BY country
),

global_total AS (
    SELECT SUM(total_laid_off) AS total
    FROM layoffs_staging2
)

SELECT
    c.country,
    c.layoffs,
    ROUND((c.layoffs / g.total) * 100, 2) AS percentage_share
FROM country_totals c
CROSS JOIN global_total g
ORDER BY percentage_share DESC;






SELECT
    stage,
    COUNT(DISTINCT company) AS companies,
    SUM(total_laid_off) AS total_layoffs,
    ROUND(
        SUM(total_laid_off) /
        COUNT(DISTINCT company),
        2
    ) AS layoffs_per_company
FROM layoffs_staging2
WHERE stage IS NOT NULL
GROUP BY stage
ORDER BY layoffs_per_company DESC;




WITH industry_year AS (
    SELECT
        industry,
        YEAR(`date`) AS year,
        SUM(total_laid_off) AS layoffs
    FROM layoffs_staging2
    GROUP BY industry, YEAR(`date`)
),

ranked AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY industry
               ORDER BY layoffs DESC
           ) AS rn
    FROM industry_year
)

SELECT
    industry,
    year AS peak_year,
    layoffs AS peak_layoffs
FROM ranked
WHERE rn = 1
ORDER BY peak_layoffs DESC;




