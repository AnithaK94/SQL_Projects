use sqlinterview;
#Create a Table
Create table If Not Exists Eemployee (employee_id int, department_id int, primary_flag ENUM('Y','N'));
Truncate table Eemployee;
insert into Eemployee (employee_id, department_id, primary_flag) values ('1', '1', 'N');
insert into Eemployee (employee_id, department_id, primary_flag) values ('2', '1', 'Y');
insert into Eemployee (employee_id, department_id, primary_flag) values ('2', '2', 'N');
insert into Eemployee (employee_id, department_id, primary_flag) values ('3', '3', 'N');
insert into Eemployee (employee_id, department_id, primary_flag) values ('4', '2', 'N');
insert into Eemployee (employee_id, department_id, primary_flag) values ('4', '3', 'Y');
insert into Eemployee (employee_id, department_id, primary_flag) values ('4', '4', 'N');
/*Employees can belong to multiple departments. When the employee joins other departments, they need to decide which department 
is their primary department. Note that when an employee belongs to only one department, their primary column is 'N'.

Write a solution to report all the employees with their primary department. 
For employees who belong to one department, report their only department.
Return the result table in any order.*/
Select distinct employee_id, 
 department_id
from Eemployee
WHERE 
  primary_flag = 'Y' 
UNION 
SELECT 
  distinct employee_id, 
  department_id 
FROM 
  Eemployee 
group by employee_id,department_id
having count(employee_id) = 1