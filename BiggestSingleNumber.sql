use leet_code_easy
#Create a Table
Create table If Not Exists MyNumber (num int)
Truncate table MyNumbers
insert into MyNumber (num) values ('8')
insert into MyNumber (num) values ('8')
insert into MyNumber (num) values ('3')
insert into MyNumber (num) values ('3')
insert into MyNumber (num) values ('1')
insert into MyNumber (num) values ('4')
insert into MyNumber (num) values ('5')
insert into MyNumber (num) values ('6')
/* A single number is a number that appeared only once in the MyNumbers table.
Find the largest single number. If there is no single number, report null. */
Select max(single_num.num) as num
From
(
      Select num 
      from MyNumber
      group by num
      having count(num)=1 
      ) as single_num


