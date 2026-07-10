# Healthcare Data Analysis — SQL Project
## Overview
End-to-end SQL analysis of a synthetic healthcare dataset covering 54,966 patient records across 5 years (2019–2024). The project covers data exploration, patient demographics, financial analysis, clinical patterns, and hospital performance, with advanced SQL techniques demonstrated in the final phase.
## Tools Used
**MySQL** — all queries and analysis <br>
**Excel** — data cleaning prior to import
## Dataset
**Source:** Synthetic healthcare dataset (Kaggle)<br>
**Rows:** 54,966 patients (after removing 534 duplicates)<br>
**Columns:** 16 (15 original + 1 derived: `Length_of_Stay_Days`)<br>
**Period:** May 2019 – May 2024<br>
**Note:** Dataset is synthetic. Billing amounts were corrupted in the source file and corrected during cleaning. All figures are used for SQL practice purposes only.
## Project Structure
```
healthcare-sql-analysis/
│
├── README.md
├── sql/
│   ├── 01_exploration.sql
│   ├── 02_patient_analysis.sql
│   ├── 03_financial_analysis.sql
│   ├── 04_clinical_analysis.sql
│   ├── 05_hospital_performance.sql
│   └── 06_advanced_queries.sql
└── insights/
    └── key_findings.md
```
## SQL Concepts Demonstrated
- `SELECT`, `WHERE`, `GROUP BY`, `ORDER BY`, `LIMIT`<br>
- Aggregate functions: `COUNT`, `AVG`, `MIN`, `MAX`, `SUM`<br>
- `CASE WHEN` for conditional logic and grouping<br>
- Window functions: `RANK()`, `ROW_NUMBER()`, `SUM() OVER()`<br>
- CTEs (`WITH` clause) for readable, reusable subqueries<br>
- Subqueries (inline views)<br>
- `PARTITION BY` for grouped window calculations
## Key Findings
- 54,966 patients across 6 conditions, 5 insurance providers, 3 admission types <br>
- Perfectly balanced gender (50/50) and blood type distribution confirms synthetic data <br>
- Arthritis had the highest abnormal test rate (34.2%); Hypertension the lowest (32.5%)<br>
- Admissions grew steadily 2019–2023; no strong seasonal pattern detected<br>
- Billing shows no significant variation across any dimension
## Data Cleaning Steps
- Removed 534 exact duplicate rows <br>
- Corrected 108 negative billing values (converted to absolute value)<br>
- Normalized Name, Doctor, Hospital columns to Title Case<br>
- Converted date columns from string to DATE format<br>
- Rounded Billing Amount to 2 decimal places<br>
- Added derived column: `Length_of_Stay_Days`
