
CREATE TABLE routes (
    source_city VARCHAR(50),
    destination_city VARCHAR(50),
    distance INT
);

INSERT INTO routes (source_city, destination_city, distance) VALUES
('Bangalore', 'Hyderabad', 400),
('Hyderabad', 'Bangalore', 400),
('Mumbai', 'Delhi', 400),
('Delhi', 'Mumbai', 400),
('Chennai', 'Pune', 400),
('Pune', 'Chennai', 400);

expected output
source_city, destination_city, distance
Bangalore,   Hyderabad,  400
Mumbai  ,    Delhi,      400
Chennai,      Pune,      400


/*select distinct a.source_city ,b.source_city,a.distance  ,
case when a.source_city=b.destination_city then 1 else 0 end as 'source flag',
case when a.source_city !=b.destination_city then 1 else 0 end as 'target flag'
From routes a join routes b on a.source_city= b.destination_city; */

on self join if you want to restrict rows , you can compare id for example here


with cte as (
select *,row_number() over () as id from routes
)
select a.source_city as asrccity, a.destination_city as bdestcity
, b.source_city as bsrccity , b.destination_city as bdestination,
a.distance as adist ,b.distance as bdist
 From cte a join cte b
 on a.source_city= b.destination_city


# asrccity	bdestcity	bsrccity	bdestination	adist	bdist
Bangalore	Hyderabad	Hyderabad	Bangalore	400	400
Hyderabad	Bangalore	Bangalore	Hyderabad	400	400
Mumbai	        Delhi	Delhi	    Mumbai    	400	400
Delhi	        Mumbai	Mumbai	    Delhi	    400	400
Chennai	           Pune	Pune	    Chennai	    400	400
Pune	        Chennai	        Chennai	Pune	400	400
.

    with cte as (
select *,row_number() over () as id from routes
)
select a.source_city as asrccity, a.destination_city as bdestcity
, b.source_city as bsrccity , b.destination_city as bdestination,
a.distance as adist ,b.distance as bdist
 From cte a join cte b
 on a.source_city= b.destination_city
and a.id<b.id;

compare row with another row so as to restrict output 

# asrccity	bdestcity	bsrccity	bdestination	adist	bdist
Bangalore	Hyderabad	Hyderabad	Bangalore	    400	    400
Mumbai	    Delhi    	Delhi	    Mumbai    	    400	    400
Chennai    	Pune	    Pune	    Chennai        	400	    400


