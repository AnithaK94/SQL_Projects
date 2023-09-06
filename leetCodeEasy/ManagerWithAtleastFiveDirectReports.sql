use sqlinterview;
# Create a table
Create table If Not Exists Employee (id int, name varchar(255), department varchar(255), managerId int);
Truncate table Employee;
insert into Employee (id, name, department, managerId) values ('101', 'John', 'A', '0');
insert into Employee (id, name, department, managerId) values ('102', 'Dan', 'A', '101');
insert into Employee (id, name, department, managerId) values ('103', 'James', 'A', '101');
insert into Employee (id, name, department, managerId) values ('104', 'Amy', 'A', '101');
insert into Employee (id, name, department, managerId) values ('105', 'Anne', 'A', '101');
insert into Employee (id, name, department, managerId) values ('106', 'Ron', 'B', '101');
/* Write a solution to find managers with at least five direct reports.
Return the result table in any order. */

/* Using a Sub Query
select s.name
from (Select e.name, count(e.name) as mgname from Employee as e
inner join Employee as em 
on e.id = em.managerId
group by e.id, e.name) as s
where s.mgname >4;*/

select em.name
from Employee as e 
inner join Employee as em 
on e.managerId = em.id
group by em.name
having count(e.managerId) >4;