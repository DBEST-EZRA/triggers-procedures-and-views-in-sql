-- Inserting XML data into Cars table
INSERT INTO Cars (CarID, Model, Price, Specifications)
VALUES (1, 'Sedan', 30000, '<Specifications><Color>Red</Color><Engine>2.0L</Engine></Specifications>');
GO