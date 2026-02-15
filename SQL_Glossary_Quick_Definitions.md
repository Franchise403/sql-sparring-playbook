# SQL Glossary — Quick Definitions (AdventureWorksLT / SalesLT)

A clean reference list of the core SQL clauses, functions, and operators used throughout the **SQL Sparring Playbook**.

---

## SELECT
- Chooses which columns or calculations you want to return  
- Defines the shape of the result set  

## FROM
- Specifies which table(s) the data comes from  
- Establishes the starting point of the query  

## WHERE
- Filters rows before grouping or aggregation  
- Cannot reference aggregate functions (SUM, COUNT, etc.)  

## AND
- Combines conditions where all must be true  

## OR
- Combines conditions where any can be true  
- Often requires parentheses to avoid logic errors  

## IN
- Checks if a value matches any value in a list  
- Cleaner than multiple OR conditions  

## BETWEEN
- Filters values within a range (inclusive)  

## LIKE
- Used for pattern matching with text  
- `%` = wildcard (any number of characters)  

## IS NULL / IS NOT NULL
- Checks for missing (NULL) values  

---

# Sorting & Limiting

## ORDER BY
- Sorts the result set  
- `ASC` = ascending, `DESC` = descending  

## TOP
- Limits the number of rows returned  
- SQL Server–specific  

---

# Aggregates

## COUNT()
- Counts rows  
- `COUNT(*)` counts rows regardless of NULLs  

## SUM()
- Adds numeric values  

## AVG()
- Calculates the average of numeric values  

## MAX() / MIN()
- Returns the highest or lowest value  

## GROUP BY
- Groups rows so aggregates can be calculated per group  
- Every non-aggregated column in SELECT must appear here  

## HAVING
- Filters groups after aggregation  
- Used with SUM, COUNT, AVG, etc.  

---

# Joins

## INNER JOIN
- Returns rows where both tables have matching keys  

## LEFT JOIN
- Returns all rows from the left table, even if no match exists on the right  
- Right-side columns become NULL when no match is found  

## ON
- Defines how tables are related in a join  
- Always compares columns, not tables  

---

# Aliases

## TABLE ALIAS
- Shortens table names and improves readability  
- Required once joins are involved  

## COLUMN ALIAS
- Renames calculated or output columns  
- Useful for reporting and dashboards  

---


## WITH (CTE)
- Creates a temporary named result set used inside a query  
- Helps break complex queries into steps  

## CASE
- Adds conditional logic inside SQL queries  
- Used to create categories or labels  

## WHEN / THEN / ELSE / END
- Keywords used inside CASE statements  
- Define conditions and outputs  

---

# Window Functions

## OVER()
- Defines the window for a window function  
- Allows calculations across related rows without grouping  

## PARTITION BY
- Splits data into groups for window functions  
- Resets calculations per group  

## ROW_NUMBER()
- Assigns a unique row number within each partition  
- Useful for latest-row-per-group queries  

## DENSE_RANK()
- Ranks rows without skipping numbers when ties occur  

## LAG()
- Returns the previous row’s value in a window  
- Used for month-over-month trend comparisons  

---

# Date Functions

## YEAR()
- Extracts the year from a date value  

## MONTH()
- Extracts the month number from a date value  

## DAY()
- Extracts the day from a date value  

## DATEADD()
- Adds time to a date  

## DATEDIFF()
- Returns the difference between two dates  

## GETDATE()
- Returns the current system date and time  

---

# Arithmetic Operators

## +
- Adds numeric values  

## -
- Subtracts numeric values  

## *
- Multiplies numeric values  

## /
- Divides numeric values  

## %
- Returns the remainder after division  

---

# Data Type Helpers

## CAST()
- Converts a value from one data type to another  

## CONVERT()
- Converts values between data types (SQL Server style)  

---

# Extra Filtering Tools

## NOT
- Reverses a condition  

## EXISTS
- Checks whether a subquery returns any rows  
- Useful for filtering based on related data  

---

