-- Create Database 
CREATE DATABASE CarDealershipDB;
GO

USE CarDealershipDB;
GO

--  Table Creation
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name NVARCHAR(100),
    ContactInfo NVARCHAR(255)
);
GO

CREATE TABLE Cars (
    CarID INT PRIMARY KEY,
    Model NVARCHAR(100),
    Price DECIMAL(10, 2),
    Specifications XML
);
GO

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
    CarID INT FOREIGN KEY REFERENCES Cars(CarID),
    SaleDate DATE,
    Amount DECIMAL(10, 2)
);
GO

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name NVARCHAR(100),
    Role NVARCHAR(50)
);
GO

CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    CompanyName NVARCHAR(100),
    ContactInfo NVARCHAR(255)
);
GO

CREATE TABLE SalesLog (
    LogID INT IDENTITY(1, 1) PRIMARY KEY,
    SaleID INT,
    LogDate DATETIME
);
GO

--  Prevent deleting cars associated with sales
CREATE TRIGGER PreventCarDeletion
ON Cars
INSTEAD OF DELETE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM deleted d JOIN Sales s ON d.CarID = s.CarID)
    BEGIN
        RAISERROR ('Cannot delete cars that are associated with sales.', 16, 1);
        RETURN;
    END
    DELETE FROM Cars WHERE CarID IN (SELECT CarID FROM deleted);
END;
GO

-- Log sales into SalesLog
CREATE TRIGGER LogSales
ON Sales
AFTER INSERT
AS
BEGIN
    INSERT INTO SalesLog (SaleID, LogDate)
    SELECT SaleID, GETDATE() FROM inserted;
END;
GO

--  Car sales summary
CREATE VIEW CarSalesSummary AS
SELECT c.Model, COUNT(s.SaleID) AS TotalSales, SUM(s.Amount) AS TotalRevenue
FROM Cars c
JOIN Sales s ON c.CarID = s.CarID
GROUP BY c.Model;
GO

-- Premium customers
CREATE VIEW PremiumCustomers AS
SELECT c.CustomerID, c.Name, COUNT(s.SaleID) AS Purchases
FROM Customers c
JOIN Sales s ON c.CustomerID = s.CustomerID
WHERE s.Amount > 50000
GROUP BY c.CustomerID, c.Name;
GO

-- Get sales by a specific customer
CREATE PROCEDURE GetCustomerSales
@CustomerID INT
AS
BEGIN
    SELECT s.SaleID, s.SaleDate, s.Amount, c.Model
    FROM Sales s
    JOIN Cars c ON s.CarID = c.CarID
    WHERE s.CustomerID = @CustomerID;
END;
GO

-- Inserting XML data into Cars table
INSERT INTO Cars (CarID, Model, Price, Specifications)
VALUES (1, 'Sedan', 30000, '<Specifications><Color>Red</Color><Engine>2.0L</Engine></Specifications>');
GO

-- Querying XML data
SELECT Specifications.value('(/Specifications/Color)[1]', 'NVARCHAR(50)') AS Color
FROM Cars;
GO

-- Modifying XML data
UPDATE Cars
SET Specifications.modify('replace value of (/Specifications/Color/text())[1] with "Blue"')
WHERE CarID = 1;
GO

-- Searching XML data
SELECT * 
FROM Cars
WHERE Specifications.exist('/Specifications[Color="Blue"]') = 1;
GO
