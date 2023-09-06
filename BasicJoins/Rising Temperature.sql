use leet_code_easy;
# Create a table
Create table If Not Exists Weather (id int, recordDate date, temperature int)
Truncate table Weather
insert into Weather (id, recordDate, temperature) values ('1', '2015-01-01', '10')
insert into Weather (id, recordDate, temperature) values ('2', '2015-01-02', '25')
insert into Weather (id, recordDate, temperature) values ('3', '2015-01-03', '20')
insert into Weather (id, recordDate, temperature) values ('4', '2015-01-04', '30')

/* Find all dates' Id with higher temperatures compared to its previous dates (yesterday).
Return the result table in any order.  */

Select w1.id 
from Weather w1, weather w2
 #  w1.recordDate >= w2.recordDate+1  --> some test cases failed , need to ude datediff function
# datediff( w1.recordDate,w2.recordDate) = 1
where w1.recordDate = Date_add(w2.recordDate, Interval 1 day)
And w1.temperature > w2. temperature