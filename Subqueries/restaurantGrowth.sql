use leetcodesql;
# Create a Table
Create table If Not Exists Customer (customer_id int, name varchar(20), visited_on date, amount int);
Truncate table Customer;
insert into Customer (customer_id, name, visited_on, amount) values ('1', 'Jhon', '2019-01-01', '100');
insert into Customer (customer_id, name, visited_on, amount) values ('2', 'Daniel', '2019-01-02', '110');
insert into Customer (customer_id, name, visited_on, amount) values ('3', 'Jade', '2019-01-03', '120');
insert into Customer (customer_id, name, visited_on, amount) values ('4', 'Khaled', '2019-01-04', '130');
insert into Customer (customer_id, name, visited_on, amount) values ('5', 'Winston', '2019-01-05', '110');
insert into Customer (customer_id, name, visited_on, amount) values ('6', 'Elvis', '2019-01-06', '140');
insert into Customer (customer_id, name, visited_on, amount) values ('7', 'Anna', '2019-01-07', '150');
insert into Customer (customer_id, name, visited_on, amount) values ('8', 'Maria', '2019-01-08', '80');
insert into Customer (customer_id, name, visited_on, amount) values ('9', 'Jaze', '2019-01-09', '110');
insert into Customer (customer_id, name, visited_on, amount) values ('1', 'Jhon', '2019-01-10', '130');
insert into Customer (customer_id, name, visited_on, amount) values ('3', 'Jade', '2019-01-10', '150');

/*You are the restaurant owner and you want to analyze a possible expansion (there will be at least one customer every day).
Compute the moving average of how much the customer paid in a seven days window (i.e., current day + 6 days before). 
average_amount should be rounded to two decimal places.
Return the result table ordered by visited_on in ascending order.*/

# MySQL query statement below

SELECT visited_on, amount, ROUND(amount/7, 2) average_amount
FROM (
    SELECT DISTINCT visited_on, 
    SUM(amount) OVER(ORDER BY visited_on RANGE BETWEEN INTERVAL 6 DAY   PRECEDING AND CURRENT ROW) amount, 
    MIN(visited_on) OVER() 1st_date 
    FROM Customer
) as sq
WHERE visited_on>= 1st_date+6;

/*  Case failed for missing dates 
with cte as (
    Select visited_on, 
# get 7th day before including current date
        lag(visited_on, 6) over() started_on,
# outer sum is using window function in last 7 days after group sum ( inner sum ) is evaluated using group by
sum(sum(amount)) over (order by visited_on rows between 6 preceding and current row)  as amount, 
# outer average is using window function in last 7 days after inner sum is evaluated using group by
round(avg(sum(amount))  over (order by visited_on rows between 6 preceding and current row) ,2) as average_amount
from Customer
group by visited_on
order by visited_on)

# we just need to remove first 6 days, we can use where for that
select
    visited_on,
    amount,
    average_amount
from cte
where started_on is not null

 # using dense rank  
 SELECT DISTINCT visited_on, amount, ROUND(amount/7,2) as average_amount
 FROM
   (
     SELECT visited_on, 
     SUM(amount) OVER (ORDER BY visited_on range BETWEEN interval 6 day PRECEDING AND CURRENT ROW) AS amount, 
     dense_rank() over (ORDER BY visited_on) as rk
     FROM Customer
     ORDER BY visited_on
   ) AS t
 WHERE rk >= 7
 ORDER BY visited_on

# Using Joins
SELECT DISTINCT visited_on, amount, ROUND(amount/7,2) as average_amount
FROM
  (
    SELECT visited_on, 
    SUM(amount) OVER (ORDER BY visited_on range BETWEEN interval 6 day PRECEDING AND CURRENT ROW) AS amount
    FROM Customer
    ORDER BY visited_on
  ) AS t
CROSS JOIN (SELECT min(visited_on) AS first_date FROM customer) tt
WHERE datediff(visited_on, first_date) >= 6
ORDER BY visited_on*/
