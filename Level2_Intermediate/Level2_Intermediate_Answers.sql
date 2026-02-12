--Round 01--
SELECT P.ProductID,
P.Name,
P.ListPrice
FROM SalesLT.Product AS P
WHERE P.ListPrice Between 100 and 500
ORDER BY P.ListPrice DESC;
--Round 02--
SELECT P.ProductID,
P.Name,
P.Color,
P.Listprice
FROM SalesLT.Product AS P
WHERE P.Color IN ('Black', 'Red', 'Silver')
ORDER BY P.Color ASC, P.ListPrice DESC;
--Round 03--
SELECT TOP 10
P.ProductID,
P.Name,
P.ListPrice
FROM SalesLT.Product AS P
ORDER BY P.ListPrice DESC;
--Round 04--
SELECT COUNT(P.ProductID) AS CountID,
P.Color
FROM SalesLT.Product AS P
WHERE P.Color IS NOT NULL
GROUP BY P.Color
ORDER BY COUNT(P.ProductID) DESC, P.Color ASC;
--Round 05--
SELECT SUM(SOD.OrderQty * SOD.UnitPrice) AS SaleTotal,
SOD.SalesOrderID
FROM SalesLT.SalesOrderDetail AS SOD
GROUP BY SOD.SalesOrderID
ORDER BY SUM(SOD.OrderQty * SOD.UnitPrice) DESC;
--Round 06--
SELECT COUNT(SOD.SalesOrderDetailID) AS TotalSales,
SOD.SalesOrderID
FROM SalesLT.SalesOrderDetail AS SOD
GROUP BY SOD.SalesOrderID
HAVING COUNT(SOD.SalesOrderDetailID) >= 3
ORDER BY COUNT(SOD.SalesOrderDetailID) DESC;
--Round 07--
SELECT AVG(SOD.UnitPrice) AS AvgPrice,
SOD.SalesOrderID
FROM SalesLT.SalesOrderDetail AS SOD
GROUP BY SOD.SalesOrderID
HAVING AVG(SOD.UnitPrice) > 50
ORDER BY AVG(SOD.UnitPrice) DESC;
--Round 08--
SELECT COUNT(SOH.SalesOrderID) AS Orders,
SOH.CustomerID
FROM SalesLT.SalesOrderHeader AS SOH
WHERE SOH.CustomerID IN (29736, 29660, 29653)
GROUP BY SOH.CustomerID
ORDER BY COUNT(SOH.SalesOrderID) DESC, SOH.CustomerID ASC;
--Round 09--
SELECT SOH.SalesOrderID,
SOH.OrderDate,
SOH.TotalDue
FROM SalesLT.SalesOrderHeader AS SOH
WHERE SOH.OrderDate BETWEEN '2008-06-01' AND '2008-12-31'
ORDER BY SOH.OrderDate ASC, SOH.TotalDue DESC;
--Round 10--
SELECT SUM(SOH.TotalDue) AS Sales,
SOH.CustomerID
FROM SalesLT.SalesOrderHeader AS SOH
GROUP BY SOH.CustomerID
HAVING SUM(SOH.TotalDue) > 5000
ORDER BY SUM(SOH.TotalDue) DESC, SOH.CustomerID ASC;