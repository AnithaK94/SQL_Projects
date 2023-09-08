use sqlinterview;
#Create a Table
DROP TABLE If  Exists Transactions;
Create table If Not Exists Transactions (id int PRIMARY KEY, country varchar(4), state enum('approved', 'declined'), amount int, trans_date date);
Truncate table Transactions;
insert into Transactions (id, country, state, amount, trans_date) values (121, 'US', 'approved', '1000', '2018-12-18');
insert into Transactions (id, country, state, amount, trans_date) values (122, 'US', 'declined', '2000', '2018-11-19');
insert into Transactions (id, country, state, amount, trans_date) values (123, 'US', 'approved', '2000', '2019-01-01');
insert into Transactions (id, country, state, amount, trans_date) values (124, 'DE', 'approved', '2000', '2019-01-07');
/*Write an SQL query to find for each month and country, the number of transactions and their total amount,
 the number of approved transactions and their total amount.
Return the result table in any order.*/
Select DATE_FORMAT(trans_date, '%Y-%m') as month ,country, 
       count(Year (trans_date)) as trans_count,
sum(case when state = "approved"  then 1 else 0 END ) as approved_count,                   sum(amount)trans_total_amount,
sum(case when state = "approved"  then amount else 0  end) as approved_total_amount
from Transactions
group by month, country

