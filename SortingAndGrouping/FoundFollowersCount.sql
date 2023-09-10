use sqlinterview;
#Create a Table
Create table If Not Exists Followers(user_id int, follower_id int);
Truncate table Followers;
insert into Followers (user_id, follower_id) values ('0', '1');
insert into Followers (user_id, follower_id) values ('1', '0');
insert into Followers (user_id, follower_id) values ('2', '0');
insert into Followers (user_id, follower_id) values ('2', '1');
/*Write a solution that will, for each user, return the number of followers.
Return the result table ordered by user_id in ascending order.*/
Select user_id, count(follower_id) as followers_count
from Followers
group by user_id
order by user_id;