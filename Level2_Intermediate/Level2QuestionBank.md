Level 2 Intermediate (AdventureWorksLT2022 / SalesLT) 

Round 01 — BETWEEN + Aliases

Table: SalesLT.Product

Alias: SalesLT.Product AS P

Return: ProductID, Name, ListPrice

Task: Return products where ListPrice is between 100 and 500, sorted by ListPrice DESC.

Clauses: SELECT, FROM, WHERE, BETWEEN, ORDER BY, Aliases

Round 02 — IN + Multi-column Sorting

Table: SalesLT.Product

Alias: SalesLT.Product AS P

Return: ProductID, Name, Color, ListPrice

Task: Return products where Color is in ('Black', 'Red', 'Silver'), sorted by Color ASC, ListPrice DESC.

Clauses: SELECT, FROM, WHERE, IN, ORDER BY (multi-column), Aliases

Round 03 — TOP + ORDER BY DESC

Table: SalesLT.Product

Alias: SalesLT.Product AS P

Return: ProductID, Name, ListPrice

Task: Return the top 10 most expensive products, sorted by ListPrice DESC.

Clauses: SELECT, TOP, FROM, ORDER BY, Aliases

Round 04 — GROUP BY + COUNT

Table: SalesLT.Product

Alias: SalesLT.Product AS P, Count AS CountID

Return: Color, ProductID

Task: Count products per Color (exclude NULL), sorted by ProductID DESC, Color ASC.

Clauses: SELECT, COUNT, FROM, WHERE, GROUP BY, ORDER BY (multi-column), Aliases

Round 05 — SUM Revenue per Order

Table: SalesLT.SalesOrderDetail

Alias: SalesLT.SalesOrderDetail AS SOD, SUM AS SaleTotal

Return: SalesOrderID, OrderQty, UnitPrice

Task: For each SalesOrderID, calculate SUM(OrderQty * UnitPrice), sorted by the SUM descending.

Clauses: SELECT, SUM, FROM, GROUP BY, ORDER BY, Aliases

Round 06 — HAVING (Count lines per order)

Table: SalesLT.SalesOrderDetail

Alias: SalesLT.SalesOrderDetail AS SOD, Count AS TotalSales

Return: SalesOrderID, SalesOrderDetailID

Task: Count how many lines exist per SalesOrderID, and return only orders with COUNT(SalesOrderDetailID) >= 3. Sort by the COUNT descending.

Clauses: SELECT, COUNT, FROM, GROUP BY, HAVING, ORDER BY, Aliases

Round 07 — AVG + HAVING

Table: SalesLT.SalesOrderDetail

Alias: SalesLT.SalesOrderDetail AS SOD, AVG AS AvgPrice

Return: SalesOrderID, UnitPrice

Task: For each SalesOrderID, calculate AVG(UnitPrice) and return only orders where AVG(UnitPrice) > 50. Sort by AVG(UnitPrice) DESC.

Clauses: SELECT, AVG, FROM, GROUP BY, HAVING, ORDER BY, Aliases

Round 08 — IN + GROUP BY (Orders per Customer)

Table: SalesLT.SalesOrderHeader

Alias: SalesLT.SalesOrderHeader AS SOH, Count AS Orders

Return: CustomerID, Count(SalesOrderID)

Task: For customers in (29653, 29660, 29736), count orders per CustomerID. Sort by COUNT(SalesOrderID) DESC, then CustomerID ASC.

Clauses: SELECT, COUNT, FROM, WHERE, IN, GROUP BY, ORDER BY (multi-column), Aliases

Round 09 — BETWEEN + Multi-column Sorting

Table: SalesLT.SalesOrderHeader

Alias: SalesLT.SalesOrderHeader AS SOH

Return: SalesOrderID, OrderDate, TotalDue

Task: Return orders where OrderDate is between '2008-06-01' and '2008-12-31'.
Sort by OrderDate ASC, then TotalDue DESC.

Clauses: SELECT, FROM, WHERE, BETWEEN, ORDER BY (multi-column), Aliases

Round 10 — HAVING + Multi-column Sorting

Table: SalesLT.SalesOrderHeader

Alias: SalesLT.SalesOrderHeader AS SOH, SUM AS Sales

Return: CustomerID, TotalDue

Task: Sum(TotalDue) per CustomerID and return only customers where SUM(TotalDue) > 5000.
Sort by SUM(TotalDue) DESC, then CustomerID ASC.

Clauses: SELECT, SUM, FROM, GROUP BY, HAVING, ORDER BY (multi-column), Aliases
