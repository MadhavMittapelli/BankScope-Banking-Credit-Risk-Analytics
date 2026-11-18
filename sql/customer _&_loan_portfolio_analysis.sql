use bank_risk;
-- Customer and loan portfolio analysis

-- 1. Customer distribution by age category.
SELECT
    Age_Category,
    COUNT(*) AS Total_Customers
FROM loan_data
GROUP BY Age_Category
ORDER BY Total_Customers DESC;


-- 2. Customer distribution by income category.
SELECT
    Income_Category,
    COUNT(*) AS Total_Customers
FROM loan_data
GROUP BY Income_Category
ORDER BY Total_Customers DESC;


-- 3. Customer distribution by employment category.
SELECT
    Employment_Category,
    COUNT(*) AS Total_Customers
FROM loan_data
GROUP BY Employment_Category
ORDER BY Total_Customers DESC;


-- 4. Loan volume and total amount by loan purpose.
SELECT
    Loan_Purpose,
    COUNT(*) AS Total_Loans,
    ROUND(SUM(Loan_Amount), 2) AS Total_Loan_Amount
FROM loan_data
GROUP BY Loan_Purpose
ORDER BY Total_Loan_Amount DESC;


-- 5. Average interest rate by loan grade.
SELECT
    Loan_Grade,
    ROUND(AVG(Interest_Rate), 2) AS Average_Interest_Rate
FROM loan_data
GROUP BY Loan_Grade
ORDER BY Average_Interest_Rate DESC;


-- 6. Average loan-to-income ratio by loan purpose.
SELECT
    Loan_Purpose,
    ROUND(AVG(Loan_to_Income_Ratio), 4) AS Average_Loan_to_Income_Ratio
FROM loan_data
GROUP BY Loan_Purpose
ORDER BY Average_Loan_to_Income_Ratio DESC;