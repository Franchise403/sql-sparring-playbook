Level 1 — Fundamentals (AdventureWorksLT2022 / SalesLT)

Round 01 — SELECT TOP

Table: SalesLT.Customer
Return: CustomerID, FirstName, LastName, EmailAddress

Task: Return the first 10 customers.
Clauses: SELECT, TOP, FROM

Round 02 — WHERE IS NOT NULL

Table: SalesLT.Customer
Return: CustomerID, FirstName, LastName, CompanyName

Task: Return the top 15 customers where CompanyName is not null.
Clauses: SELECT, TOP, FROM, WHERE

Round 03 — ORDER BY DESC

Table: SalesLT.Product
Return: ProductID, Name, ListPrice, Color

Task: Return the top 10 most expensive products, sorted by ListPrice DESC.
Clauses: SELECT, TOP, FROM, ORDER BY

Round 04 — LIKE contains search

Table: SalesLT.Product
Return: ProductID, Name, ProductNumber, ListPrice

Task: Return products where Name contains 'Road', sort by Name ASC.
Clauses: SELECT, FROM, WHERE, LIKE, ORDER BY

Round 05 — LIKE starts-with search

Table: SalesLT.Product
Return: ProductID, Name, ListPrice

Task: Return products where ProductNumber starts with 'FR', sort by ProductNumber ASC.
Clauses: SELECT, FROM, WHERE, LIKE, ORDER BY

Round 06 — WHERE numeric filter + ORDER BY

Table: SalesLT.Product
Return: ProductID, Name, ListPrice

Task: Return the top 15 products where ListPrice > 500, sort by ListPrice DESC.
Clauses: SELECT, TOP, FROM, WHERE, ORDER BY

Round 07 — Aggregate COUNT

Table: SalesLT.SalesOrderHeader
Return: COUNT of SalesOrderID

Task: Return the total number of orders in the table.
Clauses: SELECT, COUNT, FROM

Round 08 — Aggregate SUM (guaranteed output)

Table: SalesLT.SalesOrderHeader
Return: SUM of TotalDue

Task: Return the total sales amount across all orders.
Clauses: SELECT, SUM, FROM

Round 09 — Aggregate AVG (guaranteed output)

Table: SalesLT.SalesOrderDetail
Return: AVG of UnitPrice

Task: Return the average unit price across all order details.
Clauses: SELECT, AVG, FROM

Round 10 — Aggregate COUNT with WHERE + LIKE

Table: SalesLT.Product
Return: COUNT of ProductID

Task: Count how many products have Name containing 'Road'.
Clauses: SELECT, COUNT, FROM, WHERE, LIKE
