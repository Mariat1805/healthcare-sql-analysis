-- ============================================================
-- PHASE 3: FINANCIAL ANALYSIS
-- Goal: Understand billing patterns across different dimensions
-- Note: Billing amounts are inflated due to source data corruption
--       and are used for SQL practice purposes only
-- ============================================================

-- 1. Average billing by insurance provider
SELECT 
    Insurance_Provider,
    COUNT(*) AS total_patients,
    ROUND(AVG(Billing_Amount), 2) AS avg_billing,
    ROUND(MIN(Billing_Amount), 2) AS min_billing,
    ROUND(MAX(Billing_Amount), 2) AS max_billing
FROM healthcare
GROUP BY Insurance_Provider
ORDER BY avg_billing DESC;

-- 2. Average billing by medical condition
SELECT 
    Medical_Condition,
    ROUND(AVG(Billing_Amount), 2) AS avg_billing,
    COUNT(*) AS total_patients
FROM healthcare
GROUP BY Medical_Condition
ORDER BY avg_billing DESC;

-- 3. Average billing by admission type
SELECT 
    Admission_Type,
    ROUND(AVG(Billing_Amount), 2) AS avg_billing,
    COUNT(*) AS total_patients
FROM healthcare
GROUP BY Admission_Type
ORDER BY avg_billing DESC;

-- 4. Average billing by age group
SELECT
    CASE
        WHEN Age < 18 THEN 'Under 18'
        WHEN Age BETWEEN 18 AND 35 THEN '18-35'
        WHEN Age BETWEEN 36 AND 50 THEN '36-50'
        WHEN Age BETWEEN 51 AND 65 THEN '51-65'
        ELSE 'Over 65'
    END AS age_group,
    ROUND(AVG(Billing_Amount), 2) AS avg_billing,
    COUNT(*) AS total_patients
FROM healthcare
GROUP BY age_group
ORDER BY avg_billing DESC;
