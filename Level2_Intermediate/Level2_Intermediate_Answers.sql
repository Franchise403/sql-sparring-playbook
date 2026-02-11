--Round 01--
Select P.ProductID,
P.Name,
P.ListPrice
From SalesLT.Product AS P
Where P.ListPrice Between 100 and 500
Order By P.ListPrice Desc;
--Round 02--
Select P.ProductID,
P.Name,
P.Color,
P.Listprice
From SalesLT.Product AS P
Where P.Color IN ('Black', 'Red', 'Silver')
Order By P.Color Asc, P.ListPrice Desc;
--Round 03--
Select Top 10
P.ProductID,
P.Name,
P.ListPrice
From SalesLT.Product AS P
Order By P.ListPrice Desc;
--Round 04--
Select Count(P.ProductID) AS CountID,
P.Color
From SalesLT.Product AS P
Where P.Color is not null
Group By P.Color
Order By Count(P.ProductID) Desc, P.Color Asc;
--Round 05--
Select SUM(SOD.OrderQty * SOD.UnitPrice) AS SaleTotal,
SOD.SalesOrderID
From SalesLT.SalesOrderDetail AS SOD
Group By SOD.SalesOrderID
Order By SUM(SOD.OrderQty * SOD.UnitPrice) Desc;
--Round 06--
Select Count(SOD.SalesOrderDetailID) AS TotalSales,
SOD.SalesOrderID
From SalesLT.SalesOrderDetail AS SOD
Group By SOD.SalesOrderID
Having Count(SOD.SalesOrderDetailID) >= 3
Order By Count(SOD.SalesOrderDetailID) Desc;
--Round 07--
Select AVG(SOD.UnitPrice) AS AvgPrice,
SOD.SalesOrderID
From SalesLT.SalesOrderDetail AS SOD
Group By SOD.SalesOrderID
Having AVG(SOD.UnitPrice) > 50
Order By AVG(SOD.UnitPrice) Desc;
--Round 08--
Select Count(SOH.SalesOrderID) AS Orders,
SOH.CustomerID
From SalesLT.SalesOrderHeader AS SOH
Where SOH.CustomerID IN (29736, 29660, 29653)
Group By SOH.CustomerID
Order By Count(SOH.SalesOrderID) Desc, SOH.CustomerID Asc;
--Round 09--
Select SOH.SalesOrderID,
SOH.OrderDate,
SOH.TotalDue
From SalesLT.SalesOrderHeader AS SOH
Where SOH.OrderDate Between '2008-06-01' and '2008-12-31'
Order By SOH.OrderDate Asc, SOH.TotalDue Desc;
--Round 10--
Select SUM(SOH.TotalDue) AS Sales,
SOH.CustomerID
From SalesLT.SalesOrderHeader AS SOH
Group By SOH.CustomerID
Having SUM(SOH.TotalDue) > 5000
Order By SUM(SOH.TotalDue) Desc, SOH.CustomerID Asc;