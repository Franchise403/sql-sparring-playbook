--Round 01--
SELECT TOP 10
SUM(SOH.TotalDue) AS TotalSpent,
C.CustomerID,
C.FirstName,
C.Lastname,
DENSE_RANK() OVER (ORDER BY SUM(SOH.TotalDue) DESC) AS SpendRank
FROM SalesLT.Customer AS C
INNER JOIN SalesLT.SalesOrderHeader AS SOH
ON C.CustomerID = SOH.CustomerID
Group BY C.CustomerID,
C.FirstName,
C.LastName
ORDER BY SUM(SOH.TotalDue) DESC;
--Round 02--
SELECT TOP 20
SOH.SalesOrderID,
SOH.OrderDate,
SOH.TotalDUE,
CASE
WHEN SOH.TotalDUE >= 5000 THEN 'High'
WHEN SOH.TotalDue >= 1000 THEN 'Medium'
ELSE 'Low'
END AS OrderSizeCategory
FROM SalesLT.SalesOrderHeader AS SOH
ORDER BY SOH.OrderDate DESC;
--Round 03--
WITH CustomerTotals AS (
SELECT SUM(SOH.TotalDUE) AS TotalSpend,
C.CustomerID,
C.FirstName,
C.LastName
FROM SalesLT.Customer AS C
INNER JOIN SalesLT.SalesOrderHeader AS SOH
ON C.CustomerID = SOH.CustomerID
GROUP BY C.CustomerID,
C.FirstName,
C.LastName
)
SELECT CustomerID,
FirstName,
LastName
FROM CustomerTotals
WHERE TotalSpend > 5000
ORDER BY TotalSpend DESC;
--Round 04--
WITH CustomerTotals AS (
SELECT SUM(SOH.TotalDue) AS TotalSpend,
C.CustomerID,
C.FirstName,
C.LastName,
DENSE_RANK() OVER (ORDER BY SUM(SOH.TotalDue) DESC) AS SpendRank
FROM SalesLT.Customer AS C
INNER JOIN SalesLT.SalesOrderHeader AS SOH
ON C.CustomerID = SOH.CustomerID
GROUP BY C.CustomerID,
C.FirstName,
C.LastName
)
SELECT SpendRank,
TotalSpend,
CustomerID,
FirstName,
LastName
FROM CustomerTotals
WHERE SpendRank <= 5
Order BY TotalSpend DESC;
--Round 05--
SELECT C.CustomerID,
C.FirstName,
C.LastName,
SOH.SalesOrderID
FROM SalesLT.Customer AS C
LEFT JOIN SalesLT.SalesOrderHeader AS SOH
ON C.CustomerID = SOH.CustomerID
WHERE SOH.SalesOrderNumber IS NULL
ORDER BY C.CustomerID ASC;
--Round 06--
WITH RankedOrders AS (
SELECT C.CustomerID,
C.FirstName,
C.LastName,
SOH.SalesOrderId,
SOH.OrderDate,
SOH.TotalDue,
ROW_NUMBER() OVER (PARTITION BY SOH.CustomerID ORDER BY SOH.OrderDate DESC) AS RN
FROM SalesLT.Customer AS C
INNER JOIN SalesLT.SalesOrderHeader AS SOH
ON C.CustomerID = SOH.CustomerID
)
SELECT RN,
CustomerID,
FirstName,
LastName,
SalesOrderID,
OrderDate,
TotalDue
FROM RankedOrders
WHERE RN = 1
ORDER BY OrderDate DESC;
--Round 07--
SELECT SOH.TotalDue,
SOH.SalesOrderID,
SOH.OrderDate,
SUM(SOH.TotalDue) OVER(ORDER BY SOH.OrderDate ASC) AS RunningTotal
FROM SalesLT.SalesOrderHeader AS SOH
ORDER BY SOH.OrderDate ASC;
--Round 8--
SELECT SOH.CustomerID,
SOH.SalesOrderID,
SOH.OrderDate,
SOH.TotalDue,
SUM(SOH.TotalDue) OVER (PARTITION BY SOH.CustomerID ORDER BY SOH.OrderDate ASC) AS CustomerRunningTotal
FROM SalesLT.SalesOrderHeader AS SOH
ORDER BY SOH.CustomerID ASC, SOH.OrderDate ASC;
--Round 09--
SELECT SOH.SalesOrderID,
SOH.CustomerID,
SOH.TotalDue,
SUM(SOH.TotalDue) OVER () AS GrandTotal,
SOH.TotalDue  / SUM(SOH.TotalDue) OVER () AS PercentOfTotal
FROM SalesLT.SalesOrderHeader AS SOH
ORDER BY SOH.TotalDue DESC;
--Round 10--
WITH RankedCustomerOrders AS (
SELECT C.CustomerID,
C.FirstName,
C.LastName,
SOH.OrderDate,
SOH.TotalDue,
SUM(SOH.TotalDue) OVER (PARTITION BY C.CustomerID ORDER BY SOH.OrderDate ASC) AS CustomerRunningTotal,
SUM(SOH.TotalDue) OVER (PARTITION BY C.CustomerID) AS CustomerTotalSpend
FROM SalesLT.Customer AS C
INNER JOIN SalesLT.SalesOrderHeader AS SOH
ON C.CustomerID = SOH.CustomerID
),
Final AS (
SELECT
CustomerID,
FirstName,
LastName,
OrderDate,
TotalDue,
CustomerRunningTotal,
DENSE_RANK() OVER (ORDER BY CustomerTotalSpend DESC) AS CustomerSpendRank
FROM RankedCustomerOrders
)
SELECT
CustomerID,
FirstName,
LastName,
OrderDate,
TotalDue,
CustomerRunningTotal,
CustomerSpendRank
FROM Final
WHERE CustomerSpendRank <= 3
ORDER BY CustomerSpendRank ASC, OrderDate ASC;
