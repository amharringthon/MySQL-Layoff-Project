
-- Exploratory Data Analysis

-- Identify the largest layoff events and their percentage impact
SELECT MAX(total_laid_off), MAX(percentage_laid_off)
FROM layoffs_staging2;

-- Calculate total layoffs per year
SELECT YEAR(date), SUM(total_laid_off)
FROM layoffs_staging2
WHERE YEAR(date) IS NOT NULL
GROUP BY YEAR(date)
ORDER BY 1;

-- Calculate total layoffs per month
SELECT SUBSTRING(date,1,7) AS month, SUM(total_laid_off)
FROM layoffs_staging2
WHERE SUBSTRING(date,1,7) IS NOT NULL
GROUP BY month
ORDER BY 1;

-- Determine which industries were most affected by layoffs
SELECT industry, SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
GROUP BY industry
ORDER BY total_laid_off DESC;

-- Identify countries with the highest layoffs
SELECT country, SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
GROUP BY country
ORDER BY total_laid_off DESC;

-- Analyze layoffs based on company stage to understand risk distribution
SELECT stage, SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
GROUP BY stage
ORDER BY total_laid_off DESC;

-- Determine which companies had the highest layoffs each year
WITH company_year AS (
    SELECT company, YEAR(date) AS years, SUM(total_laid_off) AS total_laid_off
    FROM layoffs_staging2
    GROUP BY company, years
),
company_year_rank AS (
    SELECT *, DENSE_RANK() OVER (PARTITION BY years ORDER BY total_laid_off DESC) AS ranking
    FROM company_year
    WHERE years IS NOT NULL
)
SELECT *
FROM company_year_rank
WHERE ranking <= 5
ORDER BY years;


