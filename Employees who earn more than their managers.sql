use leet_code_easy;

# Creating a Table 

Create table If Not Exists Employee (id int, name varchar(255), salary int, managerId int)
Truncate table Employee
insert into Employee (id, name, salary, managerId) values ('1', 'Joe', '70000', '3')
insert into Employee (id, name, salary, managerId) values ('2', 'Henry', '80000', '4')
insert into Employee (id, name, salary, managerId) values ('3', 'Sam', '60000', '0')
insert into Employee (id, name, salary, managerId) values ('4', 'Max', '90000', '0')


/* Without using Joins - Self Join
Select emp.name as Employee
From Employee emp , Employee man
Where emp.ManagerId = man.Id
AND emp.Salary > man.Salary;*/

# Using JOINS

Select emp.name as Employee
From Employee emp 
INNER JOIN Employee man
On emp.ManagerId = man.Id
AND man.Salary < emp.Salary;