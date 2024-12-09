-- Modifying XML data
UPDATE Cars
SET Specifications.modify('replace value of (/Specifications/Color/text())[1] with "Blue"')
WHERE CarID = 1;
GO