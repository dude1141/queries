restaurant_ratings.sql
  
INSERT INTO restaurant_ratings VALUES
(1,'Spice Hub','2024-01-01',4),
(1,'Spice Hub','2024-02-01',5),
(1,'Spice Hub','2024-03-01',4),
(1,'Spice Hub','2024-04-01',4),
(1,'Spice Hub','2024-05-01',5),
(1,'Spice Hub','2024-06-01',4),
(1,'Spice Hub','2024-07-01',3),

(2,'Urban Bites','2024-01-01',4),
(2,'Urban Bites','2024-02-01',4),
(2,'Urban Bites','2024-03-01',5),
(2,'Urban Bites','2024-04-01',4),
(2,'Urban Bites','2024-05-01',4),

(3,'Food Street','2024-01-01',4),
(3,'Food Street','2024-02-01',4),
(3,'Food Street','2024-03-01',3),
(3,'Food Street','2024-04-01',4),
(3,'Food Street','2024-05-01',4),
(3,'Food Street','2024-06-01',4),
(3,'Food Street','2024-07-01',4),
(3,'Food Street','2024-08-01',4),
(3,'Food Street','2024-09-01',4);

 select * from restaurant_ratings;


with cte1 as(
select *, month(rating_month) as month from restaurant_ratings  where rating >= 4),
 ctes2 as(
  select * ,
  dense_rank() over (partition by restaurant_id order by restaurant_id,month) ,
   TIMESTAMPDIFF(
  month,lag(rating_month,1,rating_month) 
  over (partition by restaurant_id order by restaurant_id,month) ,rating_month )as month_diff,
   month(rating_month) - dense_rank() over (partition by restaurant_id order by restaurant_id, month) as grp
   from cte1)
select * from ctes2



restaurant_id	restaurant_name	rating_month	rating	month	dense_rank() over (partition by restaurant_id order by restaurant_id,month)	month_diff	grp
1	            Spice Hub	      2024-01-01	    4	    1	      1	                                                                        0	          0
1           	Spice Hub      	2024-02-01	  5   	2     	2	                                                                         1	        0
1	Spice Hub	2024-03-01	4	3	3	1	0
1	Spice Hub	2024-04-01	4	4	4	1	0
1	Spice Hub	2024-05-01	5	5	5	1	0
1	Spice Hub	2024-06-01	4	6	6	1	0
2	Urban Bites	2024-01-01	4	1	1	0	0
2	Urban Bites	2024-02-01	4	2	2	1	0
2	Urban Bites	2024-03-01	5	3	3	1	0
2	Urban Bites	2024-04-01	4	4	4	1	0
2	Urban Bites	2024-05-01	4	5	5	1	0
3	Food Street	2024-01-01	4	1	1	0	0
3	Food Street	2024-02-01	4	2	2	1	0
3	Food Street	2024-04-01	4	4	3	2	1
3	Food Street	2024-05-01	4	5	4	1	1
3	Food Street	2024-06-01	4	6	5	1	1
3	Food Street	2024-07-01	4	7	6	1	1
3	Food Street	2024-08-01	4	8	7	1	1
3	Food Street	2024-09-01	4	9	8	1	1


