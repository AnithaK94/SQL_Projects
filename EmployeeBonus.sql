use leet_code_eay;

#Create a Table

Create table If Not Exists BEmployee (empId int, name varchar(255), supervisor int, salary int)
Create table If Not Exists Bonus (empId int, bonus int)
Truncate table BEmployee
insert into BEmployee (empId, name, supervisor, salary) values (3, 'Brad',0, 4000)
insert into BEmployee (empId, name, supervisor, salary) values (1, 'John',3, 1000)
insert into BEmployee (empId, name, supervisor, salary) values (2, 'Dan',3, 2000)
insert into BEmployee (empId, name, supervisor, salary) values (4, 'Thomas',3, 4000)
Truncate table Bonus
insert into Bonus (empId, bonus) values (2, 500)
insert into Bonus (empId, bonus) values (4, 2000)

/* Write an SQL query to report the name and bonus amount of each employee with a bonus less than 1000.
Return the result table in any order.  */

Select emp.name, b.bonus
From BEmployee emp
left join Bonus b
on emp.empId = b.empId
where b.bonus < 1000 or b.bonus is null;