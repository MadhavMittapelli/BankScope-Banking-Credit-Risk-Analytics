# BankScope-Banking-Credit-Risk-Analytics
End-to-end banking credit risk analytics using Python, MySQL, and Power BI to explore loan defaults, customer segments, portfolio performance, and financial risk patterns.
Project Overview
BankScope is a banking and financial analytics project built to examine a loan portfolio, understand its composition, and explore how records classified as defaults are distributed across different loan and customer categories.

The project combines:
- Python and Jupyter Notebook for data inspection, cleaning, preparation, and exploratory analysis.
- MySQL for portfolio KPIs, aggregations, risk segmentation, CTEs, and window-function analysis.
- Power BI for an interactive Credit Risk Analysis Dashboard.
The analysis explores loan grade, loan purpose, debt burden, income category, interest-rate category, previous-default history, age, and credit-history segments.
Scope: This is a descriptive analytics project. It does not include a validated machine-learning default prediction model and should not be used as an automated lending or credit-approval system.

Project Highlights
- Analyzed a final dataset of 32,409 loan records across 19 columns.
- Recorded 7,088 default records and an overall default rate of 21.87%.
- Examined default patterns by loan grade, debt burden, previous-default history, interest-rate category, loan purpose, and income category.
- Prepared SQL scripts for portfolio-level and segment-level analysis.
- Built a Power BI dashboard with five headline KPI cards and interactive slicers.
- Documented data preparation, KPI definitions, DAX recommendations, and business findings.
Dashboard Preview
<img width="1010" height="571" alt="image" src="https://github.com/user-attachments/assets/2a934e2a-5ecb-4585-9578-69486b9203a9" />



The Power BI report includes these KPI cards:
KPI	Meaning
Total Customers	Count of records in the loan table; not necessarily distinct customers
Default Customers	Count of records classified as default
Default Rate	Default records divided by all records in the current filter context
Total Loan Amount	Sum of loan amounts represented in the filtered records
Avg Interest Rate (%)	Average interest-rate value; confirm source scale before percentage formatting


Dashboard slicers: Loan_Grade, Previous_Default, Age_Category, and Loan_Purpose.
Key Business Findings
The following figures are based on the supplied final dataset and the accompanying business analysis.
Portfolio summary
Metric	Result
Final loan records	32,409
Default records	7,088
Non-default records	25,321
Overall default rate	21.87%
Total loan amount	310,882,900
Average loan amount	9,592.49
Average interest-rate value	11.02


Default rate by selected segments
Segment	Category	Default rate
Loan grade	G	98.44%
Loan grade	F	70.54%
Loan grade	E	64.49%
Debt burden	Very High Burden	70.43%
Previous default	Yes	37.86%
Interest-rate category	Very High Interest	57.98%
Loan purpose	Debt consolidation	28.68%
Income category	Low Income	37.75%


Interpretation: These are observed segment-level rates, not evidence that a category causes default. Small groups can produce unstable percentages; for example, Loan Grade G contains only 64 records. Review segment sizes and definitions before drawing conclusions.

For the full breakdown, recommendations, methodology notes, and limitations, see [`reports/business_analysis.md`](reports/business_analysis.md).
Dataset
The repository contains three dataset stages:
File	Description
data/raw_data.csv	Original source dataset
data/cleaned_data.csv	Cleaned dataset
data/final_data.csv	Final analysis dataset with derived categories


The final dataset contains 32,409 rows and 19 columns.
Main fields
- Customer profile: Age, Income, Home_Ownership, Employment_Years
- Loan details: Loan_Purpose, Loan_Grade, Loan_Amount, Interest_Rate, Loan_Status
- Credit and affordability: Loan_to_Income_Ratio, Previous_Default, Credit_History_Years
- Derived categories: Age_Category, Income_Category, Employment_Category, Credit_History_Category, Loan_Size_Category, Debt_Burden, Interest_Rate_Category
Data quality summary
The included reports/data_quality_summary.json records:
Data-quality item	Recorded result
Source rows	32,581
Rows after cleaning	32,409
Duplicate rows removed	165
Invalid-age rows removed	5
Invalid-employment rows removed	2
Missing employment years before imputation	887
Missing interest rates before imputation	3,094
Remaining missing values	8 in Debt_Burden
Duplicate rows remaining	0


The JSON file is the source for these recorded data-quality figures. See the notebook for the preparation workflow and exact transformations.
Repository Structure
BankScope-Credit-Risk-Intelligence/
│
├── data/
│   ├── raw_data.csv
│   ├── cleaned_data.csv
│   └── final_data.csv
│
├── notebooks/
│   └── analysis.ipynb
│
├── sql/
│   ├── analysis.sql
│   ├── risk_analysis.sql
│   ├── cte.sql
│   ├── window_function.sql
│   └── customer _&_loan_portfolio_analysis.sql
│
├── powerbi/
│   ├── Bank_credit_risk_analysis.pbix
│   ├── DAX_Measures.md
│   ├── KPI_Definitions.md
│   └── screenshot/
│
├── reports/
│   ├── data_quality_summary.json
│   └── business_analysis.md
│
├── screenshots/
│   ├── Credit Risk Analysis Dashboard.png
│   ├── age_distribution.png
│   ├── default_by_debt_burden.png
│   ├── default_by_grade.png
│   └── loan_purpose.png
│
└── README.md
Tools and Technologies
Tool	Use in this project
Python	Data inspection, cleaning, and analysis
pandas / NumPy	Data manipulation and numerical operations
Matplotlib	Exploratory data visualizations
Jupyter Notebook	Reproducible analysis workflow
MySQL	KPI queries and portfolio/risk analysis
Power BI	Interactive dashboard and reporting
DAX	Power BI measures


Getting Started
1. Clone the repository
git clone https://github.com/<your-username>/BankScope-Credit-Risk-Intelligence.git
cd BankScope-Credit-Risk-Intelligence
2. Set up Python
Create and activate a virtual environment if desired.
python -m venv .venv
On Windows:
.venv\Scripts\activate
Install the main packages used for the analysis:
pip install pandas numpy matplotlib jupyter
Launch Jupyter Notebook:
jupyter notebook
Open notebooks/analysis.ipynb. Keep the repository folder structure intact so relative dataset paths continue to work.
3. Set up MySQL
1. Open MySQL Workbench and connect to your MySQL server.
2. Open and execute sql/analysis.sql. It creates the bank_risk database and the loan_data table.
3. Use the MySQL Table Data Import Wizard to import data/final_data.csv into bank_risk.loan_data.
4. Check that the imported columns and their order match the table definition.
5. Run the remaining scripts:
   - sql/risk_analysis.sql
   - sql/cte.sql
   - sql/window_function.sql
   - sql/customer _&_loan_portfolio_analysis.sql
The table definition in analysis.sql contains 19 fields corresponding to the final dataset. Verify the import and column mapping before running analysis queries.
4. Open the Power BI report
1. Open powerbi/Bank_credit_risk_analysis.pbix in Power BI Desktop.
2. If prompted, update the data source to the location of data/final_data.csv or your MySQL table, depending on the report's configured source.
3. Confirm table and column names in the Fields pane.
4. Refresh the report and verify the KPI values against the SQL results.
The PBIX may contain a source path from the original development environment, so it may need to be updated on another computer.
SQL Analysis
The SQL folder contains scripts for:
- Creating the bank_risk database and loan_data table.
- Calculating total records, default records, non-default records, default rate, and loan amount metrics.
- Comparing default patterns across loan grades and other risk categories.
- Analyzing customer and loan portfolio segments.
- Using Common Table Expressions (CTEs).
- Applying window functions for analytical comparisons and rankings.
Power BI Documentation
Additional Power BI documentation is available in the powerbi/ folder:
- [`DAX_Measures.md`](powerbi/DAX_Measures.md) — documented KPI measure names and suggested DAX implementations.
- [`KPI_Definitions.md`](powerbi/KPI_Definitions.md) — KPI meanings, dashboard fields, visuals, slicers, and business questions.
The suggested DAX formulas are documented implementations and are not claimed to be the original expressions embedded in the PBIX.
Business Analysis
The detailed business analysis is available at [`reports/business_analysis.md`](reports/business_analysis.md). It includes:
- Executive summary and project objectives.
- Portfolio KPIs.
- Default-rate comparisons by loan grade, debt burden, previous default, interest-rate category, loan purpose, and income category.
- Business recommendations.
- Data quality summary.
- Dashboard and SQL analysis notes.
- Limitations and conclusion.
Important Assumptions and Limitations
1. The SQL and DAX documentation assumes Loan_Status = 1 means default and Loan_Status = 0 means non-default. Verify this coding against the dataset before interpreting results.
2. The dashboard's Total Customers measure is documented as a row count. It is a unique-customer count only if each row represents one distinct customer.
3. The average interest-rate value is 11.02. Confirm whether the source stores rates as percentage numbers or decimals before formatting the KPI.
4. Total loan amount is not the same as default loss or realized credit loss.
5. Segment comparisons are descriptive and do not establish causation.
6. Small category groups may have unstable default rates.
7. The project does not provide a validated predictive model or an automated lending decision system.
8. Confirm the dataset source, license, and sharing permissions before publishing it publicly. Do not publish confidential or personally identifiable information.
Future Improvements
- Add a requirements.txt file with pinned dependency versions.
- Add a data dictionary describing all dataset columns.
- Automate the CSV-to-MySQL import process.
- Add repeatable data validation checks.
- Reconcile dashboard measures with SQL outputs.
- Add time-based analysis if reliable date fields become available.
- Extend the project with a separately validated predictive model if suitable data and evaluation methodology are available.
Author
Madhav Mittapelli
If you find this project useful, consider giving the repository a ⭐.
