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
  
