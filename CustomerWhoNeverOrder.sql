use leet_code_easy;
#Create a Table
Create table If Not Exists Customers (id int, name varchar(255))
Create table If Not Exists CNOrders (id int, customerId int)
Truncate table Customers
insert into Customers (id, name) values ('1', 'Joe')
insert into Customers (id, name) values ('2', 'Henry')
insert into Customers (id, name) values ('3', 'Sam')
insert into Customers (id, name) values ('4', 'Max')
Truncate table CNOrders
insert into CNOrders (id, customerId) values ('1', '3')
insert into CNOrders (id, customerId) values ('2', '1')
/* Write a solution to find all customers who never order anything.
Return the result table in any order.  */
Select cust.name as Customers
from Customers cust 
Left Join CNOrders od
on cust.id = od.customerId
where od.customerId is null