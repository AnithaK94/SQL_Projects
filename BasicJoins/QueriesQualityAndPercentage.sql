use sqlinterview;
#Create a Table
Create table If Not Exists Queries (query_name varchar(30), result varchar(50), position int, rating int);
Truncate table Queries;
insert into Queries (query_name, result, position, rating) values ('Dog', 'Golden Retriever', '1', '5');
insert into Queries (query_name, result, position, rating) values ('Dog', 'German Shepherd', '2', '5');
insert into Queries (query_name, result, position, rating) values ('Dog', 'Mule', '200', '1');
insert into Queries (query_name, result, position, rating) values ('Cat', 'Shirazi', '5', '2');
insert into Queries (query_name, result, position, rating) values ('Cat', 'Siamese', '3', '3');
insert into Queries (query_name, result, position, rating) values ('Cat', 'Sphynx', '7', '4');
/* We define query quality as:
The average of the ratio between query rating and its position.
We also define poor query percentage as:
The percentage of all queries with rating less than 3.

Write a solution to find each query_name, the quality and poor_query_percentage.
Both quality and poor_query_percentage should be rounded to 2 decimal places.

Return the result table in any order. */
WITH CTE as (
select query_name,
   rating/position as ratio,
   case when rating < 3 then 1 else 0
   end  as poor_query
From Queries
)
select query_name,
   round(avg(ratio),2) as quality,
   round( sum(poor_query) / count(query_name) * 100 ,2) as poor_query_percentage 
From CTE
group by query_name