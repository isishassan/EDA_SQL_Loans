-- Q1: What is the no of loans, average loan amount, avg credit score and avg interest rate per employment status?

SELECT employment_status
, count(id) as no_of_loans
, round(avg(loan_amount),2) as avg_loan
, round(avg(credit_score),2) as avg_credit_score
, round(avg(interest_rate),2) as avg_interest_rate
FROM train
GROUP BY 1
ORDER BY 1;

---- Q2: What is the no of loans, average loan amount, avg credit score and avg interest rate per loan purpose?

SELECT loan_purpose
, count(id) as no_of_loans
, round(avg(loan_amount),2) as avg_loan
, round(avg(credit_score),2) as avg_credit_score
, round(avg(interest_rate),2) as avg_interest_rate
FROM train
GROUP BY 1
ORDER BY 1;

-- Q3: What is the no. of loans per loan type/employment status?

SELECT
employment_status as EmploymentStatus,
SUM(CASE WHEN loan_purpose = 'Other' THEN 1 ELSE 0 END) AS Other,
SUM(CASE WHEN loan_purpose = 'Debt consolidation' THEN 1 ELSE 0 END) AS DebtConsolidation,
SUM(CASE WHEN loan_purpose = 'Home' THEN 1 ELSE 0 END) AS Home,
SUM(CASE WHEN loan_purpose = 'Education' THEN 1 ELSE 0 END) AS Education,
SUM(CASE WHEN loan_purpose = 'Vacation' THEN 1 ELSE 0 END) AS Vacation,
SUM(CASE WHEN loan_purpose = 'Car' THEN 1 ELSE 0 END) AS Car,
SUM(CASE WHEN loan_purpose = 'Medical' THEN 1 ELSE 0 END) AS Medical,
SUM(CASE WHEN loan_purpose = 'Business' THEN 1 ELSE 0 END) AS Business
FROM train
GROUP BY 1
ORDER BY 1;

--Q4: What is the count and sum of loans (in millions) per employee status?

SELECT
employment_status,
count(id) as count_loans,
ROUND(SUM(loan_amount)/1000000,1) as sum_loan_millions
FROM train
GROUP BY 1
ORDER BY 3 DESC;

-- Q5: What is the count and sum of loans per loan purpose?

SELECT	
loan_purpose,	
count(id) as count_loans,
ROUND(SUM(loan_amount)/1000000,1) as sum_loan_millions
FROM train	
GROUP BY 1	
ORDER BY 3 DESC;


--Q6: What is the avg loan to annual income ratio per employment status?

SELECT	
employment_status,	
	cast(round(avg(annual_income)) as integer) as avg_annual_income,
	cast(round(avg(loan_amount)) as integer) as avg_loan_amount,
	round((avg(loan_amount) / avg(annual_income) * 100),1) || "%" as loan_to_annual_income_ratio
FROM train	
GROUP BY 1
ORDER BY 4 DESC;

-- Q7 From which three loan purposes is the bank earning the most interest per year?

SELECT	
loan_purpose,	
	round(avg(interest_rate),2) as avg_interest_rate,
	round(avg(loan_amount)) as avg_loan_amount,
	round((avg(interest_rate)) * avg(loan_amount) /1000,1) || "K" as avg_interest_paid_this_year_thousands
FROM train	
GROUP BY 1	
ORDER BY 4 DESC
LIMIT 3;

-- Q8: What is the no. of loans and sum of loans given per credit score category?

SELECT	
case when credit_score >= 800 then '1 - No Risk'	
	when credit_score between 700 and 799 then '2 - Low Risk'
	when credit_score between 600 and 699 then '3 - Medium Risk'
	when credit_score between 500 and 599 then '4 - High Risk'
	when credit_score between 0 and 499 then '5 - Extreme Risk'
	else null
	end as credit_score_category,
	count(id) as no_of_loans,
	ROUND(SUM(loan_amount)/1000000,1) as sum_loan_millions
FROM train	
GROUP BY 1	
ORDER BY 1;

-- using additional columns, not originally part of the project scope

--Q9: What is the avg debt to income ratio per credit score category?

SELECT	
case when credit_score >= 800 then '1 -No Risk'	
	when credit_score between 700 and 799 then '2 - Low Risk'
	when credit_score between 600 and 699 then '3 - Medium Risk'
	when credit_score between 500 and 599 then '4 - High Risk'
	when credit_score between 0 and 499 then '5 - Too Risky'
	else null
	end as credit_score_category,
	ROUND(avg(debt_to_income_ratio) *100,1) || "%" as avg_debt_to_income_ratio
FROM train	
GROUP BY 1	
ORDER BY 1;


--Q10: What is the min/max/avg interest rate per grade_subgrade?

SELECT grade_subgrade,
min(interest_rate) as min_interest_rate,
round(avg(interest_rate),2) as avg_interest_rate,
max(interest_rate) as max_interest_rate
FROM train
GROUP BY 1
ORDER BY 1