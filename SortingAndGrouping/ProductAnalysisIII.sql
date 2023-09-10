use sqlinterview;
#Create a Table
Create table If Not Exists Sales (sale_id int, product_id int, year int, quantity int, price int);
Create table If Not Exists Pproduct (product_id int, product_name varchar(10));
Truncate table Sales;
insert into Sales (sale_id, product_id, year, quantity, price) values ('1', '100', '2008', '10', '5000');
insert into Sales (sale_id, product_id, year, quantity, price) values ('2', '100', '2009', '12', '5000');
insert into Sales (sale_id, product_id, year, quantity, price) values ('7', '200', '2011', '15', '9000');
Truncate table Pproduct;
insert into Pproduct (product_id, product_name) values ('100', 'Nokia');
insert into Pproduct (product_id, product_name) values ('200', 'Apple');
insert into Pproduct (product_id, product_name) values ('300', 'Samsung');
/* Write a solution to select the product id, year, quantity, and price for the first year of every product sold.
Return the resulting table in any order. */
/* SELECT product_id, year as first_year, quantity, price 
from Sales 
where (product_id, year) in (
        SELECT product_id, min(year) as year 
        from Sales 
        group by product_id 
        ) */
        
WITH CTE AS (
  SELECT MIN(year) as year, product_id 
  FROM Sales
  GROUP BY product_id
)

SELECT s.product_id, s.year AS first_year, s.quantity, s.price
FROM Sales s
INNER JOIN CTE c
ON s.product_id = c.product_id AND s.year = c.year