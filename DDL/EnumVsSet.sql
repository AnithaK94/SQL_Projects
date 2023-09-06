/* Set allows :
	1. defined values, 
    2. repeated defined values in concatenation with comma as delimiter (i.e 'bold,italic') 
    3. empty string,
    does not allows :
    1. rest of the strings are not allowed */
CREATE TABLE setTest(
  attrib SET('bold','italic','underline')
);
#success case
INSERT INTO setTest (attrib) VALUES ('bold');
INSERT INTO setTest (attrib) VALUES (''); 
INSERT INTO setTest (attrib) VALUES ('bold,italic');
INSERT INTO setTest (attrib) VALUES ('bold,italic,underline');
INSERT INTO setTest (attrib) VALUES ('bold,italic,underline,italic');
#failure case
INSERT INTO setTest (attrib) VALUES (' ');
INSERT INTO setTest (attrib) VALUES ('random');

/* ENUM allows:
	1.only defined values at one time
ENUM does not allows
    1. rest of the strings such as empty string
    2. repeated defined values in concatination are not allowed */
    
CREATE TABLE enumTest(
 color ENUM('red','green','blue'),
 id int
);

# success case
INSERT INTO enumTest (color,id) VALUES ('red',1);
INSERT INTO enumTest (color,id) VALUES ('green',2);
INSERT INTO enumTest (color,id) VALUES ('blue',3); 
# failure case
INSERT INTO enumTest (color,id) VALUES ('red,green',5);
INSERT INTO enumTest (color,id) VALUES ('',6);
