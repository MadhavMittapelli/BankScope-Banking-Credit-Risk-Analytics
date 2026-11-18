USE bank_risk;
-- Risk analysis

-- 1. Loan count, default count and default rate by loan grade.
SELECT
    Loan_Grade,
    COUNT(*) AS Total_Loans,
    SUM(CASE WHEN Loan_Status = 1 THEN 1 ELSE 0 END) AS Defaulted_Loans,
    ROUND(
        100.0 * SUM(CASE WHEN Loan_Status = 1 THEN 1 ELSE 0 END)
        / NULLIF(COUNT(Loan_Status), 0),
        2
    ) AS Default_Rate_Percent
FROM loan_data
GROUP BY Loan_Grade
ORDER BY Default_Rate_Percent DESC;


-- 2. Default rate by debt burden category.
SELECT
    Debt_Burden,
    COUNT(*) AS Total_Loans,
    SUM(CASE WHEN Loan_Status = 1 THEN 1 ELSE 0 END) AS Defaulted_Loans,
    ROUND(
        100.0 * SUM(CASE WHEN Loan_Status = 1 THEN 1 ELSE 0 END)
        / NULLIF(COUNT(Loan_Status), 0),
        2
    ) AS Default_Rate_Percent
FROM loan_data
GROUP BY Debt_Burden
ORDER BY Default_Rate_Percent DESC;


-- 3. Default rate by previous default history.
SELECT
    Previous_Default,
    COUNT(*) AS Total_Loans,
    SUM(CASE WHEN Loan_Status = 1 THEN 1 ELSE 0 END) AS Defaulted_Loans,
    ROUND(
        100.0 * SUM(CASE WHEN Loan_Status = 1 THEN 1 ELSE 0 END)
        / NULLIF(COUNT(Loan_Status), 0),
        2
    ) AS Default_Rate_Percent
FROM loan_data
GROUP BY Previous_Default
ORDER BY Default_Rate_Percent DESC;


-- 4. Default rate by interest-rate category.
SELECT
    Interest_Rate_Category,
    COUNT(*) AS Total_Loans,
    SUM(CASE WHEN Loan_Status = 1 THEN 1 ELSE 0 END) AS Defaulted_Loans,
    ROUND(
        100.0 * SUM(CASE WHEN Loan_Status = 1 THEN 1 ELSE 0 END)
        / NULLIF(COUNT(Loan_Status), 0),
        2
    ) AS Default_Rate_Percent
FROM loan_data
GROUP BY Interest_Rate_Category
ORDER BY Default_Rate_Percent DESC;


-- 5. Default rate by credit-history category.
SELECT
    Credit_History_Category,
    COUNT(*) AS Total_Loans,
    SUM(CASE WHEN Loan_Status = 1 THEN 1 ELSE 0 END) AS Defaulted_Loans,
    ROUND(
        100.0 * SUM(CASE WHEN Loan_Status = 1 THEN 1 ELSE 0 END)
        / NULLIF(COUNT(Loan_Status), 0),
        2
    ) AS Default_Rate_Percent
FROM loan_data
GROUP BY Credit_History_Category
ORDER BY Default_Rate_Percent DESC;