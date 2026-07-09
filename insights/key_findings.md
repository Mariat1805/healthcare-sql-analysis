# Key Findings — Healthcare SQL Analysis
## Dataset Overview
- 54,966 patient records spanning 5 years (May 2019 – May 2024)
- 6 medical conditions, 5 insurance providers, 3 admission types
- Note: 2019 and 2024 are partial years and excluded from year-over-year comparisons
## Patient Demographics
- Gender split is exactly 50% male / 50% female
- Blood type distribution is perfectly uniform at ~12.5% each
- Largest age group: Over 65 (16,096 patients); smallest: Under 18 (116 patients)
- Average age is consistent across all conditions (~51–52 years)
- All of the above indicates a *synthetically generated dataset*
## Clinical Findings
- Arthritis had the highest abnormal test rate (34.2%)
- Hypertension had the lowest abnormal test rate (32.5%)
- Average length of stay is consistent across conditions (~15.5 days)
- No single medication is clearly dominant for any condition
## Financial Findings
- Average billing is ~$2.3M across all segments (inflated due to data corruption)
- No significant billing variation across conditions, providers, or age groups
- Medicare had the highest average billing ($2,347,149)
- UnitedHealthcare had the lowest ($2,311,145)
- Billing amounts were corrupted in the source CSV and corrected during cleaning
## Operational Findings
- Admissions grew steadily from 2019 to 2023
- No significant seasonal pattern in monthly admissions
- Hospital and doctor names appear synthetic (e.g. "Smith LLC", "Smith Group")
## Data Quality Notes
- 534 duplicate rows were removed during cleaning
- 108 negative billing values were corrected to positive
- Patient and doctor names were normalized to Title Case
- A `Length_of_Stay_Days` column was added during cleaning
