Round 01 — Window Function Ranking (Customer Spend)

Table: SalesLT.Customer, SalesLT.SalesOrderHeader

Alias: SalesLT.Customer AS C, SalesLT.SalesOrderHeader AS SOH

Join Key: C.CustomerID = SOH.CustomerID

Return: C.CustomerID, C.FirstName, C.LastName, SOH.TotalDue

Calculated: SUM(SOH.TotalDue) AS TotalSpend, DENSE_RANK() OVER (ORDER BY SUM(SOH.TotalDue) DESC) AS SpendRank

Task: Return the top 10 customers with the highest lifetime total spending, including a rank column. Sort by TotalSpend DESC.

Clauses: SELECT, TOP, INNER JOIN, SUM, GROUP BY, DENSE_RANK() OVER(), ORDER BY, Aliases

Round 02 — CASE Classification (Order Size)

Table: SalesLT.SalesOrderHeader

Alias: SalesLT.SalesOrderHeader AS SOH

Return: SOH.SalesOrderID, SOH.OrderDate, SOH.TotalDue

Calculated: CASE, WHEN SOH.TotalDue >= 5000 THEN 'High', WHEN SOH.TotalDue >= 1000 THEN 'Medium', ELSE 'Low', END AS OrderSizeCategory

Task: Return the top 20 most recent orders and classify each order as High / Medium / Low using CASE. Sort by SOH.OrderDate DESC.

Clauses: SELECT, TOP, CASE, WHEN, THEN, ELSE, END, ORDER BY, Aliases

Round 03 — CTE Customer Spend Summary

Table: SalesLT.Customer, SalesLT.SalesOrderHeader

Alias: SalesLT.Customer AS C, SalesLT.SalesOrderHeader AS SOH

Join Key: C.CustomerID = SOH.CustomerID

Return: C.CustomerID, C.FirstName, C.LastName, SOH.TotalDue

Calculated: SUM(SOH.TotalDue) AS TotalSpend

CTE Requirement: Create a CTE named CustomerTotals that contains each customer’s TotalSpend.

Task: Build the CTE CustomerTotals using SUM(SOH.TotalDue), Then SELECT from CustomerTotals, Return only customers where TotalSpend > 5000, Sort by TotalSpend DESC.

Clauses: WITH, SELECT, INNER JOIN, SUM, GROUP BY, WHERE, ORDER BY, Aliases

Round 04 — Ranked Customer Spend (CTE + DENSE_RANK)

Table: SalesLT.Customer, SalesLT.SalesOrderHeader

Alias: SalesLT.Customer AS C, SalesLT.SalesOrderHeader AS SOH

Join Key:
C.CustomerID = SOH.CustomerID

Return: C.CustomerID, C.FirstName, C.LastName, SOH.TotalDue

Calculated: SUM(SOH.TotalDue) AS TotalSpend, DENSE_RANK() OVER (ORDER BY SUM(SOH.TotalDue) DESC) AS SpendRank

CTE Requirement: Create a CTE named CustomerTotals that contains TotalSpend and SpendRank for each customer.

Task: Build the CTE CustomerTotals, then return only customers with SpendRank <= 5, sorted by TotalSpend DESC.

Clauses: WITH, SELECT, INNER JOIN, SUM, GROUP BY, DENSE_RANK() OVER(), WHERE, ORDER BY, Aliases

Round 05 — Customers With No Orders (LEFT JOIN + IS NULL)

Table: SalesLT.Customer, SalesLT.SalesOrderHeader

Alias: SalesLT.Customer AS C, SalesLT.SalesOrderHeader AS SOH

Join Key: C.CustomerID = SOH.CustomerID

Return: C.CustomerID, C.FirstName, C.LastName, SOH.SalesOrderID

Task: Return customers who have never placed an order.

Sort by C.CustomerID ASC.

Clauses: SELECT, LEFT JOIN, IS NULL, ORDER BY, Aliases

Round 06 — Latest Order Per Customer (CTE + ROW_NUMBER)

Table: SalesLT.Customer, SalesLT.SalesOrderHeader

Alias: SalesLT.Customer AS C, SalesLT.SalesOrderHeader AS SOH

Join Key: C.CustomerID = SOH.CustomerID

Return: C.CustomerID, C.FirstName, C.LastName, SOH.SalesOrderID, SOH.OrderDate, SOH.TotalDue

Calculated: ROW_NUMBER() OVER (PARTITION BY SOH.CustomerID ORDER BY SOH.OrderDate DESC) AS rn

CTE Requirement: Create a CTE named RankedOrders that assigns rn to each order per customer.

Task: Build the CTE RankedOrders, then return only the latest order per customer where rn = 1, sorted by SOH.OrderDate DESC.

Clauses: WITH, SELECT, INNER JOIN, ROW_NUMBER() OVER(PARTITION BY … ORDER BY …), WHERE, ORDER BY, Aliases

Round 07 — Running Total of Sales (Window SUM)

Table: SalesLT.SalesOrderHeader

Alias: SalesLT.SalesOrderHeader AS SOH

Return: SOH.SalesOrderID, SOH.OrderDate, SOH.TotalDue

Calculated: SUM(SOH.TotalDue) OVER (ORDER BY SOH.OrderDate ASC) AS RunningTotal

Task: Return all orders with a running total of TotalDue over time, sorted by OrderDate ASC.

Clauses: SELECT, SUM() OVER(ORDER BY …), ORDER BY, Aliases

Round 08 — Customer Running Spend

Table: SalesLT.SalesOrderHeader

Alias: SalesLT.SalesOrderHeader AS SOH

Return: SOH.CustomerID, SOH.SalesOrderID, SOH.OrderDate, SOH.TotalDue

Calculated: SUM(SOH.TotalDue) OVER (PARTITION BY SOH.CustomerID ORDER BY SOH.OrderDate ASC) AS CustomerRunningTotal

Task: Return each order with a running total of TotalDue per customer, sorted by CustomerID and OrderDate ASC.

Clauses: SELECT, SUM() OVER(PARTITION BY … ORDER BY …), ORDER BY, Aliases

Round 09 — Percent of Total Spend (Window SUM)

Table: SalesLT.SalesOrderHeader

Alias: SalesLT.SalesOrderHeader AS SOH

Return: SOH.SalesOrderID, SOH.CustomerID, SOH.TotalDue

Calculated: SUM(SOH.TotalDue) OVER () AS GrandTotal, SOH.TotalDue / SUM(SOH.TotalDue) OVER () AS PercentOfTotal

Task: Return each order showing what percent of the grand total revenue it represents. Sort by SOH.TotalDue DESC.

Clauses: SELECT, SUM() OVER(), Division, ORDER BY, Aliases

Round 10 — Top 3 Customers With Running Spend

Table: SalesLT.Customer, SalesLT.SalesOrderHeader

Alias: SalesLT.Customer AS C, SalesLT.SalesOrderHeader AS SOH

Join Key:
C.CustomerID = SOH.CustomerID

Return: C.CustomerID, C.FirstName, C.LastName, SOH.OrderDate, SOH.TotalDue

Calculated: SUM(SOH.TotalDue) OVER (PARTITION BY C.CustomerID ORDER BY SOH.OrderDate ASC) AS CustomerRunningTotal

CTE Required: This round must be done in two steps because SQL Server does not allow ranking directly on a nested window SUM.

CTE Name Requirement: Create a CTE named CustomerSpend that calculates CustomerTotalSpend per customer. Optional Second CTE Name: If you want a second step, you may create another CTE (often named Final) to apply the ranking. Final is not a keyword — it is just a temporary CTE name.

Task: Use the CTE(s) to return only orders from the top 3 customers by total spend, showing running totals over time. Sort by CustomerSpendRank ASC, SOH.OrderDate ASC.

Clauses: WITH, SELECT, INNER JOIN, SUM() OVER(), DENSE_RANK(), WHERE, ORDER BY, Aliases
