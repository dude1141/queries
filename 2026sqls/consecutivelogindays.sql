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
