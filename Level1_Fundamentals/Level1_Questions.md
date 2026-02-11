# SQL Sparring Playbook — Level 1 Fundamentals
Database: AdventureWorksLT2022

Rules for this level:
- Fundamentals only (SELECT, TOP, WHERE, LIKE, DISTINCT, ORDER BY, aggregates, GROUP BY, HAVING)
- Queries should return results
- Write in consistent style (Select / From / Where / Group By / Having / Order By)

---

## Round 01 — SELECT TOP
### Table: SalesLT.Customer
Columns:
- CustomerID
- FirstName
- LastName
- EmailAddress

Task:
- Return the first 10 customers with CustomerID, FirstName, LastName, EmailAddress.

Clauses expected:
- SELECT, TOP, FROM

---

## Round 02 — WHERE IS NOT NULL
### Table: SalesLT.Customer
Columns:
- CustomerID
- FirstName
- LastName
- CompanyName

Task:
- Return the top 15 customers where CompanyName is not null.
- Show CustomerID, FirstName, LastName, CompanyName.

Clauses expected:
- SELECT, TOP, FROM, WHERE (IS NOT NULL)

---

## Round 03 — ORDER BY DESC
### Table: SalesLT.Product
Columns:
- ProductID
- Name
- ListPrice
- Color

Task:
- Return the top 10 most expensive products.
- Sort by ListPrice descending.

Clauses expected:
- SELECT, TOP, FROM, ORDER BY (DESC)

---

## Round 04 — LIKE (contains search)
### Table: SalesLT.Product
Columns:
- ProductID
- Name
- ProductNumber
- ListPrice

Task:
- Return all products where Name contains the word "Road".
- Sort by Name ascending.

Clauses expected:
- SELECT, FROM, WHERE (LIKE), ORDER BY

---

## Round 05 — COUNT + GROUP BY
### Table: SalesLT.Product
Columns:
- Color
- ProductID

Task:
- Count how many products exist per Color.
- Exclude rows where Color is null.
- Return Color and TotalProducts.
- Sort by TotalProducts descending.

Clauses expected:
- SELECT, COUNT(), FROM, WHERE, GROUP BY, ORDER BY

---

## Round 06 — SUM calculation (Revenue)
### Table: SalesLT.SalesOrderDetail
Columns:
- SalesOrderID
- OrderQty
- UnitPrice

Task:
- For each SalesOrderID, calculate TotalRevenue = SUM(OrderQty * UnitPrice).
- Return SalesOrderID and TotalRevenue.
- Show top 10 highest revenue orders.
- Sort by TotalRevenue descending.

Clauses expected:
- SELECT, TOP, SUM(), FROM, GROUP BY, ORDER BY

---

## Round 07 — AVG + HAVING (must return results)
### Table: SalesLT.SalesOrderDetail
Columns:
- SalesOrderID
- UnitPrice

Task:
- Find orders where AvgUnitPrice = AVG(UnitPrice) is greater than 50.
- Return SalesOrderID and AvgUnitPrice.
- Show top 15.
- Sort by AvgUnitPrice descending.

Clauses expected:
- SELECT, TOP, AVG(), FROM, GROUP BY, HAVING, ORDER BY

---

## Round 08 — DISTINCT
### Table: SalesLT.Product
Columns:
- Color

Task:
- Return all unique Colors.
- Exclude null colors.
- Sort by Color ascending.

Clauses expected:
- SELECT DISTINCT, FROM, WHERE, ORDER BY

---

## Round 09 — WHERE + AND
### Table: SalesLT.Product
Columns:
- ProductID
- Name
- ListPrice
- Color

Task:
- Return products where ListPrice > 500 AND Color is not null.
- Show ProductID, Name, ListPrice, Color.
- Top 15 only.
- Sort by ListPrice descending.

Clauses expected:
- SELECT, TOP, FROM, WHERE, AND, ORDER BY

---

## Round 10 — Final recap (COUNT + GROUP BY)
### Table: SalesLT.Product
Columns:
- Color
- ProductID

Task:
- Count how many products exist per Color.
- Exclude null colors.
- Return TotalProducts and Color.
- Top 10 only.
- Sort by TotalProducts descending.

Clauses expected:
- SELECT, TOP, COUNT(), FROM, WHERE, GROUP BY, ORDER BY
