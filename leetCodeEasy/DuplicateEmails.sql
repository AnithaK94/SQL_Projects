use leet_code_easy;
# Create a table
Create table If Not Exists EPerson (id int, email varchar(255))
Truncate table Person
insert into EPerson (id, email) values ('1', 'a@b.com')
insert into EPerson (id, email) values ('2', 'c@d.com')

/* Write a solution to report all the duplicate emails. Note that it's guaranteed that the email field is not NULL.
Return the result table in any order.  */

# using SubQuery
select subquery.email  from  (
Select email, count(email) as repeated_email 
From EPerson 
group by email
having repeated_email > 1
) subquery

# Without using SubQuery
Select email 
From EPerson 
group by email
having count(email) > 1


