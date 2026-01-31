
select * from customer_orders;

-- first_visit when customer ordered  for first time and then next i will calcuate the nextvisit 

-- then basis on this i will check use case when with order_date and first_vistDate 
with first_visit as (
select customer_id,min(order_date) as  first_visit_date from customer_orders
group by customer_id ) ,
 visits as (
select co.*, first_visit_date, 
case when co.order_date=first_visit_date then 1 else 0 end as firstvisitflag,
case when co.order_date!=first_visit_date then 1 else 0 end as repeatvisitflag
 from customer_orders co join first_visit f on co.customer_id =f.customer_id
 order by order_id)
 select order_date,sum(firstvisitflag) as newcus, sum(repeatvisitflag) as repeatcus
 from visits group by order_date;
 
 order_id,   customer_id, order_date, order_amount
'1',         '100',     '2022-01-01', '2000'
'2',         '200', '    2022-01-01', '2500'
'3',         '300',     '2022-01-01', '2100'
'4',         '100',     '2022-01-02', '2000'
'5',         '400',     '2022-01-02', '2200'
'6',         '500',     '2022-01-02', '2700'
'7',         '100',     '2022-01-03', '3000'
'8',         '400',     '2022-01-03', '1000'
'9',         '600',     '2022-01-03', '3000'


#order_date, newcus, repeatcus
'2022-01-01', '3', '0'
'2022-01-02', '2', '1'
'2022-01-03', '1', '2'
