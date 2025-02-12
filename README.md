QL Data Cleaning and Exploratory Data Analysis

📌 Overview

This project focuses on cleaning and exploring a dataset related to layoffs in 2023. The dataset contains information about various companies, their locations, industries, the number of employees laid off, the percentage of workforce reduction, the layoff date, the company's stage, country, and the funds raised.

The goal is to create a table in MySQL, clean the data to address issues such as missing values and inconsistencies, and perform an Exploratory Data Analysis (EDA) to gain insights into global layoffs.

💡 Dataset and project files are available in this repository.

📊 Dataset Structure

The dataset includes the following columns:

Column

Description

company

Name of the company

location

City where the layoff occurred

industry

Industry of the company

total_laid_off

Total number of employees laid off

percentage_laid_off

Percentage of the workforce laid off

date

Layoff date

stage

Stage of the company (Post-IPO, Series B, etc.)

country

Country of the company

funds_raised_millions

Funds raised by the company (in millions)

⚙️ Project Steps

1️⃣ Setting Up the Database

Create a MySQL database.

Import the dataset into MySQL.

2️⃣ Data Cleaning

Identify and remove duplicate records.

Standardize company, industry, country, and date formats.

Handle missing values.

3️⃣ Exploratory Data Analysis (EDA) (Coming Soon)

Identify trends in layoffs by industry, country, and funding.

🚀 How to Run This Project

1️⃣ Prerequisites

Install MySQL

MySQL Workbench (optional for GUI management)

2️⃣ Clone the Repository

git clone https://github.com/amharringthon/MySQL-Layoff-Project.git
cd MySQL-Layoff-Project

3️⃣ Import the Dataset into MySQL

Open MySQL Workbench.

Create a new schema: world_layoff.

Use Table Data Import Wizard to load layoffs.csv.

4️⃣ Execute SQL Scripts

Run data_cleaning.sql to clean the dataset.

Validate transformations using provided queries.

🛠️ Technologies Used

MySQL: Database and SQL queries.


📌 Next Steps

🟢 Complete Exploratory Data Analysis (EDA).

🟢 Create visualizations for trends in layoffs.


🤝 Contributing

Feel free to fork this repository and submit a pull request with improvements or additional insights!

📩 Contact

💡 Additional Documentation: Notion Project Page

If you have any questions, feel free to reach out via GitHub.

🚀 Happy Coding!

