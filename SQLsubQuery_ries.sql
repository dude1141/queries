-- Create the database
CREATE DATABASE SalesDemo1;
USE SalesDemo1;

-- Create the Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    City VARCHAR(100)
);

-- Create the Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    OrderTotal DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert sample data into Customers table
INSERT INTO Customers (CustomerID, CustomerName, City)
VALUES 
    (1, 'John Doe', 'New York'),
    (2, 'Jane Smith', 'Los Angeles'),
    (3, 'Alice Johnson', 'Chicago'),
    (4, 'Mike Brown', 'Houston');

-- Insert sample data into Orders table
INSERT INTO Orders (OrderID, CustomerID, OrderDate, OrderTotal)
VALUES 
    (1, 1, '2023-08-01', 250.00),
    (2, 1, '2023-08-10', 150.00),
    (3, 2, '2023-08-05', 400.00),
    (4, 2, '2023-09-12', 350.00),
    (5, 3, '2023-09-10', 600.00),
    (6, 4, '2023-09-15', 700.00);

-- ===============================================
-- Total Number of Orders Alongside Each Customer
-- ===============================================

-- Key Takeaways:
-- - Non-correlated subquery displays total orders alongside each customer.
-- - Subquery runs once; same value for all rows.

select * from Customers;
select * from Orders;

	select CustomerID, CustomerName, City , (Select count(*) from Orders) as a1 --subquery runs independently of main customer
	from Customers;

	--Number of orders per customer:

--	select CustomerID, CustomerName, City , 
--		( select count(*) from Orders o join Customer c on c.CustomerID=o.CustomerID)
	

--	select CustomerID, CustomerName, City , 
--		( select count(*) from Orders o join Customer c on c.CustomerID=o.CustomerID)

select * from Customers;
select * from Orders;
select CustomerID, CustomerName, City , 
	( select count(*) from Orders o where c.CustomerID=o.CustomerID) --subquery referes customerid from outquery custoerms socorelated
	from Customers c;  --runs for everyrow in outer query unique results for each



	-- Create the database
--CREATE DATABASE SalesAnalytics;
USE SalesAnalytics;

-- Create the Products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10, 2)
);

-- Create the Sales table
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    SaleDate DATE,
    Quantity INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);


-- Insert sample data into Products table
INSERT INTO Products (ProductID, ProductName, Category, Price)
VALUES 
(1, 'Laptop', 'Electronics', 1200.00),
(2, 'Smartphone', 'Electronics', 800.00),
(3, 'Desk Chair', 'Furniture', 150.00),
(4, 'Coffee Table', 'Furniture', 200.00),
(5, 'Headphones', 'Electronics', 150.00);

-- Insert sample data into Sales table
INSERT INTO Sales (SaleID, ProductID, SaleDate, Quantity)
VALUES 
(1, 1, '2023-08-01', 5),
(2, 2, '2023-08-03', 10),
(3, 1, '2023-08-10', 3),
(4, 3, '2023-09-01', 7),
(5, 4, '2023-09-15', 4),
(6, 2, '2023-09-20', 6),
(7, 5, '2023-10-05', 15),
(8, 5, '2023-10-10', 10);


 --Total Quantity Sold Per Product



 select ProductID, ProductName, Category , 
	( select count(Quantity) from Sales o where c.ProductID=o.ProductID group by ProductID) --subquery referes customerid from outquery custoerms socorelated
	from Products c;  --runs for everyrow in outer query unique results f

	 select ProductID, ProductName, Category , 
	( select sum(Quantity) from Sales o where c.ProductID=o.ProductID ) as totalqtysold  --subquery referes customerid from outquery custoerms socorelated
	from Products c;  --runs for everyrow in outer query unique results f


 --Total revenu per products:
	 select * From Products;
 select * From Sales;
	-- select P.ProductID, P.ProductName, P.Category , 
--	( select sum(S.Quantity * P.Price) from Sales S where S.ProductID=P.ProductID ) as totalqtysold 
--	from Products P;  


	SELECT 
    P.ProductID,
    P.ProductName,
    P.Category,
    P.Price,
    (SELECT SUM(S.Quantity) 
     FROM Sales S
     WHERE S.ProductID = P.ProductID)  * P.Price AS TotalRevenue 
FROM Products P;