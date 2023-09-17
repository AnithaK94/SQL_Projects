use leetcodesql;
#Create A Table Train
Create table If Not Exists train (id int, model varchar(30), max_speed int, production_year int);
	Truncate table train;
	insert into train (id, model, max_speed, production_year) values ('1','InterCity100', '160', '2000');
	insert into train (id, model, max_speed, production_year) values ('2','InterCity190', '160', '2001');
	insert into train (id, model, max_speed, production_year) values ('3','InterCity200', '160', '2012');
	insert into train (id, model, max_speed, production_year) values ('4','Pendolineo190', '160', '2015');
	insert into train (id, model, max_speed, production_year) values ('5', 'Pendolineo380', '160', '1999');
#Create a Table Journey
Create table If Not Exists journey (id int, train_id int, route_id int, date date);
	Truncate table journey;
	insert into journey (id, train_id, route_id, date) values (1, 2, 1, '2016-01-03');
	insert into journey (id, train_id, route_id, date) values (2, 2, 3, '2016-01-15');
	insert into journey (id, train_id, route_id, date) values (3, 1, 5, '2016-01-24');
	insert into journey (id, train_id, route_id, date) values (4, 3, 2, '2016-01-17');
	insert into journey (id, train_id, route_id, date) values (5, 4, 4, '2016-01-22');
#Create a Table Route
Create table If Not Exists route (id int, train_name varchar(30),from_city varchar(30), to_city varchar(30), distance int);
	Truncate table route;
	insert into route (id, train_name, from_city, to_city, distance) values (1,"manchesterExpress","Sheffleads","Beatles",'70');
	insert into route (id, train_name,from_city, to_city, distance) values (3, "GoToLeads","manchester","Oxford", '200');
	insert into route (id, train_name,from_city, to_city, distance) values (3, "StudentRoute","London", "York",'80');
	insert into route (id, train_name,from_city, to_city, distance) values (5, "beattlesRoute","LiverPool","Nevellie" ,'180');
	insert into route (id, train_name,from_city, to_city, distance) values (2, "NewCastle","Scotland","London", '90');
	insert into route (id, train_name,from_city, to_city, distance) values (4, "ScotlandSpeed","London","Scotland", '165');
/* Joining two tables Train and Journey*/
SELECT
        train.id,
        train.model,
        journey.*
FROM train
INNER JOIN journey ON journey.train_id = train.id
ORDER BY
        train.id ASC;
/* Running a query by Group by function
 # From the query result, you can see that we have aggregated information, 
   telling us the number of routes for each train.

# The original rows are “collapsed.” 
You can access the columns in the GROUP BY statement and the values produced by the aggregate 
functions, but the original row-level details are no longer there.
*/
SELECT
    train.id,
    train.model,
    COUNT(*) AS routes
FROM train
INNER JOIN journey ON journey.train_id = train.id
GROUP BY
    train.id,
    train.model
ORDER BY
    train.id ASC;
    /*  Running a query by PARTITION BY function, the row-level details are preserved and not collapsed. 
       The original row-level details as well as the aggregated values are still there.
       All aggregate functions can be used as window functions.*/
SELECT
    train.id,
    train.model,
    route.train_name,
    route.from_city,
    route.to_city,
    COUNT(*) OVER (PARTITION BY train.id ORDER BY train.id) AS routes,
    COUNT(*) OVER () AS routes_total
FROM train
INNER JOIN journey ON journey.train_id = train.id
INNER JOIN route ON journey.route_id = route.id;
#Summary
/*
Similarities: Both are used to return aggregated values.
Differences: 
		1. Using a GROUP BY clause collapses original rows-(cannot access the original values later in the query)
		   whereas using a PARTITION BY clause keeps original rows while also allows to produce aggregated values.
		2. The PARTITION BY is combined with OVER() and windows functions to add a lot more functionalities.
*/
    
