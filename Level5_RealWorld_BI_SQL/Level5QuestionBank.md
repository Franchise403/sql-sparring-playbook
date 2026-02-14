Level 5 — Real-World BI SQL (Dashboard/Reporting)

Round 01 — Monthly Revenue Summary

Table: SalesLT.SalesOrderHeader

Alias: SalesLT.SalesOrderHeader AS SOH

Return: SOH.OrderDate, SOH.TotalDue

Calculated: YEAR(SOH.OrderDate) AS OrderYear, MONTH(SOH.OrderDate) AS OrderMonth, SUM(SOH.TotalDue) AS MonthlyRevenue

Task: Return monthly revenue totals by year and month. Sort by OrderYear ASC, OrderMonth ASC.

Clauses: SELECT, YEAR(), MONTH(), SUM, GROUP BY, ORDER BY, Aliases

Round 02 — Top Products by Revenue

Table: SalesLT.SalesOrderDetail, SalesLT.Product

Alias: SalesLT.SalesOrderDetail AS SOD, SalesLT.Product AS P

Join Key: SOD.ProductID = P.ProductID

Return: P.ProductID, P.Name, SOD.OrderQty, SOD.UnitPrice

Calculated: SUM(SOD.OrderQty * SOD.UnitPrice) AS ProductRevenue

Task: Return the top 10 products by revenue. Sort by ProductRevenue DESC.

Clauses: SELECT, TOP, INNER JOIN, SUM, GROUP BY, ORDER BY, Aliases

Round 03 — Customer Lifetime Value (CLV)

Table: SalesLT.Customer, SalesLT.SalesOrderHeader

Alias: SalesLT.Customer AS C, SalesLT.SalesOrderHeader AS SOH

Join Key: C.CustomerID = SOH.CustomerID

Return: C.CustomerID, C.FirstName, C.LastName, SOH.TotalDue

Calculated: SUM(SOH.TotalDue) AS LifetimeSpend, COUNT(SOH.SalesOrderID) AS OrderCount

Task: Return the top 10 customers by LifetimeSpend including OrderCount. Sort by LifetimeSpend DESC.

Clauses: SELECT, TOP, INNER JOIN, SUM, COUNT, GROUP BY, ORDER BY, Aliases

Round 04 — Average Order Value by Customer

Table: SalesLT.Customer, SalesLT.SalesOrderHeader

Alias: SalesLT.Customer AS C, SalesLT.SalesOrderHeader AS SOH

Join Key: C.CustomerID = SOH.CustomerID

Return: C.CustomerID, C.FirstName, C.LastName, SOH.TotalDue

Calculated: AVG(SOH.TotalDue) AS AvgOrderValue

Task: Return customers with AvgOrderValue >= 1000. Sort by AvgOrderValue DESC.

Clauses: SELECT, INNER JOIN, AVG, GROUP BY, HAVING, ORDER BY, Aliases

Round 05 — Repeat Customers (2+ Orders)

Table: SalesLT.Customer, SalesLT.SalesOrderHeader

Alias: SalesLT.Customer AS C, SalesLT.SalesOrderHeader AS SOH

Join Key: C.CustomerID = SOH.CustomerID

Return: C.CustomerID, C.FirstName, C.LastName, SOH.SalesOrderID

Calculated: COUNT(SOH.SalesOrderID) AS OrderCount

Task: Return customers who have placed 1 or more orders. Sort by OrderCount DESC.

Clauses: SELECT, INNER JOIN, COUNT, GROUP BY, HAVING, ORDER BY, Aliases

Round 06 — Product Category Revenue (Rollup-style)

Table: SalesLT.SalesOrderDetail, SalesLT.Product, SalesLT.ProductCategory

Alias: SalesLT.SalesOrderDetail AS SOD, SalesLT.Product AS P, SalesLT.ProductCategory AS PC

Join Key: SOD.ProductID = P.ProductID, P.ProductCategoryID = PC.ProductCategoryID

Return: PC.ProductCategoryID, PC.Name, SOD.OrderQty, SOD.UnitPrice

Calculated: SUM(SOD.OrderQty * SOD.UnitPrice) AS CategoryRevenue

Task: Return revenue by product category. Sort by CategoryRevenue DESC.

Clauses: SELECT, INNER JOIN, SUM, GROUP BY, ORDER BY, Aliases

Round 07 — Customer Recency (Most Recent Order Date)

Table: SalesLT.Customer, SalesLT.SalesOrderHeader

Alias: SalesLT.Customer AS C, SalesLT.SalesOrderHeader AS SOH

Join Key: C.CustomerID = SOH.CustomerID

Return: C.CustomerID, C.FirstName, C.LastName, SOH.OrderDate

Calculated: MAX(SOH.OrderDate) AS LastOrderDate

Task: Return each customer’s last order date. Sort by LastOrderDate DESC.

Clauses: SELECT, INNER JOIN, MAX, GROUP BY, ORDER BY, Aliases

Round 08 — New vs Returning Customers by Month

Table: SalesLT.SalesOrderHeader

Alias: SalesLT.SalesOrderHeader AS SOH

Return: SOH.CustomerID, SOH.OrderDate, SOH.SalesOrderID

Calculated: MIN(SOH.OrderDate) OVER (PARTITION BY SOH.CustomerID) AS FirstOrderDate, YEAR(SOH.OrderDate) AS OrderYear, MONTH(SOH.OrderDate) AS OrderMonth

Task: Return orders with a column classifying each order as NewCustomerOrder or ReturningCustomerOrder using CASE (based on whether SOH.OrderDate = FirstOrderDate). Sort by OrderYear ASC, OrderMonth ASC, SOH.CustomerID ASC.

Clauses: SELECT, MIN() OVER(PARTITION BY), CASE, WHEN, THEN, ELSE, END, YEAR(), MONTH(), ORDER BY, Aliases

Round 09 — Revenue Trend (Month-over-Month Change)

Table: SalesLT.SalesOrderHeader

Alias: SalesLT.SalesOrderHeader AS SOH

Return: SOH.OrderDate, SOH.TotalDue

Calculated: YEAR(SOH.OrderDate) AS OrderYear, MONTH(SOH.OrderDate) AS OrderMonth, SUM(SOH.TotalDue) AS MonthlyRevenue, LAG(SUM(SOH.TotalDue)) OVER (ORDER BY YEAR(SOH.OrderDate), MONTH(SOH.OrderDate)) AS PrevMonthRevenue

CTE Required: Create a CTE named MonthlyTotals that calculates MonthlyRevenue per year/month first.

Task: Using MonthlyTotals, return MonthlyRevenue and PrevMonthRevenue and the difference (MonthlyRevenue - PrevMonthRevenue). Sort by OrderYear ASC, OrderMonth ASC.

Clauses: WITH, SELECT, SUM, YEAR, MONTH, GROUP BY, LAG() OVER(ORDER BY), ORDER BY, Aliases

Round 10 — Executive Customer Report (Top 10 with KPIs)

Table: SalesLT.Customer, SalesLT.SalesOrderHeader

Alias: SalesLT.Customer AS C, SalesLT.SalesOrderHeader AS SOH

Join Key: C.CustomerID = SOH.CustomerID

Return: C.CustomerID, C.FirstName, C.LastName, SOH.SalesOrderID, SOH.TotalDue, SOH.OrderDate

Calculated: SUM(SOH.TotalDue) AS LifetimeSpend, COUNT(SOH.SalesOrderID) AS OrderCount, MAX(SOH.OrderDate) AS LastOrderDate, AVG(SOH.TotalDue) AS AvgOrderValue

CTE Required: Create a CTE named CustomerKPIs that calculates the KPIs per customer first.

Task: Return the top 10 customers by LifetimeSpend with LifetimeSpend, OrderCount, AvgOrderValue, LastOrderDate. Sort by LifetimeSpend DESC.

Clauses: WITH, SELECT, INNER JOIN, SUM, COUNT, MAX, AVG, GROUP BY, TOP, ORDER BY, Aliases
