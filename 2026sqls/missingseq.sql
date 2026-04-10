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
	null  1	    2
    1	  2	    3
    2	  3     5
    3	  5	    6
    5	  6	    8
    6  	  8	    9
    8	  9	   10
    9	  10  null


with cte1 as (
select
lag(num) over ( order by num) as prevs,
num,
lead(num) over (order by num ) as nexts
from numbers)
select num+1  as missingfrom, nexts-1 as missingto
from cte1 where nexts-num >1;

we need to substract where nexts-num>1 so obvioulsy  i will be nums of 3 and 6 >1
so we need to get the num+1 and nexts-1

# missingfrom	missingto
		4			4
		7			7



