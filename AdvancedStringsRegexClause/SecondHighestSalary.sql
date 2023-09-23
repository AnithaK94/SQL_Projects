use leetcodesql;
# Create A Table
Create table If Not Exists Employee (id int, salary int);
Truncate table Employee;
insert into Employee (id, salary) values ('1', '100');
insert into Employee (id, salary) values ('2', '200');
insert into Employee (id, salary) values ('3', '300');

/* Write a solution to find the second highest salary from the Employee table. 
If there is no second highest salary, return null */

# Write MySQL query statement below
Select (
  (Select distinct salary as SecondHighestSalary from Employee 
order by salary desc
limit 1 offset 1) )as SecondHighestSalary;

/* Using window function Rank 
select 
  ( select 
    salary as SecondHighestSalary
from(
    
    select salary,     
    rank() OVER (
                ORDER BY salary desc
        ) row_num
    from (SELECT DISTINCT salary FROM Employee) AS T1
) as t
where row_num = 2) as SecondHighestSalary
;*/
