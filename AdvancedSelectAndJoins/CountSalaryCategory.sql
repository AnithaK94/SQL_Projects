use leetcodesql;
#Create a Table
Create table If Not Exists Accounts (account_id int, income int);
Truncate table Accounts;
insert into Accounts (account_id, income) values ('3', '108939');
insert into Accounts (account_id, income) values ('2', '12747');
insert into Accounts (account_id, income) values ('8', '87709');
insert into Accounts (account_id, income) values ('6', '91796');

/* Write a solution to calculate the number of bank accounts for each salary category. The salary categories are:

"Low Salary": All the salaries strictly less than $20000.
"Average Salary": All the salaries in the inclusive range [$20000, $50000].
"High Salary": All the salaries strictly greater than $50000.
The result table must contain all three categories. If there are no accounts in a category, return 0.

Return the result table in any order.  */

## MySQL query statement below
(select 
"Low Salary" as category,
(select count(*)  from Accounts where income < 20000) as accounts_count)
union all
(select 
"Average Salary" as category,
(select count(*)  from Accounts where income  between 20000 and 50000) as accounts_count)
union all
(select 
"High Salary" as category,
(select count(*)  from Accounts where income > 50000) as accounts_count)
order by accounts_count desc
