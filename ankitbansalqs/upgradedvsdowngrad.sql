

CREATE TABLE Subscriber (
    CustomerID INT,
    month DATE,
    PlanValue INT
);

INSERT INTO Subscriber VALUES
(1, '2023-03-02', 799),
(1, '2023-04-01', 599),
(1, '2023-05-01', 499),
(2, '2023-04-02', 799),
(2, '2023-07-01', 599),
(2, '2023-09-01', 499),
(3, '2023-01-01', 499),
(3, '2023-04-01', 599),
(3, '2023-07-02', 799),
(4, '2023-04-01', 499),
(4, '2023-09-01', 599),
(4, '2023-10-02', 499),
(4, '2023-11-02', 799),
(5, '2023-10-02', 799),
(5, '2023-11-02', 799),
(6, '2023-03-01', 499);


select * From Subscriber;

delete from Subscriber;

select customerID,  min(Planvalue) ,max(Planvalue) From Subscriber group by customerID;

-- wrong way
-- with cte as 
--  ( select customerID,
-- LAG(PlanValue) OVER(PARTITION BY customerID ORDER BY Month(month) )AS one_day_before,
-- PlanValue - LAG(PlanValue) OVER(PARTITION BY customerID  ORDER BY Month(month)) AS daily_change
-- from Subscriber ) 
--     select customerID, case when  one_day_before-daily_change >1 then 'upgraded' else 'downgraded' end as 'new' from cte
--     group by customerID;
 ----

with cte as 
 ( select customerID,PlanValue,
LAG(PlanValue,1) OVER(PARTITION BY customerID ORDER BY Month(month) )AS preplanvalue
from Subscriber ) 
    select customerId,
    case when  PlanValue > preplanvalue  then 1 else 0 end as has_upgraded,
    case when  PlanValue < preplanvalue  then 1 else 0 end as has_downgraded from cte ;
    
 --    select customerID, has_upgraded ,has_downgraded from cte2 group by customerID ,has_upgraded,has_downgraded;

with cte2 as 
 ( select customerID,PlanValue,
LAG(PlanValue,1) OVER(PARTITION BY customerID ORDER BY Month(month) )AS preplanvalue
from Subscriber ) 
    select  customerID, max(case when  PlanValue > preplanvalue  then 1 else 0 end) as has_upgraded,
    max(case when  PlanValue < preplanvalue  then 1 else 0 end) as has_downgraded  from cte2 group by  customerID;
    