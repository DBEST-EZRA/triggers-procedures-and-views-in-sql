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