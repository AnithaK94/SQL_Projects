use sqlinterview;
#Create a Table
Create table If Not Exists Ccustomer (customer_id int, product_key int);
Create table Product (product_key int);
Truncate table Ccustomer;
insert into Ccustomer (customer_id, product_key) values ('1', '5');
insert into Ccustomer (customer_id, product_key) values ('2', '6');
insert into Ccustomer (customer_id, product_key) values ('3', '5');
insert into Ccustomer (customer_id, product_key) values ('3', '6');
insert into Ccustomer (customer_id, product_key) values ('1', '6');
Truncate table Product;
insert into Product (product_key) values ('5');
insert into Product (product_key) values ('6');
/* Write a solution to report the customer ids from the Customer table that bought all the products in the Product table.
Return the result table in any order. */
Select customer_id 
 from ccustomer 
 group by customer_id
 having count(Distinct product_key) = (Select count(*) from Product);