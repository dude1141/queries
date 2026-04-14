with ctes as (
    select 
        user_id,
        lag(login_date) over (partition by user_id order by login_date) as prevs,
        login_date,
        lead(login_date) over (partition by user_id order by login_date) as nexts
    from loginss
)
select distinct user_id
from ctes
where datediff(login_date, prevs) = 1
  and datediff(nexts, login_date) = 1;



consecutive days more than 3:

 with cte as(
  select * ,
  dense_rank() over (partition by user_id order by user_id,login_date),
  date_sub(login_date,interval dense_rank() over
  (partition by user_id order by user_id,login_date)  day) as dtgrp
  from loginss)
    select user_id ,dtgrp ,count(1) from cte group by user_id ,dtgrp having count(1) >3
 


#we need to do minus logindate - denserrank  interval to get the dategrp and group it over user_id
    
select * ,
  dense_rank() over (partition by user_id order by user_id,login_date),
  date_sub(login_date,interval dense_rank() over
  (partition by user_id order by user_id,login_date)  day) as dtgrp
  from loginss
    
# user_id	login_date	dense_rank() over (partition by user_id order by user_id,login_date)	dtgrp
    1	    2024-01-01    	1        	2023-12-31
    1	    2024-01-02	    2	        2023-12-31
    1	    2024-01-03	    3	        2023-12-31
    1	    2024-01-04	    4	        2023-12-31
    1	    2024-01-06	    5	        2024-01-01
    2	    2024-01-01    	1	        2023-12-31
    2	    2024-01-03	    2	        2024-01-01
    2	    2024-01-05	    3	        2024-01-02
    2	    2024-01-07	    4	        2024-01-03
    2	    2024-01-10	    5	        2024-01-05
    3	    2024-01-10	    1	        2024-01-09
    3	    2024-01-11	    2	        2024-01-09
    3	    2024-01-12    	3        	2024-01-09


# we need to find if users login  least 3 different days, but not consecutive days 
#based on above we must 2 answer becayse 3 and 1 logged consective

  select * from loginss;
  
  with cte1 as (select distinct user_id, login_date from loginss)
  , cte2 as (select user_id,login_date,
  lag(login_date,1,login_date) over 
  (partition by user_id order by login_date) as lag_date,
  datediff(
  login_date,lag(login_date,1,login_date) 
  over (partition by user_id order by login_date) )as dates_diff 
  from cte1  )
  select * From cte2;
  ;
  cte3 as (select distinct(user_id) as distincuserid from cte2
  where dates_diff=1)
  select user_id from cte1 where user_id
  not in (select distincuserid from cte3 )
  group by user_id having count(*) >=3

** cte2 **
# user_id	login_date	lag_date	dates_diff
	1		2024-01-01	2024-01-01		0
	1		2024-01-02	2024-01-01		1
	1		2024-01-03	2024-01-02		1
	1		2024-01-04	2024-01-03		1
	1		2024-01-06	2024-01-04		2
	2		2024-01-01	2024-01-01		0
	2		2024-01-03	2024-01-01		2
	2		2024-01-05	2024-01-03		2
	2		2024-01-07	2024-01-05		2
	2		2024-01-10	2024-01-07		3
	3		2024-01-10	2024-01-10		0
	3		2024-01-11	2024-01-10		1
	3		2024-01-12	2024-01-11		1




INSERT INTO pwc_attandance_logs (emp_id, log_date, flag) VALUES
(101, '2024-01-02', 'N'),
(101, '2024-01-03', 'Y'),
(101, '2024-01-04', 'N'),
(101, '2024-01-07', 'Y'),
(102, '2024-01-01', 'N'),
(102, '2024-01-02', 'Y'),
(102, '2024-01-03', 'Y'),
(102, '2024-01-04', 'N'),
(102, '2024-01-05', 'Y'),
(102, '2024-01-06', 'Y'),
(102, '2024-01-07', 'Y'),
(103, '2024-01-01', 'N'),
(103, '2024-01-04', 'N'),
(103, '2024-01-05', 'Y'),
(103, '2024-01-06', 'Y'),
(103, '2024-01-07', 'N');

#get DAY, then create rownumber and then day-RN will give groups 

# emp_idog_date	flag	day	RN	grp
	101	2024-01-03	Y	3	1	2
	101	2024-01-07	Y	7	2	5
	102	2024-01-02	Y	2	1	1
	102	2024-01-03	Y	3	2	1
	102	2024-01-05	Y	5	3	2
	102	2024-01-06	Y	6	4	2
	102	2024-01-07	Y	7	5	2
	103	2024-01-05	Y	5	1	4
	103	2024-01-06	Y	6	2	4


	
select * from pwc_attandance_logs;
with cte4 as (select * , DAY(log_date) as day from  pwc_attandance_logs where flag='Y'),
 cte5 as (select  * ,row_number() over (partition by emp_id order by log_date) as RN from cte4),
 cte6 as (select *, day - RN as grp from cte5) 
 select emp_id, min(log_date) as startdate, max(log_date) as enddate
, count(1) From cte6 group by emp_id, grp;



