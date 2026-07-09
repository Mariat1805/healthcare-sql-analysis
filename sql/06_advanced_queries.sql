-- ============================================================
-- PHASE 6: ADVANCED QUERIES
-- Goal: Demonstrate CTEs, window functions, and subqueries
-- Concepts: RANK(), ROW_NUMBER(), SUM() OVER(), WITH clause
-- ============================================================

-- 1. Rank doctors by average billing within each hospital
--    Concept: RANK() window function with PARTITION BY
SELECT 
    Hospital,
    Doctor,
    COUNT(*) AS total_patients,
    ROUND(AVG(Billing_Amount), 2) AS avg_billing,
    RANK() OVER (PARTITION BY Hospital ORDER BY AVG(Billing_Amount) DESC) AS billing_rank
FROM healthcare
GROUP BY Hospital, Doctor
ORDER BY Hospital, billing_rank
LIMIT 30;

-- 2. Running total of admissions by year
--    Concept: SUM() OVER() for cumulative calculation + subquery
SELECT 
    admission_year,
    total_admissions,
    SUM(total_admissions) OVER (ORDER BY admission_year) AS running_total
FROM (
    SELECT 
        YEAR(Date_of_Admission) AS admission_year,
        COUNT(*) AS total_admissions
    FROM healthcare
    GROUP BY admission_year
) AS yearly_data
ORDER BY admission_year;

-- 3. Patients billed above their condition's average
--    Concept: CTE (WITH clause) + JOIN
WITH condition_avg AS (
    SELECT 
        Medical_Condition,
        AVG(Billing_Amount) AS avg_billing
    FROM healthcare
    GROUP BY Medical_Condition
)
SELECT 
    h.Name,
    h.Medical_Condition,
    h.Billing_Amount,
    ROUND(c.avg_billing, 2) AS condition_avg_billing
FROM healthcare h
JOIN condition_avg c ON h.Medical_Condition = c.Medical_Condition
WHERE h.Billing_Amount > c.avg_billing
ORDER BY h.Billing_Amount DESC
LIMIT 20;

-- 4. Top spender per insurance provider
--    Concept: ROW_NUMBER() window function with PARTITION BY + CTE
WITH ranked_patients AS (
    SELECT 
        Insurance_Provider,
        Name,
        Billing_Amount,
        ROW_NUMBER() OVER (PARTITION BY Insurance_Provider ORDER BY Billing_Amount DESC) AS rn
    FROM healthcare
)
SELECT *
FROM ranked_patients
WHERE rn = 1;
