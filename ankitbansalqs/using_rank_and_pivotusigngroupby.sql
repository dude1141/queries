
use sakila;

-- Create tables
CREATE TABLE department (
    dep_id INT,
    dep_name VARCHAR(50)
);

CREATE TABLE empdetails (
    emp_id INT,
    first_name VARCHAR(50),
    gender VARCHAR(1),
    dep_id INT
);

CREATE TABLE client (
    client_id INT,
    client_name VARCHAR(50)
);

CREATE TABLE empsales (
    emp_id INT,
    client_id INT,
    sales INT
);

-- Insert data
INSERT INTO department (dep_id, dep_name) VALUES
(1, 'Electronics'),
(2, 'Furniture'),
(3, 'Clothing');

INSERT INTO empdetails (emp_id, first_name, gender, dep_id) VALUES
(101, 'Alice', 'F', 1),
(102, 'Bob', 'M', 1),
(103, 'Charlie', 'M', 2),
(104, 'Diana', 'F', 2),
(105, 'Ethan', 'M', 3),
(106, 'Fiona', 'F', 3);

INSERT INTO client (client_id, client_name) VALUES
(1, 'Amazon'),
(2, 'Walmart'),
(3, 'Costco'),
(4, 'Target'),
(5, 'BestBuy');

INSERT INTO empsales (emp_id, client_id, sales) VALUES
(101, 1, 5000),
(101, 2, 3000),
(102, 1, 7000),
(102, 3, 2000),
(103, 2, 4000),
(103, 4, 3000),
(104, 4, 6000),
(105, 5, 8000),
(106, 3, 5000),
(106, 5, 2000);


-- Write a query to find the client-- _id and emp_id of the best client and the best employee respectively for each department.
-- dept_id,best_emp,best_client in each dept-- 


select * From department;
select * From  client;
select * From empdetails;
select * From empsales;

with cte as(
select a.emp_id,b.dep_id,SUM(a.sales) AS sumsales from empsales a join  empdetails b on a.emp_id=b.emp_id join department d on b.dep_id=d.dep_id join empsales e
on e.emp_id=b.emp_id GROUP BY a.emp_id, b.dep_id ) ,

-- select * From cte; 

cte2 as(
select d.dep_id ,b.emp_id from  empdetails b join department d on b.dep_id=d.dep_id )

/* select  a2.dep_id,a1.emp_id,(a1.sumsales) AS dept_sumsales,  ROW_NUMBER() OVER (
        PARTITION BY a2.dep_id
        ORDER BY (a1.sumsales) DESC
    ) AS dept_rank from  cte a1 join cte2  a2 on a1.emp_id=a2.emp_id GROUP BY a2.dep_id;
*/

select  a2.dep_id,a1.emp_id,(a1.sumsales) AS dept_sumsales,  ROW_NUMBER() OVER (
        PARTITION BY a2.dep_id
        ORDER BY (a1.sumsales) DESC
    ) AS dept_rank from  cte a1 join cte2  a2 on a1.emp_id=a2.emp_id GROUP BY a2.dep_id;


-- right answer: 
with cte3 as(
select a.emp_id,b.dep_id,SUM(a.sales) AS sumsales from empsales a join  empdetails b on a.emp_id=b.emp_id 
 GROUP BY a.emp_id, b.dep_id  ) 
 
 select * from (
 select  dep_id, emp_id,(sumsales) AS dept_sumsales,  RANK() OVER (
        PARTITION BY dep_id
        ORDER BY (sumsales) DESC
    ) AS dept_rank from  cte3 ) a1
    where dept_rank=1;
-- if you client id then repeat it

with cte3 as(
select a.emp_id,b.dep_id,SUM(a.sales) AS sumsales from empsales a join  empdetails b on a.emp_id=b.emp_id 
 GROUP BY a.emp_id, b.dep_id  ) 
 ,
 bestemp as(
 select * from (
 select  dep_id, emp_id,(sumsales) AS dept_sumsales,  RANK() OVER (
        PARTITION BY dep_id
        ORDER BY (sumsales) DESC
    ) AS dept_rank from  cte3 ) a1
    where dept_rank=1 ),

cte4 as(
select b.dep_id,a.client_id,SUM(a.sales) AS sumsales from empsales a join  empdetails b on a.emp_id=b.emp_id 
 GROUP BY b.dep_id, a.client_id  ) ,
 
 bestclient as (
 select * from (
 select  client_id, dep_id,(sumsales) AS client_sales,  RANK() OVER (
        PARTITION BY dep_id
        ORDER BY (sumsales) DESC
    ) AS dept_rank from  cte4 ) a1
    where dept_rank=1)
    
   select * From bestemp b1 join bestclient a1 on b1.dep_id=a1.dep_id;
    
    -- use union istead of seperate cte
  -- ;
  

  with cte5 as (select s.*, e.dep_id From empsales s join empdetails e on e.emp_id=s.emp_id), 
    emp_client_cte as (  
	select dep_id, emp_id as id ,'emp' as salestype , sum(Sales) AS sales from 
    cte5 group by emp_id,  dep_id
    union all
    select dep_id, client_id ,'client' as salestype , sum(Sales) AS client_sales from 
    cte5 group by client_id,  dep_id
    ) 
    
     select * from (
 select  *,  RANK() OVER (
        PARTITION BY dep_id, salestype
        ORDER BY (sales) DESC
    ) AS dept_rank from  emp_client_cte ) a1
    where dept_rank=1
    ;
    
    
    
    -- pivot it
    
  with cte5 as (select s.*, e.dep_id From empsales s join empdetails e on e.emp_id=s.emp_id), 
    emp_client_cte as (  
	select dep_id, emp_id as id ,'emp' as salestype , sum(Sales) AS sales from 
    cte5 group by emp_id,  dep_id
    union all
    select dep_id, client_id ,'client' as salestype , sum(Sales) AS client_sales from 
    cte5 group by client_id,  dep_id
    )     
     select dep_id,
    max(case when salestype='client' then id end )as client_id ,
     max(case when salestype='emp' then id end) as emp_id 
     from (
 select  *,  RANK() OVER (
        PARTITION BY dep_id, salestype
        ORDER BY (sales) DESC
    ) AS dept_rank from  emp_client_cte ) a1
    where dept_rank=1 GROUP BY dep_id
    
    