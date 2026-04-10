-- Write a SQL query to find all the missing numbers in the sequence.

CREATE TABLE numbers ( num INT);
INSERT INTO numbers (num) VALUES
(1),(2),(3),(5),(6),(8),(9),(10);

with cte1 as (
select
lag(num) over ( order by num) as prevs,
num,
lead(num) over (order by num ) as nexts
from numbers)


# prevs	num	nexts
	      1	    2
    1	  2	    3
    2	  3     5
    3	  5	    6
    5	  6	    8
    6  	8	    9
    8	  9	  10
        9	  10	
