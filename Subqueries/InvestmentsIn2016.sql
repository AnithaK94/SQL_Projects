use leetcodesql;
# Create a Table
Create Table If Not Exists Insurance (pid int, tiv_2015 float, tiv_2016 float, lat float, lon float);
Truncate table Insurance;
insert into Insurance (pid, tiv_2015, tiv_2016, lat, lon) values ('1', '10', '5', '10', '10');
insert into Insurance (pid, tiv_2015, tiv_2016, lat, lon) values ('2', '20', '20', '20', '20');
insert into Insurance (pid, tiv_2015, tiv_2016, lat, lon) values ('3', '10', '30', '20', '20');
insert into Insurance (pid, tiv_2015, tiv_2016, lat, lon) values ('4', '10', '40', '40', '40');

/* Write a solution to report the sum of all total investment values in 2016 tiv_2016, for all policyholders who:
have the same tiv_2015 value as one or more other policyholders, and
are not located in the same city as any other policyholder (i.e., the (lat, lon) attribute pairs must be unique).
Round tiv_2016 to two decimal places.*/

# Write MySQL query statement below
select round(sum(tiv_2016),2) as tiv_2016 from Insurance
where tiv_2015 in (
    select tiv_2015 from insurance
    group by tiv_2015 
    having count(*) > 1
)
and concat(lat,lon) in ( 
    SELECT
        CONCAT(LAT, LON)
      FROM
        insurance
      GROUP BY LAT , LON
      HAVING COUNT(*) = 1
)
/*
# use Joins
SELECT ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM Insurance i1
 WHERE tiv_2015 IN (SELECT tiv_2015 FROM Insurance i2
                     WHERE i1.pid != i2.pid)
AND (lat, lon) NOT IN (SELECT lat, lon FROM Insurance i3
                      WHERE i1.pid != i3.pid)
#Use Window Functions
SELECT ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM 
(SELECT tiv_2016,
        COUNT(*) OVER (PARTITION BY (tiv_2015)) as cnt_2015,
        COUNT(*) OVER (PARTITION BY lat, lon) as cnt_ll
        FROM Insurance
        ) as sub_query
WHERE cnt_2015 > 1 AND cnt_ll = 1*/
