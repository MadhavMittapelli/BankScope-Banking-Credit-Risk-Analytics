# Bank Credit Risk Analysis — DAX Measures

> **Source:** `Bank_credit_risk_analysis.pbix`  
> **Table used by the report:** `Loan_Data`

This file documents the five KPI measures used by the report and provides additional recommended measures.

## Important validation note

The PBIX report definition confirms these existing measure names:

- `Default Rate`
- `Total Customers`
- `Default Customers`
- `Total Loan Amount`
- `Avg Interest Rate (%)`

The report definition exposes the measure names and the visuals that use them, but it does **not** expose the original DAX expressions in a readable form here. Therefore, the formulas below are recommended implementations, not verified copies of the original measures.

The report references the columns `Loan_Status`, `Loan_Grade`, `Loan_Purpose`, `Age_Category`, `Previous_Default`, and `Income_Category`. The suggested amount and interest-rate column names below (`Loan_Amount` and `Interest_Rate`) must be checked against the actual Fields pane in Power BI.

The formulas assume `Loan_Status = 1` means default and `Loan_Status = 0` means non-default. Confirm this coding in your source data before using the measures.

---

## 1. Core dashboard measures

Create each measure using **Modeling → New measure**.

### Total Customers

```dax
Total Customers =
COUNTROWS('Loan_Data')
```

Counts the rows in the loan data table. This represents total records, and represents unique customers only if each customer has exactly one row.

### Default Customers

```dax
Default Customers =
CALCULATE(
    COUNTROWS('Loan_Data'),
    'Loan_Data'[Loan_Status] = 1
)
```

Counts records marked as default, assuming `1` represents default.

### Default Rate

```dax
Default Rate =
DIVIDE(
    [Default Customers],
    [Total Customers],
    0
)
```

Format this measure as **Percentage** in Power BI.

### Total Loan Amount

```dax
Total Loan Amount =
SUM('Loan_Data'[Loan_Amount])
```

Uses the proposed column name `Loan_Amount`. Replace it with the exact loan amount column name in your model if different. Format as currency or a suitable numeric format.

### Avg Interest Rate (%)

```dax
Avg Interest Rate (%) =
AVERAGE('Loan_Data'[Interest_Rate])
```

Uses the proposed column name `Interest_Rate`. Replace it with the exact interest-rate column name in your model if different.

**Formatting:** If the source stores 0.125 for 12.5%, format the measure as Percentage. If it stores 12.5 for 12.5%, use a decimal number format and append `%` as a display suffix; do not apply Percentage formatting because that would display 1250%.

---

## 2. Additional recommended measures

These are optional additions and are not confirmed as existing measures in the PBIX.

### Non-Default Customers

```dax
Non-Default Customers =
CALCULATE(
    COUNTROWS('Loan_Data'),
    'Loan_Data'[Loan_Status] = 0
)
```

Assumes `0` represents non-default.

### Non-Default Rate

```dax
Non-Default Rate =
DIVIDE(
    [Non-Default Customers],
    [Total Customers],
    0
)
```

Format as Percentage.

### Average Loan Amount

```dax
Average Loan Amount =
AVERAGE('Loan_Data'[Loan_Amount])
```

Uses the proposed `Loan_Amount` column name.

### Default Loan Amount

```dax
Default Loan Amount =
CALCULATE(
    SUM('Loan_Data'[Loan_Amount]),
    'Loan_Data'[Loan_Status] = 1
)
```

Calculates the total loan amount associated with records marked as default. Confirm that this is the business definition you want; it is not necessarily the same as the amount of money ultimately lost.

### Default Record Count

```dax
Default Record Count =
CALCULATE(
    COUNTROWS('Loan_Data'),
    'Loan_Data'[Loan_Status] = 1
)
```

This is equivalent to the recommended `Default Customers` measure when one row represents one customer. If customers can have multiple loans, use a unique customer ID and `DISTINCTCOUNT` instead.

---

## 3. Suggested visual usage

| Measure | Suggested visual |
|---|---|
| Total Customers | KPI card |
| Default Customers | KPI card |
| Default Rate | KPI card |
| Total Loan Amount | KPI card |
| Avg Interest Rate (%) | KPI card |
| Default Customers | Column chart by `Loan_Grade` |
| Total Loan Amount | Bar chart by `Loan_Purpose` |
| Total Customers | Donut chart by `Age_Category` |
| Default Customers | Column chart by `Previous_Default` |
| Default Record Count or row count | Chart by `Loan_Purpose` and `Loan_Status` |

## 4. How to add a measure in Power BI

1. Open the report in Power BI Desktop.
2. In the Fields/Data pane, select the `Loan_Data` table.
3. Select **Modeling → New measure**.
4. Paste one formula from this file into the formula bar.
5. Press Enter.
6. Set the measure's format from the Measure tools ribbon.
7. Add the measure to the appropriate card or chart.

## 5. Final checks before publishing

- Confirm whether one row represents one customer or one loan.
- Confirm the meaning of `Loan_Status` values, especially whether `1` means default.
- Confirm the actual loan amount and interest-rate column names.
- Check whether the interest rate is stored as a decimal or as a percentage number.
- Test each measure against a filtered table visual and a few manually checked records.
