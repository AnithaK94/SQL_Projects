use leetcodesql;
#Create A Table
Create table If Not Exists Employees (employee_id int, name varchar(20), manager_id int, salary int);
Truncate table Employees;
insert into Employees (employee_id, name, manager_id, salary) values ('3', 'Mila', '9', '60301');
insert into Employees (employee_id, name, manager_id, salary) values ('12', 'Antonella', 'None', '31000');
insert into Employees (employee_id, name, manager_id, salary) values ('13', 'Emery', 0, '67084');
insert into Employees (employee_id, name, manager_id, salary) values ('1', 'Kalel', '11', '21241');
insert into Employees (employee_id, name, manager_id, salary) values ('9', 'Mikaela', 0, '50937');
insert into Employees (employee_id, name, manager_id, salary) values ('11', 'Joziah', '6', '28485');
/* Find the IDs of the employees whose salary is strictly less than $30000 and whose manager left the company. 
When a manager leaves the company, their information is deleted from the Employees table, 
but the reports still have their manager_id set to the manager that left.
Return the result table ordered by employee_id. */
# MySQL query statement below
select employee_id 
from Employees
where salary < 30000 and 
manager_id not in ( Select employee_id from Employees)
order by employee_id;
