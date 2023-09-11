use sqlinterview;
#Create a Table
Create table If Not Exists Logs (id int, num int);
Truncate table Logs;
insert into Logs (id, num) values ('1', '1');
insert into Logs (id, num) values ('2', '1');
insert into Logs (id, num) values ('3', '1');
insert into Logs (id, num) values ('4', '2');
insert into Logs (id, num) values ('5', '1');
insert into Logs (id, num) values ('6', '2');
insert into Logs (id, num) values ('7', '2');
/*Find all numbers that appear at least three times consecutively.
Return the result table in any order.*/
Select distinct a.num as ConsecutiveNums
from Logs a
inner join Logs b on a.id + 1 = b.id
inner join Logs c on b.id + 1 = c.id
where a.num = b.num and b.num = c.num;