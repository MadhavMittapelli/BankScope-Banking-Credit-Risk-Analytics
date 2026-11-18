use bank_risk;
--  window functions
-- ---------------------------------------------------------------------------

-- 1. Rank loan grades by number of defaults.
-- RANK() gives the same rank to ties and leaves gaps after tied ranks.
SELECT
    Loan_Grade,
    SUM(CASE WHEN Loan_Status = 1 THEN 1 ELSE 0 END) AS Defaulted_Loans,
    RANK() OVER (
        ORDER BY SUM(CASE WHEN Loan_Status = 1 THEN 1 ELSE 0 END) DESC
    ) AS Risk_Rank
FROM loan_data
GROUP BY Loan_Grade;


-- 2. Rank loan purposes by total loan amount.
-- DENSE_RANK() gives the same rank to ties without leaving gaps.
SELECT
    Loan_Purpose,
    ROUND(SUM(Loan_Amount), 2) AS Total_Loan_Amount,
    DENSE_RANK() OVER (
        ORDER BY SUM(Loan_Amount) DESC
    ) AS Loan_Amount_Rank
FROM loan_data
GROUP BY Loan_Purpose;