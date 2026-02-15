INSERT INTO events1 VALUES (1,'100m',2016, 'Amthhew Mcgarray','donald','barbara');
INSERT INTO events1 VALUES (2,'200m',2016, 'Nichole','Alvaro Eaton','janet Smith');
INSERT INTO events1 VALUES (3,'500m',2016, 'Charles','Nichole','Susana');
INSERT INTO events1 VALUES (4,'100m',2016, 'Ronald','maria','paula');
INSERT INTO events1 VALUES (5,'200m',2016, 'Alfred','carol','Steven');
INSERT INTO events1 VALUES (6,'500m',2016, 'Nichole','Alfred','Brandon');
INSERT INTO events1 VALUES (7,'100m',2016, 'Charles','Dennis','Susana');
INSERT INTO events1 VALUES (8,'200m',2016, 'Thomas','Dawn','catherine');
INSERT INTO events1 VALUES (9,'500m',2016, 'Thomas','Dennis','paula');
INSERT INTO events1 VALUES (10,'100m',2016, 'Charles','Dennis','Susana');
INSERT INTO events1 VALUES (11,'200m',2016, 'jessica','Donald','Stefeney');
INSERT INTO events1 VALUES (12,'500m',2016,'Thomas','Steven','Catherine');

-- find swimmer with goldmedals he should have won only gold no silver or bronze.


-- select * from events1; with cte as (select gold as playername from events1 ) ,
-- cte2 as (select silver as playername from events1) ,
-- cte3 as (select bronze as playername from events1)
--  select * from cte where playername not in ( selct b.playername from cte2 b join cte3 c on b.playername=c.playername)


select * from events1;
with gold_players  as (select distinct gold as playername from events1 ),
other_medals AS (select silver as playername from events1 union select distinct bronze as playername from events1)
select g.playername from gold_players g where g.playername not in (select playername from other_medals);
