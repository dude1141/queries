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
