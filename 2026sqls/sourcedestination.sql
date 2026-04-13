
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


select distinct a.source_city ,b.source_city,a.distance  ,
case when a.source_city=b.destination_city then 1 else 0 end as 'source flag',
case when a.source_city !=b.destination_city then 1 else 0 end as 'target flag'
From routes a join routes b on a.source_city= b.destination_city;


