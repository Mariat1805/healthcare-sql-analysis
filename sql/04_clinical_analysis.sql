-- ============================================================
-- PHASE 4: CLINICAL ANALYSIS
-- Goal: Understand medical conditions, medications, and test results
-- ============================================================

-- 1. Test results breakdown by medical condition
SELECT 
    Medical_Condition,
    Test_Results,
    COUNT(*) AS total
FROM healthcare
GROUP BY Medical_Condition, Test_Results
ORDER BY Medical_Condition, total DESC;

-- 2. Most common medication per condition
SELECT 
    Medical_Condition,
    Medication,
    COUNT(*) AS total
FROM healthcare
GROUP BY Medical_Condition, Medication
ORDER BY Medical_Condition, total DESC;

-- 3. Abnormal test results rate by condition
SELECT 
    Medical_Condition,
    COUNT(*) AS total_patients,
    SUM(CASE WHEN Test_Results = 'Abnormal' THEN 1 ELSE 0 END) AS abnormal_count,
    ROUND(SUM(CASE WHEN Test_Results = 'Abnormal' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS abnormal_pct
FROM healthcare
GROUP BY Medical_Condition
ORDER BY abnormal_pct DESC;

-- 4. Average length of stay by medical condition
SELECT 
    Medical_Condition,
    ROUND(AVG(Length_of_Stay_Days), 1) AS avg_stay,
    MIN(Length_of_Stay_Days) AS min_stay,
    MAX(Length_of_Stay_Days) AS max_stay
FROM healthcare
GROUP BY Medical_Condition
ORDER BY avg_stay DESC;
