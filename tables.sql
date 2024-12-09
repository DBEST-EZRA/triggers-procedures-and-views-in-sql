CREATE DATABASE CarDealershipDB;
GO

USE CarDealershipDB;
GO

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