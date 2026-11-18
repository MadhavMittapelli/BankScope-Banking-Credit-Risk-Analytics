use bank_risk;
-- 20. CTE: rank loan grades by default volume.
WITH Loan_Risk AS (
    SELECT
        Loan_Grade,
        COUNT(*) AS Defaulted_Loans
    FROM loan_data
    WHERE Loan_Status = 1
    GROUP BY Loan_Grade
)
SELECT
    Loan_Grade,
    Defaulted_Loans,
    RANK() OVER (ORDER BY Defaulted_Loans DESC) AS Risk_Rank
FROM Loan_Risk
ORDER BY Risk_Rank;


-- 21. CTE: identify loan purposes with an above-average loan amount.
WITH Purpose_Averages AS (
    SELECT
        Loan_Purpose,
        AVG(Loan_Amount) AS Average_Loan_Amount
    FROM loan_data
    GROUP BY Loan_Purpose
),
Overall_Average AS (
    SELECT AVG(Loan_Amount) AS Overall_Average_Loan_Amount
    FROM loan_data
)
SELECT
    p.Loan_Purpose,
    ROUND(p.Average_Loan_Amount, 2) AS Average_Loan_Amount,
    ROUND(o.Overall_Average_Loan_Amount, 2) AS Overall_Average_Loan_Amount
FROM Purpose_Averages AS p
CROSS JOIN Overall_Average AS o
WHERE p.Average_Loan_Amount > o.Overall_Average_Loan_Amount
ORDER BY p.Average_Loan_Amount DESC;