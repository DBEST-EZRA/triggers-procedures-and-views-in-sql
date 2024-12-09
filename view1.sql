-- Car sales summary
CREATE VIEW CarSalesSummary AS
SELECT c.Model, COUNT(s.SaleID) AS TotalSales, SUM(s.Amount) AS TotalRevenue
FROM Cars c
JOIN Sales s ON c.CarID = s.CarID
GROUP BY c.Model;
GO