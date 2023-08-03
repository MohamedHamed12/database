-- database: /run/media/mohamed/New Volume/Documents/programing/database/test.db

-- stored procedure named "SelectAllCustomers" that selects all records from the "Customers" table:
CREATE PROCEDURE SelectAllCustomers
AS
SELECT * FROM Customers
GO;

-- Execute the stored procedure above as follows:
EXEC SelectAllCustomers;



-- Stored Procedure With One Parameter
CREATE PROCEDURE SelectAllCustomers @City nvarchar(30)
AS
SELECT * FROM Customers WHERE City = @City
GO;

EXEC SelectAllCustomers @City = 'London';



-- Stored Procedure With Multiple Parameters

CREATE PROCEDURE SelectAllCustomers @City nvarchar(30), @Country nvarchar(30)
AS
SELECT * FROM Customers WHERE City = @City AND Country = @Country
GO;

EXEC SelectAllCustomers @City = 'London', @Country = 'UK';