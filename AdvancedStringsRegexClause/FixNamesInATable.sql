use leetcodesql;
#Create A Table 
Create table If Not Exists Users (user_id int, name varchar(40));
Truncate table Users;
insert into Users (user_id, name) values ('1', 'aLice');
insert into Users (user_id, name) values ('2', 'bOB');
/* Write a solution to fix the names 
so that only the first character is uppercase and the rest are lowercase.
Return the result table ordered by user_id. */
# MySQL query statement below
Select user_id, Concat(UPPER(LEFT(name,1)),LOWER(SUBSTRING(name,2,length(name)))) as name
From Users 
order by user_id
