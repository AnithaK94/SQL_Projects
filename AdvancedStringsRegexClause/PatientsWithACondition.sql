use leetcodesql;
#Create A Table
Create table If Not Exists Patients (patient_id int, patient_name varchar(30), conditions varchar(100));
Truncate table Patients;
insert into Patients (patient_id, patient_name, conditions) values ('1', 'Daniel', 'YFEV COUGH');
insert into Patients (patient_id, patient_name, conditions) values ('2', 'Alice', '');
insert into Patients (patient_id, patient_name, conditions) values ('3', 'Bob', 'DIAB100 MYOP');
insert into Patients (patient_id, patient_name, conditions) values ('4', 'George', 'ACNE DIAB100');
insert into Patients (patient_id, patient_name, conditions) values ('5', 'Alain', 'DIAB201');
/* Write a solution to find the patient_id, patient_name, and conditions of the patients 
who have Type I Diabetes. Type I Diabetes always starts with DIAB1 prefix.
Return the result table in any order. */
#MySQL query statement below
Select *
From Patients
Where Conditions LIKE '% DIAB1%' OR CONDITIONS LIKE 'DIAB1%';
# WHERE conditions REGEXP '\\bDIAB1';
