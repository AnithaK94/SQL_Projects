use leetcodesql;
# Create a Table

Create table If Not Exists RequestAccepted (requester_id int not null, accepter_id int null, accept_date date null);
Truncate table RequestAccepted;
insert into RequestAccepted (requester_id, accepter_id, accept_date) values ('1', '2', '2016/06/03');
insert into RequestAccepted (requester_id, accepter_id, accept_date) values ('1', '3', '2016/06/08');
insert into RequestAccepted (requester_id, accepter_id, accept_date) values ('2', '3', '2016/06/08');
insert into RequestAccepted (requester_id, accepter_id, accept_date) values ('3', '4', '2016/06/09');

/* Write a solution to find the people who have the most friends and the most friends number.
The test cases are generated so that only one person has the most friends.*/

# Write T-SQL query statement below
SELECT r.id, SUM(r.num) as num
FROM
( 
SELECT requester_id as id, COUNT(requester_id) as num FROM RequestAccepted GROUP BY requester_id
UNION ALL
SELECT accepter_id as id, COUNT(accepter_id) as num  FROM RequestAccepted GROUP BY accepter_id
) r
GROUP BY r.id 
ORDER BY num  DESC
limit 1;
