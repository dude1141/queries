use Salestemp2;
go

/*

CREATE TABLE dbo.Customers (
    CustomerID   INT,
    FirstName    VARCHAR(100),
    LastName     VARCHAR(100),
    Country      VARCHAR(100),
    Score        INT
);
CREATE TABLE dbo.Employees (
    EmployeeID   INT,
    FirstName    VARCHAR(100),
    LastName     VARCHAR(100),
    Department   VARCHAR(100),
    BirthDate    DATE,
    Gender       CHAR(1),
    Salary       INT,
    ManagerID    INT
);
CREATE TABLE dbo.Products (
    ProductID   INT,
    Product     VARCHAR(100),
    Category    VARCHAR(100),
    Price       INT
);
CREATE TABLE dbo.Orders (
    OrderID        INT,
    ProductID      INT,
    CustomerID     INT,
    SalesPersonID  INT,
    OrderDate      DATE,
    ShipDate       DATE,
    OrderStatus    VARCHAR(50),
    ShipAddress    VARCHAR(255),
    BillAddress    VARCHAR(255),
    Quantity       INT,
    Sales          INT,
    CreationTime   DATETIME
);
CREATE TABLE dbo.OrdersArchive (
    OrderID        INT,
    ProductID      INT,
    CustomerID     INT,
    SalesPersonID  INT,
    OrderDate      DATE,
    ShipDate       DATE,
    OrderStatus    VARCHAR(50),
    ShipAddress    VARCHAR(255),
    BillAddress    VARCHAR(255),
    Quantity       INT,
    Sales          INT,
    CreationTime   DATETIME
);


INSERT INTO dbo.Customers (CustomerID, FirstName, LastName, Country, Score) VALUES
(1, 'Jossef', 'Goldberg', 'Germany', 350),
(2, 'Kevin', 'Brown', 'USA', 900),
(3, 'Mary', NULL, 'USA', 750),
(4, 'Mark', 'Schwarz', 'Germany', 500),
(5, 'Anna', 'Adams', 'USA', NULL);


INSERT INTO dbo.Employees (EmployeeID, FirstName, LastName, Department, BirthDate, Gender, Salary, ManagerID) VALUES
(1, 'Frank', 'Lee', 'Marketing', '1988-12-05', 'M', 55000, NULL),
(2, 'Kevin', 'Brown', 'Marketing', '1972-11-25', 'M', 65000, 1),
(3, 'Mary', NULL, 'Sales', '1986-01-05', 'F', 75000, 1),
(4, 'Michael', 'Ray', 'Sales', '1977-02-10', 'M', 90000, 2),
(5, 'Carol', 'Baker', 'Sales', '1982-02-11', 'F', 55000, 3);




INSERT INTO dbo.Products (ProductID, Product, Category, Price) VALUES
(101, 'Bottle', 'Accessories', 10),
(102, 'Tire', 'Accessories', 15),
(103, 'Socks', 'Clothing', 20),
(104, 'Caps', 'Clothing', 25),
(105, 'Gloves', 'Clothing', 30);






INSERT INTO dbo.Orders
(OrderID, ProductID, CustomerID, SalesPersonID, OrderDate, ShipDate, OrderStatus,
 ShipAddress, BillAddress, Quantity, Sales, CreationTime)
VALUES
(1, 101, 2, 3, '2025-01-01', '2025-01-05', 'Delivered', '9833 Mt. Dias Blvd.', '1226 Shoe St.', 1, 10, '2025-01-01 12:34:56'),
(2, 102, 3, 3, '2025-01-05', '2025-01-10', 'Shipped', '250 Race Court', NULL, 1, 15, '2025-01-05 23:22:04'),
(3, 101, 1, 5, '2025-01-10', '2025-01-25', 'Delivered', '8157 W. Book', '8157 W. Book', 2, 20, '2025-01-10 18:24:08'),
(4, 105, 1, 3, '2025-01-20', '2025-01-25', 'Shipped', '5724 Victory Lane', NULL, 2, 60, '2025-01-20 05:50:33'),
(5, 104, 2, 5, '2025-02-01', '2025-02-05', 'Delivered', NULL, NULL, 1, 25, '2025-02-01 14:02:41'),
(6, 104, 3, 5, '2025-02-05', '2025-02-10', 'Delivered', '1792 Belmont Rd.', NULL, 2, 50, '2025-02-06 15:34:57'),
(7, 102, 1, 1, '2025-02-15', '2025-02-27', 'Delivered', '136 Balboa Court', NULL, 2, 30, '2025-02-16 06:22:01'),
(8, 101, 4, 3, '2025-02-18', '2025-02-27', 'Shipped', '2947 Vine Lane', '4311 Clay Rd', 3, 90, '2025-02-18 10:45:22'),
(9, 101, 2, 3, '2025-03-10', '2025-03-15', 'Shipped', '3768 Door Way', NULL, 2, 20, '2025-03-10 12:59:04'),
(10, 102, 3, 5, '2025-03-15', '2025-03-20', 'Shipped', NULL, NULL, 0, 60, '2025-03-16 23:25:15');



INSERT INTO dbo.OrdersArchive
(OrderID, ProductID, CustomerID, SalesPersonID, OrderDate, ShipDate, OrderStatus,
 ShipAddress, BillAddress, Quantity, Sales, CreationTime)
VALUES
(1, 101, 2, 3, '2024-04-01', '2024-04-05', 'Shipped', '123 Main St', '456 Billing St', 1, 10, '2024-04-01 12:34:56'),
(2, 102, 3, 3, '2024-04-05', '2024-04-10', 'Shipped', '456 Elm St', '789 Billing St', 1, 15, '2024-04-05 23:22:04'),
(3, 101, 1, 4, '2024-04-10', '2024-04-25', 'Shipped', '789 Maple St', '789 Maple St', 2, 20, '2024-04-10 18:24:08'),
(4, 105, 1, 3, '2024-04-20', '2024-04-25', 'Shipped', '987 Victory Lane', NULL, 2, 60, '2024-04-20 05:50:33'),
(4, 105, 1, 3, '2024-04-20', '2024-04-25', 'Delivered', '987 Victory Lane', NULL, 2, 60, '2024-04-20 14:50:33'),
(5, 104, 2, 5, '2024-05-01', '2024-05-05', 'Shipped', '345 Oak St', '678 Pine St', 1, 25, '2024-05-01 14:02:41'),
(6, 104, 3, 5, '2024-05-05', '2024-05-10', 'Delivered', '543 Belmont Rd.', NULL, 2, 50, '2024-05-06 15:34:57'),
(6, 104, 3, 5, '2024-05-05', '2024-05-10', 'Delivered', '543 Belmont Rd.', '3768 Door Way', 2, 50, '2024-05-07 13:22:05'),
(6, 101, 3, 5, '2024-05-05', '2024-05-10', 'Delivered', '543 Belmont Rd.', '3768 Door Way', 2, 50, '2024-05-12 20:36:55'),
(7, 102, 3, 5, '2024-06-15', '2024-06-20', 'Shipped', '111 Main St', '222 Billing St', 0, 60, '2024-06-16 23:25:15');


*/



--select * from Customers;

CREATE PROCEDURE getcustomer
AS
BEGIN
    SELECT * FROM dbo.Customers;
END
GO


exec getcustomer;


--define stored proceedure
--u can use alter procedure to change
--parameters needs datatype.


ALTER PROCEDURE getcustomers1 @Country NVARCHAR(50)
AS
BEGIN
    SELECT count(*) as totalcustomers FROM dbo.Customers where Country=@country ;

select count(o.OrderID) as totalorders, sum(o.Sales) as totalsales
from dbo.Customers c join dbo.Orders o on c.CustomerID=o.CustomerID
where c.Country= @country
END
GO


exec getcustomers1 @Country ='USA'


---we can declare variables and use inside ...


ALTER PROCEDURE getcustomers1 @Country NVARCHAR(50)
AS
BEGIN
    SELECT count(*) as totalcustomers FROM dbo.Customers where Country=@country ;

select count(o.OrderID) as totalorders, sum(o.Sales) as totalsales
from dbo.Customers c join dbo.Orders o on c.CustomerID=o.CustomerID
where c.Country= @country
END
GO