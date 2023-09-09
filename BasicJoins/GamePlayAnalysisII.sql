use sqlinterview;
#Create a Table
Create table If Not Exists AActivity (player_id int, device_id int, event_date date, games_played int);
Truncate table Activity;
insert into AActivity (player_id, device_id, event_date, games_played) values ('1', '2', '2016-03-01', '5');
insert into AActivity (player_id, device_id, event_date, games_played) values ('1', '2', '2016-03-02', '6');
insert into AActivity (player_id, device_id, event_date, games_played) values ('2', '3', '2017-06-25', '1');
insert into AActivity (player_id, device_id, event_date, games_played) values ('3', '1', '2016-03-02', '0');
insert into AActivity (player_id, device_id, event_date, games_played) values ('3', '4', '2018-07-03', '5');
/* Write a solution to report the fraction of players that logged in again on the day after the day they first logged in,
 rounded to 2 decimal places. In other words, you need to count the number of players that logged in for at least two consecutive days 
 starting from their first login date, then divide that number by the total number of players.  */
WITH first_logins AS (
  SELECT
    a.player_id,
    MIN(A.event_date) AS first_login
  FROM
    AActivity  AS a
  GROUP BY
    a.player_id
), consec_logins AS (
  SELECT
    COUNT(a.player_id) AS num_logins
  FROM
    first_logins f
    INNER JOIN AActivity a ON a.player_id = a.player_id
    AND f.first_login = DATE_SUB(a.event_date, INTERVAL 1 DAY)
)
SELECT
  ROUND(
    (SELECT c.num_logins FROM consec_logins c)
    / (SELECT COUNT(f.player_id) FROM first_logins f)
  , 2) AS fraction;