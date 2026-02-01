use sakila;
/*
create table empss(
empss_id int,
empss_name varchar(20),
department_id int,
salary int,
manager_id int,
empss_age int);


insert into empss
values (1, 'Ankit', 100,10000, 4, 39);
insert into empss
values (2, 'Mohit', 100, 15000, 5, 48);
insert into empss
values (3, 'Vikas', 100, 10000,4,37);
insert into empss
values (4, 'Rohit', 100, 5000, 2, 16);
insert into empss
values (5, 'Mudit', 200, 12000, 6,55);
insert into empss
values (6, 'Agam', 200, 12000,2, 14);
insert into empss
values (7, 'Sanjay', 200, 9000, 2,13);
insert into empss
values (8, 'Ashish', 200,5000,2,12);
insert into empss
values (1, 'Saurabh',900,12000,2,51);
*/

select * From empss;

select * ,  
rank() over(  partition by department_id order by salary desc )as rnk,
row_number() over(  partition by department_id order by salary desc )as rown,
dense_rank() over(  partition by department_id order by salary desc )as denserank
from empss;

-- delete from empss;


-- top products by sales

select * from orders;

with cte as( select product_id, sum(sales) as sales From orders group by product_id)
select * From cte order by sales desc limit 5;


select * From orders order by order_id, product_id, category desc;



with ctes as( select year(order_date) as year_order, sum(sales) as sales From orders1 group by year(order_date)),
 cte2 as (select * ,  
lag(sales,1) over(   order by year_order desc )as prevyrsales from ctes)
select * ,((sales-prevyrsales)*100/prevyrsales) as yoy from cte2 ;





select * From orders1;



create table entries ( 
name varchar(20),
address varchar(20),
email varchar(20),
floor int,
resources varchar(10));

insert into entries 
values ('A','Bangalore','A@gmail.com',1,'CPU'),('A','Bangalore','A1@gmail.com',1,'CPU'),('A','Bangalore','A2@gmail.com',2,'DESKTOP')
,('B','Bangalore','B@gmail.com',2,'DESKTOP'),('B','Bangalore','B1@gmail.com',2,'DESKTOP'),('B','Bangalore','B2@gmail.com',1,'MONITOR');

select * From entries;

with first_visit as (
select name,floor,count(floor) as totalvisits ,
rank() over (partition by name order by count(1) desc) as rn from entries
group by name ,floor) ,
second as (
select name,count(1) as totalvisits , GROUP_CONCAT(resources,',') as newresources from entries group by name)
select f.name, floor as mostvisitedfloor,s.totalvisits ,  s.newresources From first_visit f 
inner join second s  on f.name=s.name where rn=1;






