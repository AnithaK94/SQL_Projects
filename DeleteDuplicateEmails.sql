use leet_code_easy;
# Create a table
Create table If Not Exists DEPerson (Id int, Email varchar(255))
Truncate table DEPerson
insert into DEPerson (id, email) values ('1', 'john@example.com')
insert into DEPerson (id, email) values ('2', 'bob@example.com')
insert into DEPerson (id, email) values ('3', 'john@example.com')
/* Write a solution to delete all duplicate emails, keeping only one unique email with the smallest id.
For SQL users, please note that you are supposed to write a DELETE statement and not a SELECT one.
After running your script, the answer shown is the Person table.
The driver will first compile and run your piece of code and then show the Person table. 
The final order of the Person table does not matter.  */

Delete p1
From DEPerson p1, DEPerson p2
where p1.email = p2.email 
And p1.id > p2.id;