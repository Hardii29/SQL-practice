create procedure avgfreight
@CustomerID nchar(5),
@average money output
as 
begin
select @average=avg(freight) from orders where customerID= @CustomerID
end

declare @avg money
execute avgfreight 'MORGK', @avg output
print @avg

create procedure getEmpSales
@Country nvarchar(15),
@emp_id int,
@sale int output
as 
begin
select @sale=count(ShipName) from orders where ShipCountry = @Country
end

declare @empsales int 
execute getEmpSales 'France', '2', @empsales output
print @empsales

create procedure saleByYear
@year int,
@sale int output
as 
begin
select @sale=count(ShipName) from orders where year(shippedDate)= @year
end

declare @SaleoverYear int
execute saleByYear 1998, @SaleoverYear output
print @SaleoverYear

CREATE PROCEDURE GetSalesByCategory
AS
BEGIN
    SELECT  c.CategoryName, p.ProductName, SUM(od.Quantity * (od.UnitPrice - od.Discount)) AS TotalSales
    FROM  Categories c
        INNER JOIN Products p ON c.CategoryID = p.CategoryID
        INNER JOIN [Order Details] od ON p.ProductID = od.ProductID
    GROUP BY  c.CategoryName, p.ProductName
    ORDER BY  c.CategoryName, TotalSales DESC;
END;

exec GetSalesByCategory

CREATE PROC GetTenExProduct
AS
BEGIN
SELECT TOP 10 ProductName, UnitPrice FROM Products ORDER BY UnitPrice DESC
END

GetTenExProduct

CREATE PROCEDURE InsertCustomerOrderDetails
    @CustomerID nchar(5),
    @OrderID int,
    @ProductID int,
    @UnitPrice money,
    @Quantity smallint,
    @Discount real
AS
BEGIN
    INSERT INTO [Order Details] (OrderID, ProductID, UnitPrice, Quantity, Discount)
    VALUES (@OrderID, @ProductID, @UnitPrice, @Quantity, @Discount);

    UPDATE Orders
    SET CustomerID = @CustomerID
    WHERE OrderID = @OrderID;
END;
EXEC InsertCustomerOrderDetails 'ALFKI',12345, 11, 45.5, 2, 0.2
SELECT * FROM [Order Details] WHERE OrderID = 12345;

CREATE PROCEDURE UpdateCustomerOrderDetails
    @OrderID int,
    @ProductID int,
    @UnitPrice money,
    @Quantity smallint,
    @Discount real
AS
BEGIN
    UPDATE [Order Details]
    SET UnitPrice = @UnitPrice,
        Quantity = @Quantity,
        Discount = @Discount
    WHERE OrderID = @OrderID
        AND ProductID = @ProductID;
END;

EXEC UpdateCustomerOrderDetails
    @OrderID = 10248,
    @ProductID = 11,
    @UnitPrice = 12.99,
    @Quantity = 8,
    @Discount = 0.1;

SELECT * FROM [Order Details] WHERE OrderID = 10248;
