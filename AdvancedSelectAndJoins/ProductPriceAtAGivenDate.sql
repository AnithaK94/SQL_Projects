use sqlinterview;
#create a Table
Create table If Not Exists Pproducts (product_id int, new_price int, change_date date);
Truncate table Pproducts;
insert into Pproducts (product_id, new_price, change_date) values ('1', '20', '2019-08-14');
insert into Pproducts (product_id, new_price, change_date) values ('2', '50', '2019-08-14');
insert into Pproducts (product_id, new_price, change_date) values ('1', '30', '2019-08-15');
insert into Pproducts (product_id, new_price, change_date) values ('1', '35', '2019-08-16');
insert into Pproducts (product_id, new_price, change_date) values ('2', '65', '2019-08-17');
insert into Pproducts (product_id, new_price, change_date) values ('3', '20', '2019-08-18');
/* Write an SQL query to find the prices of all products on 2019-08-16. Assume the price of all products before any change is 10.
Return the result table in any order. */
Select product_id,new_price as price
from Pproducts
where (product_id, change_date) in (
    Select product_id,max(change_date)
    from Pproducts
    where 
    change_date <="2019-08-16"
   group by product_id
)
union all
Select product_id,10 as price
from Pproducts
group by product_id
having min(change_date) > "2019-08-16"