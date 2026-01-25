SELECT * FROM salesanalytics.sales;



CREATE TABLE orders (
    order_id     VARCHAR(20),
    product_id   VARCHAR(20),
    category     VARCHAR(30),
    sales        DECIMAL(10,2)
);

INSERT INTO orders (order_id, product_id, category, sales) VALUES
('CA-2021-140326', 'FUR-BO-10000112', 'Furniture', 825.174),
('CA-2018-105249', 'FUR-BO-10000330', 'Furniture', 411.332),
('CA-2019-130785', 'FUR-BO-10000330', 'Furniture', 411.332),
('CA-2021-125472', 'FUR-BO-10000330', 'Furniture', 241.960),
('US-2018-123183', 'FUR-BO-10000632', 'Furniture', 1025.880),
('CA-2019-118423', 'FUR-BO-10000632', 'Furniture', 359.058),
('CA-2018-133592', 'FUR-BO-10000662', 'Furniture', 341.960),
('CA-2018-156349', 'FUR-BO-10000462', 'Furniture', 290.666),
('CA-2020-165848', 'FUR-BO-10000468', 'Furniture', 194.320),
('CA-2018-156790', 'FUR-BO-10000468', 'Furniture', 155.456);


CREATE TABLE orders1 (
    row_id        INT,
    order_id      VARCHAR(20),
    order_date    DATE,
    ship_date     DATE,
    ship_mode     VARCHAR(30),
    customer_id   VARCHAR(20),
    customer_name VARCHAR(50),
    segment       VARCHAR(30),
    country       VARCHAR(30),
    city          VARCHAR(30),
    state         VARCHAR(30),
    postal_code   VARCHAR(10),
    region        VARCHAR(20),
    product_id    VARCHAR(20),
    category      VARCHAR(30),
    sales         DECIMAL(10,3)
);



INSERT INTO orders1 VALUES
(7821,'CA-2021-154236','2021-12-08','2021-12-10','Second Class',NULL,NULL,'Home Office','United States','Cranston','Rhode Island','2920','East','OFF-ST-10000036','Office Supplies',592.740),

(7822,'CA-2020-169334','2020-10-21','2020-10-24','Second Class','GW-14605','Giulietta Weimer','Consumer','United States','Jackson','Tennessee','38301','South','OFF-ST-10004950','Office Supplies',11.672),

(7823,'US-2018-115413','2018-08-26','2018-09-01','Standard Class','PP-18955','Paul Prost','Home Office','United States','Newark','Delaware','19711','East','OFF-AR-10003770','Office Supplies',8.640),

(7824,'US-2018-115413','2018-08-26','2018-09-01','Standard Class',NULL,'Paul Prost','Home Office','United States','Newark','Delaware','19711','East','TEC-AC-10002809','Technology',149.970),

(7825,'CA-2018-125150','2018-05-06','2018-05-23','Standard Class','PW-19030','Pauline Webber','Corporate','United States','Los Angeles','California','90036','West','FUR-CH-10002439','Furniture',232.880),

(7826,'CA-2019-127327','2019-02-03','2019-02-07','Standard Class','PW-19030','Pauline Webber','Corporate','United States','Rome','New York','13440','East','FUR-CH-10004218','Furniture',90.882),

(7827,'CA-2021-117114','2021-10-31','2021-11-05','Standard Class','CY-12745','Craig Yedwab','Corporate','United States','Chicago','Illinois','60610','Central','TEC-PH-10004042','Technology',508.768),

(7828,'CA-2021-117114','2021-10-31','2021-11-05','Standard Class','CY-12745','Craig Yedwab','Corporate','United States','Chicago','Illinois','60610','Central','OFF-EN-10001137','Office Supplies',9.912),

(7829,'CA-2019-137302','2019-04-26','2019-05-01','Standard Class','BW-11110','Bart Walters','Corporate','United States','San Diego','California','92105','West','FUR-CH-10002017','Furniture',63.936);



INSERT INTO orders1 VALUES
(7830,'CA-2020-145678','2020-11-15','2020-11-20','Standard Class',
 'AB-12345','Andrew Brown','Consumer','United States',
 'Boston','Massachusetts','02118','East',
 'OFF-ST-10002145','Office Supplies',45.980),

(7831,'US-2019-167890','2019-06-12','2019-06-18','Second Class',
 'LM-56789','Laura Martin','Corporate','United States',
 'Austin','Texas','73301','Central',
 'TEC-AC-10003112','Technology',299.990),

(7832,'CA-2018-198765','2018-03-05','2018-03-10','Standard Class',
 'JR-33445','James Ryan','Home Office','United States',
 'Seattle','Washington','98109','West',
 'FUR-CH-10001842','Furniture',184.450),

(7833,'US-2021-176543','2021-09-22','2021-09-27','First Class',
 'MT-77890','Maria Torres','Consumer','United States',
 'Miami','Florida','33101','South',
 'OFF-PA-10004567','Office Supplies',23.640),

(7834,'CA-2020-154321','2020-02-14','2020-02-18','Second Class',
 'DK-99887','Daniel King','Corporate','United States',
 'Denver','Colorado','80202','West',
 'TEC-PH-10004991','Technology',899.970),

(7835,'US-2019-188234','2019-12-01','2019-12-06','Standard Class',
 'SW-45678','Susan White','Home Office','United States',
 'Phoenix','Arizona','85004','West',
 'FUR-BO-10002765','Furniture',412.380),

(7836,'CA-2021-165432','2021-07-08','2021-07-13','Standard Class',
 'RT-22334','Robert Taylor','Consumer','United States',
 'Atlanta','Georgia','30303','South',
 'OFF-AR-10001984','Office Supplies',12.960),

(7837,'US-2018-132198','2018-10-19','2018-10-25','Second Class',
 'KH-90876','Kevin Hall','Corporate','United States',
 'San Jose','California','95112','West',
 'TEC-LA-10003628','Technology',649.500),

(7838,'CA-2020-178945','2020-08-03','2020-08-09','Standard Class',
 'PN-55667','Priya Nair','Home Office','United States',
 'Edison','New Jersey','08817','East',
 'OFF-BI-10004122','Office Supplies',6.480),

(7839,'US-2021-189654','2021-04-16','2021-04-20','First Class',
 'AM-11223','Anita Mehra','Consumer','United States',
 'Fremont','California','94538','West',
 'FUR-TA-10003319','Furniture',728.250);
select * From empss;

select * ,  
rank() over(  partition by department_id order by salary desc )as rnk,
row_number() over(  partition by department_id order by salary desc )as rown,
dense_rank() over(  partition by department_id order by salary desc )as denserank
from empss;

-- delete from empss;


-- top products by sales
-- check granualarity before ordering like partitioning 

select * from orders;

with cte as( select product_id, sum(sales) as sales From orders group by product_id)
select * From cte order by sales desc limit 5;


select * From orders order by order_id, product_id, category desc;



with ctes as( select year(order_date) as year_order, sum(sales) as sales From orders1 group by year(order_date)),
 cte2 as (select * ,  
lag(sales,1) over(   order by year_order desc )as prevyrsales from ctes)
select * ,((sales-prevyrsales)*100/prevyrsales) as yoy from cte2 ;





select * From orders1;


