USE hardijayani_db
GO

SELECT ProductId, ProductName, UnitPrice FROM Products WHERE UnitPrice<20;
SELECT ProductId, ProductName, UnitPrice FROM Products WHERE UnitPrice BETWEEN 15 AND 25;
SELECT ProductName, UnitPrice FROM Products WHERE UnitPrice > (SELECT AVG(UnitPrice) FROM Products);
SELECT AVG(UnitPrice) FROM Products;
SELECT TOP 10 ProductName, UnitPrice FROM Products ORDER BY UnitPrice DESC;
SELECT Count(ProductName) FROM Products GROUP BY Discontinued;

