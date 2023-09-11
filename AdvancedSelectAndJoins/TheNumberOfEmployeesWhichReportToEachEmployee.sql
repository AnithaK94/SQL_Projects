use sqlinterview;
#Create a Table
Create table If Not Exists Eemployees(employee_id int, name varchar(20), reports_to int, age int);
Truncate table Eemployees;
insert into Eemployees (employee_id, name, reports_to, age) values ('9', 'Hercy', 0, '43');
insert into Eemployees (employee_id, name, reports_to, age) values ('6', 'Alice', '9', '41');
insert into Eemployees (employee_id, name, reports_to, age) values ('4', 'Bob', '9', '36');
insert into Eemployees (employee_id, name, reports_to, age) values ('2', 'Winston', 0, '37')  ; 
/* For this problem, we will consider a manager an employee who has at least 1 other employee reporting to them.
Write an SQL query to report the ids and the names of all managers, the number of employees who report directly to them, 
and the average age of the reports rounded to the nearest integer.
Return the result table ordered by employee_id*/
Select e1.employee_id, e1.name,
count(e2.employee_id) as reports_count,
 round(avg(e2.age)) as average_age
from Eemployees as e1
# using inner join --> join table with itsel (self join)
inner join Eemployees as  e2 
on e1. employee_id = e2.reports_to
group by e1.employee_id,e1.name
order by employee_id ;