# **SQL Data Cleaning and Exploratory Data Analysis**

## 📌 **Overview**

This project focuses on **cleaning and exploring** a dataset related to layoffs from **March 2020 to March 2023**. The dataset includes information on various companies, their locations, industries, the number of employees laid off, the percentage of workforce reduction, layoff dates, company stages, countries, and funds raised.

The goal is to **create a table in MySQL**, clean the data to address missing values and inconsistencies, and conduct an **Exploratory Data Analysis (EDA)** to uncover insights into global layoffs.

**💡 Dataset and project files are available in this repository.**

🔗 **Full Project Report on Notion:**  
[SQL Data Cleaning & EDA – Layoffs Dataset](https://rounded-authority-5e3.notion.site/SQL-Data-Cleaning-Exploratory-Analysis-Layoffs-Dataset-10fe124aeb7981c380b1d713b576cb9b?pvs=74)

---

## 📊 **Dataset Structure**

The dataset includes the following columns:

| **Column**              | **Description**                                 |
| ----------------------- | ----------------------------------------------- |
| `company`               | Name of the company                             |
| `location`              | City where the layoff occurred                  |
| `industry`              | Industry of the company                         |
| `total_laid_off`        | Total number of employees laid off              |
| `percentage_laid_off`   | Percentage of the workforce laid off            |
| `date`                  | Layoff date                                     |
| `stage`                 | Stage of the company (Post-IPO, Series B, etc.) |
| `country`               | Country of the company                          |
| `funds_raised_millions` | Funds raised by the company (in millions)       |

---

## ⚙️ **Project Steps**

### 1️⃣ **Setting Up the Database**

- Create a **MySQL database**.
- Import the dataset into **MySQL**.

### 2️⃣ **Data Cleaning**

- Identify and **remove duplicate records**.
- **Standardize** company, industry, country, and date formats.
- Handle **missing values** to ensure data integrity.

### 3️⃣ **Exploratory Data Analysis (EDA)**

- Identify **trends in layoffs** by **year, month, industry, and country**.
- Analyze layoffs **based on company stages** (Post-IPO, Acquired, Startup, etc.).
- Determine the **top companies with the highest layoffs per year**.

---

## 🚀 **How to Run This Project**

### 1️⃣ **Prerequisites**

- Install **MySQL**
- **MySQL Workbench** (optional for GUI management)

### 2️⃣ **Clone the Repository**

```sh
git clone https://github.com/amharringthon/MySQL-Layoff-Project.git
cd MySQL-Layoff-Project
```

### 3️⃣ **Import the Dataset into MySQL**

1. Open **MySQL Workbench**.
2. Create a new schema: `world_layoff`.
3. Use **Table Data Import Wizard** to load `layoffs.csv`.

### 4️⃣ **Execute SQL Scripts**

- Run `data_cleaning.sql` to **clean the dataset**.
- Run `eda_queries.sql` to generate **insights from the data**.

---

## 🛠️ **Technologies Used**

- **MySQL**: Database and SQL queries.

