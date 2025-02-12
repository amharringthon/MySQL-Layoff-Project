-- Preview the data
SELECT * FROM layoffs LIMIT 5;

-- Create a staging table for data cleaning
CREATE TABLE layoffs_staging LIKE layoffs;
INSERT INTO layoffs_staging SELECT * FROM layoffs;

-- Validate staging table creation
SELECT COUNT(*) FROM layoffs_staging;

-- Identify duplicate records
WITH duplicate_check AS (
    SELECT *, 
           ROW_NUMBER() OVER (
               PARTITION BY company, location, industry, total_laid_off, 
                            percentage_laid_off, `date`, stage, country, funds_raised_millions
               ORDER BY company) AS row_num
    FROM layoffs_staging
)
SELECT * FROM duplicate_check WHERE row_num > 1;

-- Create a cleaned staging table without duplicates
CREATE TABLE layoffs_staging2 (
  company TEXT,
  location TEXT,
  industry TEXT,
  total_laid_off INT DEFAULT NULL,
  percentage_laid_off TEXT,
  date TEXT,
  stage TEXT,
  country TEXT,
  funds_raised_millions INT DEFAULT NULL,
  row_num INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO layoffs_staging2
WITH duplicate_check AS (
    SELECT *, ROW_NUMBER() OVER (
        PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) 
        AS row_num FROM layoffs_staging)
SELECT * FROM duplicate_check WHERE row_num = 1;

-- Validate the cleaned table
SELECT COUNT(*) FROM layoffs_staging2;

-- Standardize company names (remove whitespace)
UPDATE layoffs_staging2 SET company = TRIM(company);
-- Validate standardization
SELECT DISTINCT company FROM layoffs_staging2;

-- Standardize industry values
UPDATE layoffs_staging2 SET industry = 'Crypto' WHERE industry LIKE 'Crypto%';
-- Validate changes in industry values
SELECT DISTINCT industry FROM layoffs_staging2;

-- Standardize country values (remove trailing periods)
UPDATE layoffs_staging2 SET country = TRIM(TRAILING '.' FROM country) WHERE country LIKE 'United States%';
-- Validate changes in country field
SELECT DISTINCT country FROM layoffs_staging2;

-- Convert date format
UPDATE layoffs_staging2 SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');
ALTER TABLE layoffs_staging2 MODIFY COLUMN `date` DATE;
-- Validate date format change
SELECT `date` FROM layoffs_staging2 LIMIT 5;

-- Remove rows with NULL values in key fields
DELETE FROM layoffs_staging2 WHERE total_laid_off IS NULL AND percentage_laid_off IS NULL;
-- Validate NULL removal
SELECT * FROM layoffs_staging2 WHERE total_laid_off IS NULL AND percentage_laid_off IS NULL;

-- Fill missing industry values using existing company data
UPDATE layoffs_staging2 SET industry = 'Travel' WHERE company = 'Airbnb';
-- Validate industry updates
SELECT * FROM layoffs_staging2 WHERE company = 'Airbnb';

-- Fixing similar cases where the same company has missing industry values, filling them with existing data
UPDATE layoffs_staging2 t1
JOIN layoffs_staging2 t2 ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE (t1.industry IS NULL OR t1.industry = '') AND t2.industry IS NOT NULL AND t2.industry != '';

-- Validate missing industry resolution
SELECT * FROM layoffs_staging2 WHERE industry IS NULL OR industry = '';

-- Final Step: Remove the row_num column to finalize dataset
ALTER TABLE layoffs_staging2 DROP COLUMN row_num;
-- Validate final dataset
SELECT * FROM layoffs_staging2 LIMIT 5;
