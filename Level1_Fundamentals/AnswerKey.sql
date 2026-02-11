--Round 01--
Select Top 10
CustomerID,
FirstName,
LastName,
EmailAddress
From SalesLT.Customer;
--Round 02--
Select Top 15 
CustomerID,
FirstName,
LastName,
CompanyName
From SalesLT.Customer
Where CompanyName is not null;
--Round 03--
Select Top 10
ProductID,
Name,
ListPrice,
Color
From SalesLT.Product
Order By ListPrice Desc;
--Round 04--
Select ProductID,
Name,
ProductNumber,
ListPrice
From SalesLT.Product
Where Name like '%Road%'
Order By Name Asc;
--Round 05--
Select ProductID,
Name,
ListPrice
From SalesLT.Product
Where ProductNumber Like 'FR%'
Order By ProductNumber Asc;
--Round 06--
Select Top 15
ProductID,
Name,
ListPrice
From SalesLT.Product
Where ListPrice > 500
Order By ListPrice Desc;
--Round 07--
Select Count(SalesOrderID)
From SalesLT.SalesOrderHeader;
--Round 08--
Select SUM(TotalDue)
From SalesLT.SalesOrderHeader;
--Round 09--
Select AVG(UnitPrice)
From SalesLT.SalesOrderDetail;
--Round 10--
Select Count(ProductID)
From SalesLT.Product
Where Name Like '%Road%';
