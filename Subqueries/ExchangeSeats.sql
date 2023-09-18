use leetcodesql;
# Create A Table
Create table If Not Exists Seat (id int, student varchar(255));
Truncate table Seat;
insert into Seat (id, student) values ('1', 'Abbot');
insert into Seat (id, student) values ('2', 'Doris');
insert into Seat (id, student) values ('3', 'Emerson');
insert into Seat (id, student) values ('4', 'Green');
insert into Seat (id, student) values ('5', 'Jeames');
/* Write a solution to swap the seat id of every two consecutive students. 
If the number of students is odd, the id of the last student is not swapped.
Return the result table ordered by id in ascending order. */
SELECT  IF(id % 2 = 0 , #condition checks when id is even 
           id-1 ,       # when true then directly do - 1
           IF(id != ( SELECT MAX(id) FROM SEAT ),id+1,id)) AS id #when false then check that if id is not last id (in case of odd numbered data set) then do id+1 else dont change id. 
        ,student
    FROM SEAT
    ORDER BY id;
    
    # using window function
select id, 
       case 
       when id % 2 <> 0 and id = (select max(id) from Seat) then student
       when id % 2 <> 0 then lead(student, 1) over(order by id)
       else lag(student, 1) over(order by id)
       end student
from Seat
order by id
