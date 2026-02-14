--Round 01--
SELECT SUM(SOH.TotalDue) AS MonthlyRevenue,
YEAR(SOH.OrderDate) AS OrderYear,
MONTH(SOH.OrderDate) AS OrderMonth
FROM SalesLT.SalesOrderHeader AS SOH
GROUP BY YEAR(SOH.OrderDate),
MONTH(SOH.OrderDate)
ORDER BY OrderYear ASC, OrderMonth ASC;
--Round 02--
SELECT TOP 10
P.ProductID,
P.Name,
SUM(SOD.OrderQty * SOD.UnitPrice) AS ProductRevenue
FROM SalesLT.Product AS P
INNER JOIN SalesLT.SalesOrderDetail AS SOD
ON SOD.ProductID = P.ProductID
GROUP BY P.ProductID,
P.Name
ORDER BY ProductRevenue DESC;
--Round 03--
SELECT TOP 10
C.CustomerID,
C.FirstName,
C.LastName,
SUM(SOH.TotalDue) AS LifetimeSpend,
COUNT(SOH.SalesOrderID) AS OrderCount
FROM SalesLT.Customer AS C
INNER JOIN SalesLT.SalesOrderHeader AS SOH
ON C.CustomerID = SOH.CustomerID
GROUP BY C.CustomerID,
C.FirstName,
C.LastName
ORDER BY LifetimeSpend DESC;
--Round 04--
SELECT C.CustomerID,
C.FirstName,
C.LastName,
AVG(SOH.TotalDue) AS AvgOrderValue
FROM SalesLT.Customer AS C
INNER JOIN SalesLT.SalesOrderHeader AS SOH
ON C.CustomerID = SOH.CustomerID
GROUP BY C.CustomerID,
C.FirstName,
C.LastName
HAVING AVG(SOH.TotalDue) >= 1000
ORDER BY AvgOrderValue DESC;
--Round 05--
SELECT C.CustomerID,
C.FirstName,
C.LastName,
COUNT(SOH.SalesOrderID) AS OrderCount
FROM SalesLT.Customer AS C
INNER JOIN SalesLT.SalesOrderHeader AS SOH
ON C.CustomerID = SOH.CustomerID
GROUP BY C.CustomerID,
C.FirstName,
C.LastName
HAVING COUNT(SOH.SalesOrderID) >= 1
ORDER BY OrderCount DESC;
--Round 06--
SELECT PC.ProductCategoryID,
PC.Name,
SUM(SOD.OrderQty * SOD.UnitPrice) AS CategoryRevenue
FROM SalesLt.SalesOrderDetail AS SOD
INNER JOIN SalesLT.Product AS P
ON SOD.ProductID = P.ProductID
INNER JOIN SalesLT.ProductCategory AS PC
ON P.ProductCategoryID = PC.ProductCategoryID
GROUP BY PC.ProductCategoryID,
PC.Name
ORDER BY CategoryRevenue DESC;
--Round 07--
SELECT C.CustomerID,
C.FirstName,
C.LastName,
MAX(SOH.OrderDate) AS LastOrderDate
FROM SalesLT.Customer AS C
INNER JOIN SalesLT.SalesOrderHeader AS SOH
ON C.CustomerID = SOH.CustomerID
GROUP BY C.CustomerID,
C.FirstName,
C.LastName
ORDER BY LastOrderDate DESC;
--Round 08--
SELECT SOH.CustomerID,
SOH.SalesOrderID,
SOH.OrderDate,
MIN(SOH.OrderDate) OVER (PARTITION BY SOH.CustomerID) AS FirstOrderDate,
YEAR(SOH.OrderDate) AS OrderYear,
MONTH(SOH.OrderDate) AS OrderMonth,
CASE
WHEN SOH.OrderDate = MIN(SOH.OrderDate) 
OVER (PARTITION BY SOH.CustomerID)
THEN 'NewCustomerOrder'
ELSE 'ReturningCustomerOrder'
END AS CustomerOrderType
FROM SalesLT.SalesOrderHeader AS SOH
ORDER BY OrderYear ASC, OrderMonth ASC, SOH.CustomerID ASC;
--Round 09--
WITH MonthlyTotals AS (
SELECT SUM(SOH.TotalDue) AS MonthlyRevenue,
YEAR(SOH.OrderDate) AS OrderYear,
Month(SOH.OrderDate) AS OrderMonth
FROM SalesLT.SalesOrderHeader AS SOH
GROUP BY YEAR(SOH.OrderDate),
Month(SOH.OrderDate)
)
SELECT OrderYear,
OrderMonth,
MonthlyRevenue,
LAG(MonthlyRevenue) 
OVER (ORDER BY OrderYear, OrderMonth) AS PrevMonthRevenue,
MonthlyRevenue - LAG(MonthlyRevenue) 
OVER (ORDER BY OrderYear, OrderMonth) AS RevenueChange
FROM MonthlyTotals
ORDER BY OrderYear ASC, OrderMonth ASC;
--Round 10--
WITH CustomerKPIs AS (
SELECT C.CustomerID,
C.FirstName,
C.LastName,
SUM(SOH.TotalDue) AS LifetimeSpend,
COUNT(SOH.SalesOrderID) AS OrderCount, 
MAX(SOH.OrderDate) AS LastOrderDate, 
AVG(SOH.TotalDue) AS AvgOrderValue
FROM SalesLT.Customer AS C
INNER JOIN SalesLT.SalesOrderHeader AS SOH
ON C.CustomerID = SOH.CustomerID
GROUP BY C.CustomerID,
C.FirstName,
C.LastName
)
SELECT TOP 10
LifetimeSpend,
OrderCount,
LastOrderDate,
AvgOrderValue
FROM CustomerKPIs
ORDER BY LifetimeSpend DESC;