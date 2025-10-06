

USE SalesDB;
GO
/*
-- Create Customers Table
CREATE TABLE Customers (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100)
);
GO

-- Create Orders Table
CREATE TABLE Orders (
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
    OrderValue DECIMAL(10,2)
);
GO

-- Insert Sample Data into Customers
INSERT INTO Customers (FirstName, LastName)
VALUES
('Alice', 'Wong'),
('Robert', 'Lee'),
('Jessica', 'Adams'),
('Thomas', 'Nguyen'),
('Sophia', 'Martinez'),
('Daniel', 'Brown');
GO

-- Insert Sample Data into Orders
INSERT INTO Orders (CustomerID, OrderValue)
VALUES
(1, 250.00),
(1, 400.00),
(2, 1200.00),
(2, 200.00),
(2, 350.00),
(3, 99.99),
(4, 500.00),
(4, 300.00),
(5, 700.00),
(6, 50.00);
GO

*/

--Use a subquery in the WHERE clause to filter customers who have placed more orders than the average number of orders per customer.
--You will need to calculate the average number of orders using a subquery on the Orders table.

select * from Customers;s
select * from Orders;
--select count(OrderID) from orders o join Customers c on o.CustomerID=c.CustomerID;

select * From Customers c join Orders o on c.CustomerID=o.CustomerID where o.orderID > (select avg(orderID) from orders o where c.CustomerID=o.CustomerID );


(select avg(orderID) from orders o where c.CustomerID=o.CustomerID;


-- Select Customers Who Placed More Orders Than the Average


select CustomerID, FirstName, LastName
From Customers where customerID in (
	SELECT CustomerID
    FROM Orders
    GROUP BY CustomerID
    HAVING COUNT(OrderID) >(  --those customers whose count is above that average.
	
 SELECT avg(ordercount) ---avg Order per customer
        FROM (
            SELECT COUNT(OrderID) AS OrderCount
            FROM Orders
            GROUP BY CustomerID
        ) AS SubQuery)
		)
		;
