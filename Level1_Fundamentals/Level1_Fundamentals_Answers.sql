--Round 01--
SELECT TOP 10
CustomerID,
FirstName,
LastName,
EmailAddress
FROM SalesLT.Customer;
--Round 02--
SELECT TOP 15 
CustomerID,
FirstName,
LastName,
CompanyName
FROM SalesLT.Customer
WHERE CompanyName IS NOT NULL;
--Round 03--
SELECT TOP 10
ProductID,
Name,
ListPrice,
Color
FROM SalesLT.Product
ORDER BY ListPrice DESC;
--Round 04--
SELECT ProductID,
Name,
ProductNumber,
ListPrice
FROM SalesLT.Product
WHERE Name LIKE '%Road%'
ORDER BY Name ASC;
--Round 05--
SELECT ProductID,
Name,
ListPrice
FROM SalesLT.Product
WHERE ProductNumber LIKE 'FR%'
ORDER BY ProductNumber ASC;
--Round 06--
SELECT TOP 15
ProductID,
Name,
ListPrice
FROM SalesLT.Product
WHERE ListPrice > 500
ORDER BY ListPrice DESC;
--Round 07--
SELECT COUNT(SalesOrderID)
FROM SalesLT.SalesOrderHeader;
--Round 08--
SELECT SUM(TotalDue)
FROM SalesLT.SalesOrderHeader;
--Round 09--
SELECT AVG(UnitPrice)
FROM SalesLT.SalesOrderDetail;
--Round 10--
SELECT Count(ProductID)
FROM SalesLT.Product
WHERE Name LIKE '%Road%';