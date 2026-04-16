use tables;

CREATE TABLE customer_orderss (
    order_id INT,
    customer_id INT,
    order_date DATE,
    amount INT
);

INSERT INTO customer_orderss VALUES
(1, 101, '2024-01-01', 500),
(2, 101, '2024-01-05', 600),
(3, 101, '2024-01-20', 300),

(4, 102, '2024-01-03', 400),
(5, 102, '2024-01-15', 700),

(6, 103, '2024-01-10', 800),
(7, 103, '2024-01-12', 200),

(8, 104, '2024-01-01', 1000),

(9, 105, '2024-01-02', 300),
(10,105, '2024-01-08', 500);

select * from customer_orderss;
-- Have placed at least 2 orders.-- 
select customer_id from customer_orderss group by customer_id having count(order_id) >1;
-- Have placed their orders on at least 2 different dates.

select customer_id from customer_orderss group by customer_id having count(distinct order_date) >=2;
-- Their second order must be placed within 7 days of their first order.


-- means first order and second order diff must be less than seven
with ctes as (select customer_id, order_date, 
row_number() over (partition by customer_id order by order_date) as rn,
lag(order_date,1) over (partition by customer_id order by order_date) as lagdate 
from customer_orderss ) 
select * from ctes;
select *,DATEDIFF(order_date,lagdate) from ctes 
where  DATEDIFF(order_date, lagdate) <= 7 


# customer_id	order_date	rn	lagdate
  101	  2024-01-01    	1	
  101	  2024-01-05	    2	2024-01-01
  101	  2024-01-20	    3	2024-01-05
  102	  2024-01-03	    1	
  102	  2024-01-15	    2	2024-01-03
  103	  2024-01-10	    1	
  103	  2024-01-12	    2	2024-01-10
  104	  2024-01-01	    1	
  105	  2024-01-02	    1	
  105	  2024-01-08	    2	2024-01-02


