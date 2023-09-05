create database sql_intro;
show databases;
create table emp_details (Name varchar(25), Age int, Gender char(1), DOJ date, City varchar(15), Salary float);
describe emp_details;
/* Add values to the table */
insert into emp_details
values ("Jimmy",35, "M","2005-05-30","Chicago",70000),
("Shane",30,"M","1999-06-25","Seattle",55000), ("Mary",28,"F","2009-03-10","Boston", 62000), ("Dwayne",37, "M", "2011-07-12","Austin",57000),
("Sara",32,"F","2017-10-27","New York",72000), ("Amy", 35, "F","2014-12-20","Seattle", 80000);
/* to view the contents in the table*/
Select * from emp_details;
/* to show cities that are not repeated*/
Select distinct City from emp_details;
/* to find the total count*/
Select Count(name) from emp_details;
/* to save the answer of count in as name - use aliases - no space must be used*/
Select Count(name) as Total_Employees from emp_details ; 
/* using Pre-defined functions*/
Select avg(salary) as Average_Salary from emp_details;
/* to filter out for specific condi6tion*/
Select * from emp_details
Where age = 35 ;

Select * from emp_details
Where age between 35 and 40 ;

Select gender, sum(salary) as Total_salary from emp_details 
group by gender;

/* to sort the data */
Select * from emp_details order by salary; 

# String Functions

