# Bank Credit Risk Analysis — KPI Definitions

> **Source:** `Bank_credit_risk_analysis.pbix`  
> **Report title:** Credit Risk Analysis Dashboard  
> **Main data table referenced by the report:** `Loan_Data`

This document describes the five KPI cards present in the uploaded Power BI report, the dimensions used in its visuals, and the business questions the dashboard can support.

## 1. Project overview

The Credit Risk Analysis Dashboard presents loan portfolio and customer information to help users explore default patterns and the distribution of loans across customer and loan categories.

The report combines headline KPI cards with charts and slicers. Users can filter the report by loan grade, previous default, age category, and loan purpose.

## 2. KPI definitions

The report contains the following five KPI measures.

| KPI shown in report | Business definition | Suggested calculation | Display format |
|---|---|---|---|
| Total Customers | Count of records in the loan data table. It represents unique customers only if there is one row per customer. | Count rows in `Loan_Data` | Whole number |
| Default Customers | Count of records whose loan status indicates default. | Count rows where `Loan_Status` is the default value | Whole number |
| Default Rate | Share of records classified as default out of all records in the current filter context. | Default Customers ÷ Total Customers | Percentage |
| Total Loan Amount | Sum of loan amounts represented in the current filter context. | Sum of the loan amount column | Currency or numeric |
| Avg Interest Rate (%) | Average interest rate across records in the current filter context. | Average of the interest-rate column | Percentage or numeric with `%`, depending on source scale |

### KPI interpretation

#### Total Customers
Shows the size of the dataset under the current report filters. If the table contains multiple loans per customer, this KPI is a record/loan count rather than a distinct customer count.

#### Default Customers
Shows the number of records classified as default. Confirm the source coding of `Loan_Status` before interpreting the number.

#### Default Rate
Shows the proportion of default records among all records in the current filter context. A higher rate indicates a larger share of records classified as default; it should be interpreted alongside portfolio mix and data definitions.

#### Total Loan Amount
Shows the total loan principal represented by the filtered records. This is exposure represented in the dataset, not automatically the amount lost through defaults.

#### Avg Interest Rate (%)
Shows the arithmetic average of the interest-rate values in the filtered records. Confirm whether the source stores rates as decimals (for example, `0.125`) or percentage numbers (for example, `12.5`) so the card is formatted correctly.

## 3. Dashboard dimensions and filters

The report definition references these fields from `Loan_Data`:

| Field | How it is used |
|---|---|
| `Loan_Grade` | Category for comparing default counts; also used as a slicer |
| `Loan_Purpose` | Category for comparing total loan amount and loan-status counts; also used as a slicer |
| `Age_Category` | Category for customer-count distribution; also used as a slicer |
| `Previous_Default` | Category for comparing default counts; also used as a slicer |
| `Income_Category` | Category used in a treemap showing record counts |
| `Loan_Status` | Series/category used to split loan-purpose record counts |

## 4. Visuals identified in the report

| Visual | Field or measure | Intended analysis |
|---|---|---|
| KPI card | Default Rate | Overall default proportion |
| KPI card | Total Customers | Dataset/customer-record count |
| KPI card | Default Customers | Default record count |
| KPI card | Total Loan Amount | Total loan amount |
| KPI card | Avg Interest Rate (%) | Average interest rate |
| Clustered column chart | `Loan_Grade` and Default Customers | Compare default counts across loan grades |
| Clustered bar chart | `Loan_Purpose` and Total Loan Amount | Compare loan amounts by purpose |
| Donut chart | `Age_Category` and Total Customers | Show record/customer distribution by age category |
| Clustered column chart | `Previous_Default` and Default Customers | Compare default counts by previous-default category |
| Treemap | `Income_Category` and count of `Income_Category` | Show record distribution by income category |
| Bar chart | `Loan_Purpose`, `Loan_Status`, and count of `Loan_Purpose` | Compare record counts by loan purpose and loan status |

## 5. Business questions the dashboard can help answer

1. How many records/customers are included in the filtered loan portfolio?
2. How many records are classified as defaults?
3. What proportion of records are classified as defaults?
4. What is the total loan amount represented in the portfolio?
5. What is the average interest rate?
6. Which loan grades have the highest default counts?
7. Which loan purposes account for the largest total loan amount?
8. How are records distributed across age categories?
9. How do default counts vary by previous-default category?
10. How are records distributed across income categories?
11. How do loan-status counts vary by loan purpose?

The uploaded report layout identifies the questions and visual fields, but this document does not assert which category has the highest value. Use the actual report results to write data-backed findings.

## 6. Slicers and interactivity

The report includes slicers for:

- `Loan_Grade`
- `Previous_Default`
- `Age_Category`
- `Loan_Purpose`

Selecting a slicer value filters the visuals according to the report's interaction settings. KPI values should therefore be interpreted in the context of the active filters.

## 7. Tools and technologies

- **Power BI Desktop:** Report and dashboard development.
- **DAX:** KPI and measure calculations.
- **Power Query:** Data preparation and transformation, where used in the project.
- **Loan dataset:** Source of the fields and measures in `Loan_Data`.

## 8. Project conclusion

The Credit Risk Analysis Dashboard provides a consolidated view of loan records, default measures, loan amounts, and interest rates. Its category-based visuals and slicers allow users to examine how these metrics vary across loan grades, purposes, age groups, previous-default categories, and income categories.

The dashboard can support exploratory credit-risk monitoring. Lending or risk decisions should also consider validated business definitions, data quality, exposure, loss severity, time period, and the institution's formal risk policies.

## 9. Data and definition caveats

- The report layout confirms the KPI names and the visual fields, but does not reveal the original DAX expressions in readable form.
- The report layout alone does not establish whether a row represents a unique customer or an individual loan.
- Confirm the default/non-default coding in `Loan_Status`; do not assume the numeric value without checking the source data.
- Confirm the exact loan amount and interest-rate column names in the model.
- Confirm the interest-rate scale before applying percentage formatting.
- A defaulted loan amount is not necessarily the realized credit loss.
