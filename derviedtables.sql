-- use sakila;
-- CREATE TABLE ACCT_MASTER (
--     ACID INT PRIMARY KEY,
--     NAME VARCHAR(50),
--     ADDRESS VARCHAR(50),
--     BRID VARCHAR(10),
--     PID VARCHAR(10),
--     DOO DATETIME,
--     CBALANCE DECIMAL(10,2),
--     UBALANCE DECIMAL(10,2),
--     STATUS CHAR(1)
-- );
-- INSERT INTO ACCT_MASTER VALUES
-- (101, 'Ravi Chandran', 'Pune', 'BR2', 'SB', '2011-10-23 00:00:00', 500.00, 1000.00, 'O'),
-- (102, 'Venkat Rao', 'US', 'BR1', 'FD', '2011-11-02 00:00:00', 5000.00, 5000.00, 'O'),
-- (103, 'Vimala', 'Hyd', 'BR3', 'SB', '2011-11-06 00:00:00', 500.00, 7000.00, 'O'),
-- (104, 'Uday Kumar', 'Chn', 'BR3', 'SB', '2011-11-20 00:00:00', 8000.00, 8000.00, 'O'),
-- (105, 'Aravind Reddy', 'Chn', 'BR3', 'LA', '2011-12-22 00:00:00', 10000.00, 10000.00, 'O'),
-- (106, 'Shiva Kumar', 'Hyd', 'BR4', 'SB', '2012-02-15 00:00:00', 500.00, 5000.00, 'O'),
-- (107, 'Shravan Kumar', 'BLR', 'BR5', 'FD', '2012-03-17 00:00:00', 7500.00, 7500.00, 'O'),
-- (108, 'Bhaskar Jogi', 'Hyd', 'BR3', 'SB', '2013-01-02 00:00:00', 1000.00, 1000.00, 'O');


-- CREATE TABLE TXN_MASTER (
--     DOT DATETIME,
--     ACID INT,
--     BRID VARCHAR(10),
--     TXN_TYPE CHAR(2),
--     CHQ_NO VARCHAR(20),
--     CHQ_DATE DATETIME,
--     TXN_AMOUNT DECIMAL(10,2),
--     UID INT
-- );


-- INSERT INTO TXN_MASTER VALUES
-- ('2004-12-15 00:00:00', 101, 'BR4', 'CD', NULL, NULL, 3400.00, 2),
-- ('2004-12-15 00:00:00', 102, 'BR8', 'CD', NULL, NULL, 6400.00, 2),
-- ('2005-01-20 00:00:00', 102, 'BR7', 'CW', NULL, NULL, 1500.00, 4),
-- ('2005-01-24 00:00:00', 102, 'BR6', 'CW', NULL, NULL, 2300.00, 1),
-- ('2005-01-20 00:00:00', 104, 'BR5', 'CD', NULL, NULL, 3400.00, 3),
-- ('2005-01-20 00:00:00', 104, 'BR7', 'CD', NULL, NULL, 1200.00, 3),
-- ('2004-11-05 00:00:00', 107, 'BR4', 'CW', NULL, NULL, 748.00, 2),
-- ('2005-01-14 00:00:00', 107, 'BR5', 'CW', NULL, NULL, 400.00, 4),
-- ('2005-01-18 00:00:00', 107, 'BR8', 'CW', NULL, NULL, 1200.00, 3),
-- ('2004-09-14 00:00:00', 107, 'BR5', 'CD', NULL, NULL, 400.00, 4),
-- ('2004-01-22 00:00:00', 107, 'BR9', 'CD', NULL, NULL, 1200.00, 1),

-- ('2004-09-14 00:00:00', 107, 'BR5', 'CD', NULL, NULL, 400.00, 4),
-- ('2004-01-22 00:00:00', 107, 'BR9', 'CD', NULL, NULL, 1200.00, 1),
-- ('2005-01-20 00:00:00', 103, 'BR5', 'CD', NULL, NULL, 567.00, 4),
-- ('2005-01-23 00:00:00', 103, 'BR7', 'CD', NULL, NULL, 1230.00, 4),
-- ('2005-01-23 00:00:00', 103, 'BR8', 'CW', NULL, NULL, 1234.00, 3),

-- ('2011-01-04 00:00:00', 104, 'BR3', 'CW', NULL, NULL, 5261.00, 6),
-- ('2011-01-04 00:00:00', 104, 'BR4', 'CW', NULL, NULL, 3723.00, 3),
-- ('2011-01-04 00:00:00', 104, 'BR5', 'CW', NULL, NULL, 4847.00, 2),
-- ('2011-01-04 00:00:00', 104, 'BR9', 'CW', NULL, NULL, 9847.00, 8),
-- ('2011-01-04 00:00:00', 104, 'BR5', 'CW', NULL, NULL, 5247.00, 7);


select * from ACCT_MASTER;

select * from TXN_MASTER;

select ACID, count(*) 
from TXN_MASTER
-- where month(DOT)=11
 group by ACID
having count(*) > 3;

-- derived table k has aggregation and group and we are joining 
SELECT  * FROM
    ACCT_MASTER AS m  JOIN
    (SELECT ACID, COUNT(*) FROM TXN_MASTER
    GROUP BY ACID
    HAVING COUNT(*) > 3) AS K ON k.acid = m.acid;

-- use only joins 
-- we are grouping on both columns 
select a.ACID, name, count(*) 
from TXN_MASTER a join ACCT_MASTER b on a.acid= b.acid
 group by ACID,name
having count(*) > 3 ;





