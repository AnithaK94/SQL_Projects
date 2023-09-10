use leet_code_easy;
#Create a Table
Create table If Not Exists Triangle (x int, y int, z int)
Truncate table Triangle
insert into Triangle (x, y, z) values ('13', '15', '30')
insert into Triangle (x, y, z) values ('10', '20', '15')

/* Report for every three line segments whether they can form a triangle.
Return the result table in any order.  */

Select *, 
Case
WHEN x + y > z AND y + z > x AND z + x >y 
THEN "Yes"
Else "No"
END As "triangle"
from Triangle
