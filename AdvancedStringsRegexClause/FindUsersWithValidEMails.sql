use leetcodesql;
# Create a Table
Create table If Not Exists Users (user_id int, name varchar(30), mail varchar(50));
Truncate table Users;
insert into Users (user_id, name, mail) values ('1', 'Winston', 'winston@leetcode.com');
insert into Users (user_id, name, mail) values ('2', 'Jonathan', 'jonathanisgreat');
insert into Users (user_id, name, mail) values ('3', 'Annabelle', 'bella-@leetcode.com');
insert into Users (user_id, name, mail) values ('4', 'Sally', 'sally.come@leetcode.com');
insert into Users (user_id, name, mail) values ('5', 'Marwan', 'quarz#2020@leetcode.com');
insert into Users (user_id, name, mail) values ('6', 'David', 'david69@gmail.com');
insert into Users (user_id, name, mail) values ('7', 'Shapiro', '.shapo@leetcode.com');

/*Write a solution to find the users who have valid emails.
A valid e-mail has a prefix name and a domain where:
The prefix name is a string that may contain letters (upper or lower case), digits, underscore '_', period '.', and/or dash '-'.
The prefix name must start with a letter.
The domain is '@leetcode.com'.
Return the result table in any order.*/

# Write your MySQL query statement below
select *
from users
where mail regexp '^[a-zA-Z][a-zAZ0-9_.-]*@leetcode[.]com$';

#WHERE mail  LIKE '[a-zA-Z]%@leetcode.com' AND mail NOT LIKE '%[^a-zA-Z0-9_.-]%@leetcode.com'
