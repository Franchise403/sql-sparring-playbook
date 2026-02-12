Level 3 Joins & Relationships (AdventureWorksLT2022 / SalesLT)

Round 01 — INNER JOIN (Customer Orders)

Table: SalesLT.Customer, SalesLT.SalesOrderHeader

Alias: SalesLT.Customer AS C, SalesLT.SalesOrderHeader AS SOH

Join Key: C.CustomerID = SOH.CustomerID

Return: CustomerID, FirstName, LastName, SalesOrderID, OrderDate

Task: Return the top 10 orders with customer name details. Sort by OrderDate DESC.

Clauses: SELECT, TOP, INNER JOIN, ON, ORDER BY, Aliases

Round 02 — INNER JOIN (Order Lines)

Table: SalesLT.SalesOrderHeader, SalesLT.SalesOrderDetail

Alias: SalesLT.SalesOrderHeader AS SOH, SalesLT.SalesOrderDetail AS SOD

Join Key: SOH.SalesOrderID = SOD.SalesOrderID

Return: SalesOrderID, OrderDate, SalesOrderDetailID, OrderQty, UnitPrice

Task: Return the top 15 order lines with the order date included. Sort by SalesOrderID ASC, SalesOrderDetailID ASC.

Clauses: SELECT, TOP, INNER JOIN, ON, ORDER BY (multi-column), Aliases

Round 03 — INNER JOIN (Product Category)

Table: SalesLT.Product, SalesLT.ProductCategory

Alias: SalesLT.Product AS P, SalesLT.ProductCategory AS PC

Join Key: P.ProductCategoryID = PC.ProductCategoryID

Return: ProductID, Name, ListPrice, ProductCategoryID, ParentProductCategoryID

Task: Return the top 15 products with their category IDs included. Sort by ListPrice DESC.

Clauses: SELECT, TOP, INNER JOIN, ON, ORDER BY, Aliases

Round 04 — LEFT JOIN (Customers With/Without Orders)

Table: SalesLT.Customer, SalesLT.SalesOrderHeader

Alias: SalesLT.Customer AS C, SalesLT.SalesOrderHeader AS SOH

Join Key: C.CustomerID = SOH.CustomerID

Return: CustomerID, FirstName, LastName, SalesOrderID

Task: Return the top 20 customers and include SalesOrderID if it exists (customers with no orders should still appear). Sort by CustomerID ASC.

Clauses: SELECT, TOP, LEFT JOIN, ON, ORDER BY, Aliases

Round 05 — LEFT JOIN + WHERE (Only Customers With No Orders)

Table: SalesLT.Customer, SalesLT.SalesOrderHeader

Alias: SalesLT.Customer AS C, SalesLT.SalesOrderHeader AS SOH

Join Key: C.CustomerID = SOH.CustomerID

Return: CustomerID, FirstName, LastName, SalesOrderID

Task: Return customers who have no orders (SalesOrderID is NULL). Sort by CustomerID ASC.

Clauses: SELECT, LEFT JOIN, ON, WHERE, ORDER BY, Aliases

Round 06 — JOIN + GROUP BY (Order count per customer)

Table: SalesLT.Customer, SalesLT.SalesOrderHeader

Alias: SalesLT.Customer AS C, SalesLT.SalesOrderHeader AS SOH

Join Key: C.CustomerID = SOH.CustomerID

Return: CustomerID, Count(SalesOrderID)

Task: Count orders per customer and return only customers with Count(SalesOrderID) >= 1. Sort by Count(SalesOrderID) DESC.
Clauses: SELECT, COUNT, INNER JOIN, ON, GROUP BY, HAVING, ORDER BY, Aliases

Round 07 — JOIN + GROUP BY (Revenue per order)

Table: SalesLT.SalesOrderHeader, SalesLT.SalesOrderDetail

Alias: SalesLT.SalesOrderHeader AS SOH, SalesLT.SalesOrderDetail AS SOD

Join Key: SOH.SalesOrderID = SOD.SalesOrderID

Return: SalesOrderID, OrderDate, Sum(OrderQty * UnitPrice)

Task: Return the top 10 orders by revenue. Sort by Sum(OrderQty * UnitPrice) DESC.

Clauses: SELECT, TOP, SUM, INNER JOIN, ON, GROUP BY, ORDER BY, Aliases

Round 08 — Multi-table INNER JOIN (Order + Customer + Line items)

Table: SalesLT.Customer, SalesLT.SalesOrderHeader, SalesLT.SalesOrderDetail

Alias: SalesLT.Customer AS C, SalesLT.SalesOrderHeader AS SOH, SalesLT.SalesOrderDetail AS SOD

Join Key: C.CustomerID = SOH.CustomerID AND SOH.SalesOrderID = SOD.SalesOrderID

Return: CustomerID, LastName, SalesOrderID, SalesOrderDetailID, OrderQty, UnitPrice

Task: Return the top 20 line items including who bought it. Sort by SalesOrderID DESC, SalesOrderDetailID ASC.

Clauses: SELECT, TOP, INNER JOIN, ON, ORDER BY (multi-column), Aliases

Round 09 — INNER JOIN (Line items + Product)

Table: SalesLT.SalesOrderDetail, SalesLT.Product

Alias: SalesLT.SalesOrderDetail AS SOD, SalesLT.Product AS P

Join Key: SOD.ProductID = P.ProductID

Return: SalesOrderDetailID, SalesOrderID, ProductID, Name, OrderQty, UnitPrice

Task: Return the top 25 line items with the product name included. Sort by SalesOrderID DESC.

Clauses: SELECT, TOP, INNER JOIN, ON, ORDER BY, Aliases

Round 10 — Multi-table JOIN + GROUP BY (Revenue by customer)

Table: SalesLT.Customer, SalesLT.SalesOrderHeader, SalesLT.SalesOrderDetail

Alias: SalesLT.Customer AS C, SalesLT.SalesOrderHeader AS SOH, SalesLT.SalesOrderDetail AS SOD

Join Key: C.CustomerID = SOH.CustomerID AND SOH.SalesOrderID = SOD.SalesOrderID

Return: CustomerID, LastName, Sum(OrderQty * UnitPrice)

Task: Calculate total revenue per customer and return the top 10 customers by revenue. Sort by Sum(OrderQty * UnitPrice) DESC.

Clauses: SELECT, TOP, SUM, INNER JOIN, ON, GROUP BY, ORDER BY, Aliases
