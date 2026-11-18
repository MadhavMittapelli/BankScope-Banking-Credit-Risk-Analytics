CREATE DATABASE IF NOT EXISTS bank_risk
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE bank_risk;
CREATE TABLE IF NOT EXISTS loan_data (
    Age                         INT NULL,
    Income                      BIGINT NULL,
    Home_Ownership               VARCHAR(30) NULL,
    Employment_Years             DECIMAL(6,2) NULL,
    Loan_Purpose                 VARCHAR(40) NULL,
    Loan_Grade                   VARCHAR(5) NULL,
    Loan_Amount                  DECIMAL(12,2) NULL,
    Interest_Rate                DECIMAL(6,2) NULL,
    Loan_Status                  TINYINT NULL,
    Loan_to_Income_Ratio         DECIMAL(8,4) NULL,
    Previous_Default             CHAR(1) NULL,
    Credit_History_Years         INT NULL,
    Age_Category                 VARCHAR(30) NULL,
    Income_Category              VARCHAR(30) NULL,
    Employment_Category          VARCHAR(30) NULL,
    Credit_History_Category      VARCHAR(40) NULL,
    Loan_Size_Category           VARCHAR(30) NULL,
    Debt_Burden                  VARCHAR(30) NULL,
    Interest_Rate_Category       VARCHAR(30) NULL,

    -- Useful indexes for common filters and group-by analysis.
    INDEX idx_loan_status (Loan_Status),
    INDEX idx_loan_grade (Loan_Grade),
    INDEX idx_loan_purpose (Loan_Purpose),
    INDEX idx_debt_burden (Debt_Burden)
) ENGINE=InnoDB;

-- View the table structure.
DESCRIBE loan_data;

-- Preview a few imported rows.
SELECT *
FROM loan_data
LIMIT 100;

-- Key Performance Indicators (KPIs)

-- 1. Total number of loan records.
SELECT
    COUNT(*) AS Total_Loan_Records
FROM loan_data;


-- 2. Number of defaulted loans.
-- Assumption: Loan_Status = 1 means default.
SELECT
    SUM(CASE WHEN Loan_Status = 1 THEN 1 ELSE 0 END) AS Defaulted_Loans
FROM loan_data;


-- 3. Number of non-defaulted loans.
SELECT
    SUM(CASE WHEN Loan_Status = 0 THEN 1 ELSE 0 END) AS Non_Defaulted_Loans
FROM loan_data;


-- 4. Overall default rate as a percentage.
-- NULLIF prevents division by zero if the table is empty.
SELECT
    ROUND(
        100.0 * SUM(CASE WHEN Loan_Status = 1 THEN 1 ELSE 0 END)
        / NULLIF(COUNT(Loan_Status), 0),
        2
    ) AS Default_Rate_Percent
FROM loan_data;


-- 5. Total loan amount issued.
SELECT
    ROUND(SUM(Loan_Amount), 2) AS Total_Loan_Amount
FROM loan_data;


-- 6. Average loan amount.
SELECT
    ROUND(AVG(Loan_Amount), 2) AS Average_Loan_Amount
FROM loan_data;

--  summary

-- One-row summary for quick project reporting.
SELECT
    COUNT(*) AS Total_Loans,
    SUM(CASE WHEN Loan_Status = 1 THEN 1 ELSE 0 END) AS Defaulted_Loans,
    SUM(CASE WHEN Loan_Status = 0 THEN 1 ELSE 0 END) AS Non_Defaulted_Loans,
    ROUND(AVG(Loan_Amount), 2) AS Average_Loan_Amount,
    ROUND(AVG(Interest_Rate), 2) AS Average_Interest_Rate,
    ROUND(
        100.0 * SUM(CASE WHEN Loan_Status = 1 THEN 1 ELSE 0 END)
        / NULLIF(COUNT(Loan_Status), 0),
        2
    ) AS Default_Rate_Percent
FROM loan_data;


