-- ============================================================
-- PHASE 2: PATIENT ANALYSIS
-- Goal: Understand patient demographics and distribution
-- ============================================================

-- 1. Gender distribution with percentage
SELECT 
    Gender,
    COUNT(*) AS total_patients,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 1) AS percentage
FROM healthcare
GROUP BY Gender;

-- 2. Average age by medical condition
SELECT 
    Medical_Condition,
    ROUND(AVG(Age), 1) AS avg_age,
    MIN(Age) AS youngest,
    MAX(Age) AS oldest,
    COUNT(*) AS total_patients
FROM healthcare
GROUP BY Medical_Condition
ORDER BY avg_age DESC;

-- 3. Blood type distribution with percentage
SELECT 
    Blood_Type,
    COUNT(*) AS total_patients,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 1) AS percentage
FROM healthcare
GROUP BY Blood_Type
ORDER BY total_patients DESC;

-- 4. Patient count by age group
SELECT
    CASE
        WHEN Age < 18 THEN 'Under 18'
        WHEN Age BETWEEN 18 AND 35 THEN '18-35'
        WHEN Age BETWEEN 36 AND 50 THEN '36-50'
        WHEN Age BETWEEN 51 AND 65 THEN '51-65'
        ELSE 'Over 65'
    END AS age_group,
    COUNT(*) AS total_patients
FROM healthcare
GROUP BY age_group
ORDER BY total_patients DESC;
