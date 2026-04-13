find new and repate customers


input
# order_id	customer_id	order_date	order_amount
    1	        100	        2022-01-01	2000
    2	        200        	2022-01-01	2500
    3	        300	        2022-01-01	2100
    4	        100	        2022-01-02	2000
    5        	400	        2022-01-02	2200
    6	        500	        2022-01-02	2700
    7	        100        	2022-01-03	3000
    8	        400	        2022-01-03	1000
    9	        600	        2022-01-03	3000


#you need to first get order_date and minus it with ,using case when




CREATE TABLE purchases (
    user_id INT,
    purchase_date DATE,
    amount INT
);

INSERT INTO purchases VALUES
(1, '2024-01-01', 100),
(1, '2024-01-05', 200),
(1, '2024-01-20', 300),
(2, '2024-01-02', 150),
(2, '2024-01-03', 200),
(3, '2024-01-10', 500),
(3, '2024-02-01', 700),
(4, '2024-01-15', 400);

select * from purchases;
-- First Time vs Repeat Purchase 

with cte4 as( 
select  user_id, purchase_date,min(purchase_date)  over (partition by user_id order by purchase_date)  as minpurchase from purchases )
, cte5 as (select *, dense_rank() over (partition by user_id order by purchase_date) from cte4
)
,cte6 as (select *, case when purchase_date- minpurchase =1 then 'new' else 'repeat' end as flag from cte5)
select * from cte6;




# user_id	purchase_date	minpurchase	    dense_rank() over (partition by user_id order by purchase_date)	flag
1	        2024-01-01	        2024-01-01	    1	                                                        repeat
1	        2024-01-05          2024-01-01	    2	                                                        repeat
1	        2024-01-20	        2024-01-01	    3	                                                        repeat
2	        2024-01-02          2024-01-02	    1	                                                        repeat
2	2024-01-03	2024-01-02	2	new
3	2024-01-10	2024-01-10	1	repeat
3	2024-02-01	2024-01-10	2	repeat
4	2024-01-15	2024-01-15	1	repeat


    
with cte4 as( 
select  user_id, purchase_date,min(purchase_date)  over (partition by user_id order by purchase_date)  as minpurchase from purchases )
, cte5 as (select *, dense_rank() over (partition by user_id order by purchase_date) from cte4
)
,cte6 as (select a.*, case when a.purchase_date=a.minpurchase then 1 else 0 end as first_visit_flag,
case when a.purchase_date != a.minpurchase  then 1 else 0 end as repeat_visit_flag from cte5 a join cte4 b on a.user_id=b.user_id)
select * from cte6;

# user_id	purchase_date	minpurchase	dense_rank() over (partition by user_id order by purchase_date)	first_visit_flag	repeat_visit_flag
1	2024-01-01	2024-01-01	1	1	0
1	2024-01-01	2024-01-01	1	1	0
1	2024-01-01	2024-01-01	1	1	0
1	2024-01-05	2024-01-01	2	0	1
1	2024-01-05	2024-01-01	2	0	1
1	2024-01-05	2024-01-01	2	0	1
1	2024-01-20	2024-01-01	3	0	1
1	2024-01-20	2024-01-01	3	0	1
1	2024-01-20	2024-01-01	3	0	1
2	2024-01-02	2024-01-02	1	1	0
2	2024-01-02	2024-01-02	1	1	0
2	2024-01-03	2024-01-02	2	0	1
2	2024-01-03	2024-01-02	2	0	1
3	2024-01-10	2024-01-10	1	1	0
3	2024-01-10	2024-01-10	1	1	0
3	2024-02-01	2024-01-10	2	0	1
3	2024-02-01	2024-01-10	2	0	1
4	2024-01-15	2024-01-15	1	1	0




