USE bank;

-- Lesson 2.07 - Activity 1
-- In the loan table (which is part of the bank database), there's column status A, B, C, and D. 
-- Using the case statement we will create a new column with the values there with a brief description:
-- 'A' : 'Good - Contract Finished'
-- 'B' : 'Defaulter - Contract Finished'
-- 'C' : 'Good - Contract Running'
-- 'D' : 'In Debt - Contract Running'

SELECT loan_id, account_id, status AS category,
CASE
WHEN status = 'A' then 'Good - contract finished'
WHEN status = 'B' then 'Defaulter - contract finished'
WHEN status = 'C' then 'Good - contract ongoing'
WHEN status = 'D' then 'In Debt - contract ongoing'
ELSE 'No status'
END AS 'new_description'
FROM bank.loan;

-- Lesson 2.07 - Activity 2
-- In the class, we looked at an example where the problem statement was 
-- "What is the average loan amount taken by customers in each of the status categories? Arrange them from highest to lowest" The query is shown below: 
-- Your objective is to find the maximum and the minimum in each Status category.

SELECT avg(amount) as Average, status 
FROM bank.loan
GROUP BY Status
ORDER BY Average ASC;

SELECT MAX(amount) 
FROM bank.loan l;
GROUP BY l.status = 'A';

SELECT * 
FROM bank.loan;
