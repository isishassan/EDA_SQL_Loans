# Exploratory Analysis of Borrower Characteristics and Loan Conditions  
*(EDA & SQL)*

## 1. Project Description
An exploratory data analysis project examining relationships between borrower characteristics and loan attributes using Python-based EDA and SQL queries.

This project was a collaboration with [Harmandeep Singh](https://github.com/harmandeep2993/harmandeep2993)

## 2. Dataset Description
- **Source:** [Predicting Loan Payback](https://www.kaggle.com/competitions/playground-series-s5e11/data) from kagglehub
- **Observations:** Loan-level records (rows represent individual loans)
- **Key Variables:**
  - **Borrower characteristics:** `credit_score`, `annual_income`, `employment_status`
  - **Loan attributes:** `loan_amount`, `interest_rate`, `loan_purpose`
- **Notes & Quirks:**
  - Dataset is synthetic but designed to resemble real-world loan data
  - Data quality checks were performed for missing values, duplicates, and incorrect data types
  - An identifier column was removed as it was not analytically relevant

## 3. Research Goal / Questions
The goal of this project is to explore how borrower characteristics relate to loan conditions.

**Main research questions:**
- How does credit score influence loan attributes such as interest rate, loan amount, and loan purpose?
- How does a borrower’s annual income relate to the size of the loan issued?
- How do loan characteristics (amount, interest rate, purpose) vary across different employment statuses?

## 4. Steps Taken
- **Data Cleaning**
  - Inspected structure, summary statistics, and data types
  - Checked for duplicate rows and irrelevant columns
  - Dropped columns not needed to answer research questions. Columns kept:
      - id: loan id, set as index
      - *Borrower characteristics: `credit_score`, `annual_income`, `employment_status`
      - Loan attributes: `loan_amount`, `interest_rate`, `loan_purpose`
- **Exploratory Data Analysis (EDA)**
  - Univariate analysis of numerical and categorical variables
  - Bivariate analysis to examine relationships between borrower and loan variables
- **SQL Analysis**
  - Translated EDA insights into descriptive SQL questions
  - Used SQL queries to validate and summarize observed patterns
- **Visualization**
  - Histograms, boxplots, scatter plots, and bar charts
  - Each visualization followed by concise interpretive commentary

## 5. Main Findings
- Borrowers with higher credit scores tend to receive lower interest rates.
- No meaningful correlation between other variables

## 6. Next Steps / Ideas for Improvement
- Extend the analysis with multivariate techniques.
- Build a predictive model for loan amount or interest rate.
- Incorporate additional borrower attributes (e.g., debt-to-income ratio).
- Validate findings using a real-world (non-synthetic) dataset.

## 7. Repository Structure
- Python File
- SQL Queries
- Presentation
- Project Plan


