-- Prevent deleting cars associated with sales
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