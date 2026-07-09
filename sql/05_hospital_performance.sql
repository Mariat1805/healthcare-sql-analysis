-- ============================================================
-- PHASE 5: HOSPITAL & DOCTOR PERFORMANCE
-- Goal: Analyze operational metrics across hospitals and doctors
-- ============================================================

-- 1. Top 10 hospitals by patient volume
SELECT 
    Hospital,
    COUNT(*) AS total_patients,
    ROUND(AVG(Billing_Amount), 2) AS avg_billing
FROM healthcare
GROUP BY Hospital
ORDER BY total_patients DESC
LIMIT 10;

-- 2. Top 10 doctors by patient volume
SELECT 
    Doctor,
    COUNT(*) AS total_patients,
    ROUND(AVG(Billing_Amount), 2) AS avg_billing
FROM healthcare
GROUP BY Doctor
ORDER BY total_patients DESC
LIMIT 10;

-- 3. Admissions trend by year
-- Note: 2019 and 2024 are partial years (data starts May 2019, ends May 2024)
SELECT 
    YEAR(Date_of_Admission) AS admission_year,
    COUNT(*) AS total_admissions
FROM healthcare
GROUP BY admission_year
ORDER BY admission_year;

-- 4. Admissions trend by month (across all years)
SELECT 
    MONTH(Date_of_Admission) AS admission_month,
    COUNT(*) AS total_admissions
FROM healthcare
GROUP BY admission_month
ORDER BY admission_month;

-- 5. Most frequently used room numbers
SELECT 
    Room_Number,
    COUNT(*) AS total_uses
FROM healthcare
GROUP BY Room_Number
ORDER BY total_uses DESC
LIMIT 10;
