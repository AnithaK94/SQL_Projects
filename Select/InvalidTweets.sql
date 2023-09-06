use sqlinterview;
# DROP TABLE Tweets;
#create a table
Create table If Not Exists Tweets(tweet_id int, content varchar(50));
Truncate table Tweets;
insert into Tweets (tweet_id, content) values ('1', 'Vote for Biden');
insert into Tweets (tweet_id, content) values ('2', 'Let us make America great again!');
insert into Tweets (tweet_id, content) values ('3', 'Vote for the Democratic Party!');
/* Write a solution to find the IDs of the invalid tweets. The tweet is invalid if the number of characters used in the content of the tweet is strictly greater than 15.
Return the result table in any order. */
Select tweet_id
from Tweets
where length(content) > 15;