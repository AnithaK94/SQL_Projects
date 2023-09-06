use sqlinterview;
# Create a Table
Create table If Not Exists Customer (id int, name varchar(25), referee_id int);
Truncate table Customer;
insert into Customer (id, name, referee_id) values (1, 'Will', 0);
insert into Customer (id, name, referee_id) values (2, 'Jane', 0);
insert into Customer (id, name, referee_id) values (3, 'Alex', '2');
insert into Customer (id, name, referee_id) values (4, 'Bill', 0);
insert into Customer (id, name, referee_id) values (5, 'Zack', '1');
insert into Customer (id, name, referee_id) values (6, 'Mark', '2');
/* Find the names of the customer that are not referred by the customer with id = 2.
Return the result table in any order. */
Select name
from Customer
where referee_id !=2 or referee_id is null;