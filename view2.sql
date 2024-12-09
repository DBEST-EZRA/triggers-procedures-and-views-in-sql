-- Premium customers
CREATE VIEW PremiumCustomers AS
SELECT c.CustomerID, c.Name, COUNT(s.SaleID) AS Purchases
FROM Customers c
JOIN Sales s ON c.CustomerID = s.CustomerID
WHERE s.Amount > 50000
GROUP BY c.CustomerID, c.Name;
GO