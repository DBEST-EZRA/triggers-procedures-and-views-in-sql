-- Searching XML data
SELECT * 
FROM Cars
WHERE Specifications.exist('/Specifications[Color="Blue"]') = 1;
GO