use leet_code_easy;

# Creating a Table 

Create table If Not Exists Corders (order_number int, customer_number int);
Truncate table Corders;
insert into Corders (order_number, customer_number) values (1, 1)
insert into Corders (order_number, customer_number) values (2, 2)
insert into Corders (order_number, customer_number) values (3, 3)
insert into Corders (order_number, customer_number) values (4, 3)

/* Write a solution to find the customer_number for the customer who has placed the largest number of orders.
The test cases are generated so that exactly one customer will have placed more orders than any other customer.
The result format is in the following example. */

Select customer_number 
from Corders
group by customer_number
order by count(customer_number) desc
limit 1