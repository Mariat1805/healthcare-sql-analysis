-- ============================================================
-- PHASE 1: DATA EXPLORATION
-- Goal: Understand the dataset before any analysis
-- ============================================================

-- 1. Total number of records
SELECT COUNT(*) AS total_records
FROM healthcare;

-- 2. Date range of the dataset
SELECT 
    MIN(Date_of_Admission) AS earliest_admission,
    MAX(Date_of_Admission) AS latest_admission
FROM healthcare;

-- 3. Summary statistics for numeric columns
SELECT
    ROUND(AVG(Billing_Amount), 2) AS avg_billing,
    ROUND(MIN(Billing_Amount), 2) AS min_billing,
    ROUND(MAX(Billing_Amount), 2) AS max_billing,
    ROUND(AVG(Length_of_Stay_Days), 1) AS avg_stay_days
FROM healthcare;

-- 4. Unique values in key categorical columns
SELECT DISTINCT Medical_Condition FROM healthcare;
SELECT DISTINCT Admission_Type FROM healthcare;
SELECT DISTINCT Test_Results FROM healthcare;
SELECT DISTINCT Insurance_Provider FROM healthcare;
