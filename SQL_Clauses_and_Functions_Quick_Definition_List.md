SQL Clauses and Functions – Quick Definition List
SELECT
Chooses which columns or calculations you want to return
Defines the shape of the result set
FROM
Specifies which table(s) the data comes from
Establishes the starting point of the query
WHERE
Filters rows before grouping or aggregation
Cannot reference aggregate functions (SUM, COUNT, etc.)
AND
Combines conditions where all must be true
Example:
WHERE Status = 5 AND TotalDue > 100
OR
Combines conditions where any can be true
Often requires parentheses to avoid logic errors
IN
Checks if a value matches any value in a list
Cleaner than multiple OR conditions
Example:
WHERE Status IN (1, 3, 5)
BETWEEN
Filters values within a range (inclusive)
LIKE
Used for pattern matching with text
% = wildcard (any number of characters)
Example:
WHERE SalesOrderNumber LIKE '%50%'
IS NULL / IS NOT NULL
Checks for missing (NULL) values
ORDER BY
Sorts the result set
ASC = ascending
DESC = descending
TOP
Limits the number of rows returned
SQL Server–specific
COUNT()
Counts rows
COUNT(*) counts rows regardless of NULLs
SUM()
Adds numeric values
AVG()
Calculates the average of numeric values
MAX() / MIN()
Returns the highest or lowest value
GROUP BY
Groups rows so aggregates can be calculated per group
Every non-aggregated column in SELECT must appear here
HAVING
Filters groups after aggregation
Used with SUM, COUNT, AVG, etc.
INNER JOIN
Returns rows where both tables have matching keys
LEFT JOIN
Returns all rows from the left table, even if no match exists on the right
Right-side columns become NULL when no match is found
ON
Defines how tables are related in a join
Always compares columns, not tables
TABLE ALIAS
Shortens table names and improves readability
Required once joins are involved
Example:
FROM SalesLT.Customer AS C
COLUMN ALIAS
Renames calculated or output columns
Useful for reports
Example:
SUM(TotalDue) AS TotalRevenue
WITH (CTE)
Creates a temporary named result set used inside a query
Helps break complex queries into steps
Example:
WITH CustomerTotals AS (...)
CASE
Adds conditional logic inside SQL queries
Used to create categories or labels
Example:
CASE WHEN TotalDue > 5000 THEN 'High' ELSE 'Low' END
WHEN / THEN / ELSE / END
Keywords used inside CASE statements
Define conditions and outputs
OVER()
Defines a window for a window function
Allows calculations across related rows without grouping
PARTITION BY
Splits data into groups for window functions
Resets calculations per group
Example:
OVER (PARTITION BY CustomerID)
ROW_NUMBER()
Assigns a unique row number within each partition
Useful for finding the latest row per group
DENSE_RANK()
Ranks rows without skipping numbers when ties occur
Example: 1, 2, 2, 3 (no gap)
LAG()
Returns the previous row’s value in a window
Used for trend and month-over-month change
Example:
LAG(MonthlyRevenue) OVER (ORDER BY Month)
YEAR()
Extracts the year from a date value
Example:
YEAR(OrderDate)
MONTH()
Extracts the month number from a date value
Example:
MONTH(OrderDate)
DAY()
Extracts the day from a date value
DATEADD()
Adds time to a date
Example:
DATEADD(month, 1, OrderDate)
DATEDIFF()
Returns the difference between two dates
Example:
DATEDIFF(day, StartDate, EndDate)
GETDATE()
Returns the current system date and time
CAST()
Converts a value from one data type to another
Example:
CAST(TotalDue AS INT)
CONVERT()
Converts values between data types (SQL Server style)
NOT
Reverses a condition
Example:
WHERE NOT Color = 'Red'
EXISTS
Checks whether a subquery returns any rows
Used for filtering based on related data
Arithmetic Operators
+
Adds numeric values
-
Subtracts numeric values
*
Multiplies numeric values
/
Divides numeric values
%
Returns the remainder after division
