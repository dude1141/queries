-- Create Database (optional)
--CREATE DATABASE HRDB;
--GO

USE HRDB;
GO
/*
-- Create Employees Table
CREATE TABLE Employees (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    DepartmentID INT,
    Salary DECIMAL(10,2)
);
GO

-- Insert Sample Data
INSERT INTO Employees (FirstName, LastName, DepartmentID, Salary)
VALUES
('John', 'Smith', 1, 55000.00),
('Emily', 'Clark', 1, 62000.00),
('Michael', 'Brown', 1, 48000.00),
('Sarah', 'Johnson', 2, 71000.00),
('David', 'Wilson', 2, 53000.00),
('Olivia', 'Martinez', 2, 66000.00),
('Daniel', 'Lee', 3, 45000.00),
('Sophia', 'Kim', 3, 49000.00),
('James', 'Anderson', 3, 52000.00);
GO
*/
-- ✅ Query: Employees earning more than the average salary in their department


--select * From EMP where avg(salary) > (select department_id,avg(SALARY) from emp group by DEPARTMENT_ID) pedda boothu idhie;
--always it should be single value comparision

select * From employees;

SELECT e.FirstName, e.LastName, e.DepartmentID, e.Salary FROM Employees e WHERE
e.Salary > ( SELECT AVG(Salary)  FROM Employees f  WHERE f.DepartmentID = e.DepartmentID );

