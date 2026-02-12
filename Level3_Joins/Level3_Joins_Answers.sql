--Round 01--
SELECT TOP 10
C.CustomerID,
C.FirstName,
C.Lastname,
SOH.SalesOrderID,
SOH.OrderDate
FROM SalesLT.Customer AS C
INNER JOIN SalesLT.SalesOrderHeader AS SOH
ON  C.CustomerID = SOH.CustomerID
ORDER BY SOH.OrderDate DESC;
--Round 02--
SELECT TOP 15
SOH.SalesOrderID,
SOH.OrderDate,
SOD.SalesOrderDetailID,
SOD.OrderQty,
SOD.UnitPrice
FROM SalesLT.SalesOrderHeader AS SOH
INNER JOIN SalesLT.SalesOrderDetail AS SOD
ON SOH.SalesOrderID = SOD.SalesOrderID
ORDER BY SOH.SalesOrderID ASC, SOD.SalesOrderDetailID ASC;
--Round 03--
SELECT TOP 15
P.ProductID,
P.Name,
P.ListPrice,
PC.ProductCategoryID,
PC.ParentProductCategoryID
FROM SalesLT.Product AS P
INNER JOIN SalesLT.ProductCategory AS PC
ON P.ProductCategoryID = PC.ProductCategoryID
Order By P.ListPrice DESC;
--Round 04--
Select Top 20
C.CustomerID,
C.FirstName,
C.LastName,
SOH.SalesOrderID
From SalesLT.Customer AS C
LEFT JOIN SalesLT.SalesOrderHeader AS SOH
ON C.CustomerId = SOH.CustomerID
Order By C.CustomerID ASC;
--Round 05--
Select C.CustomerID,
C.FirstName,
C.Lastname,
SOH.SalesOrderID
From SalesLT.Customer AS C
LEFT JOIN SalesLT.SalesOrderHeader AS SOH
ON C.CustomerID = SOH.CustomerID
Where SOH.SalesOrderID IS NULL
Order By C.CustomerID ASC;
--Round 06--
SELECT COUNT(SOH.SalesOrderID),
C.CustomerID
FROM SalesLT.Customer AS C
INNER JOIN SalesLT.SalesOrderHeader AS SOH
ON C.CustomerID = SOH.CustomerID
GROUP BY C.CustomerID
HAVING COUNT(SOH.SalesOrderID) >= 1
ORDER BY COUNT(SOH.SalesOrderID) DESC;
--Round 07--
SELECT TOP 10
SUM(SOD.OrderQty * SOD.UnitPrice),
SOH.SalesOrderID,
SOH.OrderDate
FROM SalesLT.SalesOrderHeader AS SOH
INNER JOIN SalesLT.SalesOrderDetail AS SOD
ON SOH.SalesOrderID = SOD.SalesOrderID
GROUP BY SOH.SalesOrderID, SOH.OrderDate
ORDER BY SUM(SOD.OrderQty * SOD.UnitPrice) DESC;
--Round 08--
SELECT TOP 20
C.CustomerID,
C.LastName,
SOH.SalesOrderID,
SOD.SalesOrderDetailID,
SOD.OrderQty,
SOD.UnitPrice
FROM SalesLT.Customer AS C
INNER JOIN SalesLT.SalesOrderHeader AS SOH
ON C.CustomerID = SOH.CustomerID
INNER JOIN SalesLT.SalesOrderDetail AS SOD
ON SOH.SalesOrderID = SOD.SalesOrderID
ORDER BY SOH.SalesOrderID DESC, SOD.SalesOrderDetailID ASC;
--Round 09--
SELECT TOP 25
SOD.SalesOrderDetailID,
SOD.SalesOrderID,
P.ProductID,
P.Name,
SOD.OrderQty,
SOD.UnitPrice
FROM SalesLT.SalesOrderDetail AS SOD
INNER JOIN SalesLT.Product AS P
ON SOD.ProductID = P.ProductID
ORDER BY SOD.SalesOrderID DESC;
--Round 10--
SELECT TOP 10
SUM(SOD.OrderQty * SOD.UnitPrice),
C.CustomerID, 
C.LastName
FROM SalesLT.Customer AS C
INNER JOIN SalesLT.SalesOrderHeader AS SOH
ON C.CustomerID = SOH.CustomerID
INNER JOIN SalesLT.SalesOrderDetail AS SOD
ON SOH.SalesOrderID = SOD.SalesOrderID
GROUP BY C.CustomerID, C.LastName
ORDER BY SUM(SOD.OrderQty * SOD.UnitPrice) DESC;