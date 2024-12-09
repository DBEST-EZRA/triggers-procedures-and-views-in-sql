-- Querying XML data
SELECT Specifications.value('(/Specifications/Color)[1]', 'NVARCHAR(50)') AS Color
FROM Cars;
GO