use leetcodesql;
#Create A Table
Create table If Not Exists Employee (id int, name varchar(255), salary int, departmentId int);
Create table If Not Exists Department (id int, name varchar(255));
Truncate table Employee;
insert into Employee (id, name, salary, departmentId) values ('1', 'Joe', '85000', '1');
insert into Employee (id, name, salary, departmentId) values ('2', 'Henry', '80000', '2');
insert into Employee (id, name, salary, departmentId) values ('3', 'Sam', '60000', '2');
insert into Employee (id, name, salary, departmentId) values ('4', 'Max', '90000', '1');
insert into Employee (id, name, salary, departmentId) values ('5', 'Janet', '69000', '1');
insert into Employee (id, name, salary, departmentId) values ('6', 'Randy', '85000', '1');
insert into Employee (id, name, salary, departmentId) values ('7', 'Will', '70000', '1');
Truncate table Department;
insert into Department (id, name) values ('1', 'IT');
insert into Department (id, name) values ('2', 'Sales');

/* A company's executives are interested in seeing who earns the most money in each of the company's departments. 
A high earner in a department is an employee who has a salary in the top three unique salaries for that department.
Write a solution to find the employees who are high earners in each of the departments.
Return the result table in any order.*/

# Write MySQL query statement below

with cte as (
select distinct id, name, salary, departmentId,
dense_rank() over(partition by departmentId order by salary desc) as salary_rank
from employee
) 

select d.name as department, t.name as Employee , t.salary as Salary from cte t
left join department d on t.departmentId = d.id
where salary_rank < 4
order by department, Salary;

/* # using Joins
select d.name as department , e1.name as employee, e1.salary as Salary
from Employee e1 join Department d on e1.DepartmentId = d.Id
where  3 > (select count(distinct (e2.Salary))
        from  Employee e2
        where e2.Salary > e1.Salary
            and e1.DepartmentId = e2.DepartmentId)*/
