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