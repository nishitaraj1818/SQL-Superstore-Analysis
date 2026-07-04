-- ==========================================================
-- SQL SUPERSTORE SALES ANALYSIS
-- ==========================================================

-- ==========================================================
-- Create Customers Table
-- ==========================================================

DROP TABLE IF EXISTS customers;

CREATE TABLE customers AS
SELECT
    "Customer ID",
    MIN("Customer Name") AS "Customer Name",
    MIN(Segment) AS Segment,
    MIN(Country) AS Country,
    MIN(State) AS State,
    MIN(City) AS City
FROM superstore_raw
GROUP BY "Customer ID";


-- ==========================================================
-- Create Products Table
-- ==========================================================

DROP TABLE IF EXISTS products;

CREATE TABLE products AS
SELECT DISTINCT
    "Product ID",
    Category,
    "Sub-Category",
    "Product Name"
FROM superstore_raw;


-- ==========================================================
-- Create Orders Table
-- ==========================================================

DROP TABLE IF EXISTS orders;

CREATE TABLE orders AS
SELECT
    "Order ID",
    "Order Date",
    "Ship Date",
    "Ship Mode",
    "Customer ID",
    "Product ID",
    Sales,
    Quantity,
    Discount,
    Profit
FROM superstore_raw;


-- ==========================================================
-- Verify Tables
-- ==========================================================

SELECT COUNT(*) AS Customers FROM customers;

SELECT COUNT(*) AS Products FROM products;

SELECT COUNT(*) AS Orders FROM orders;


-- ==========================================================
-- Above Average Sales
-- ==========================================================

SELECT
    "Order ID",
    "Customer ID",
    Sales,
    Profit
FROM orders
WHERE Sales >
(
    SELECT AVG(Sales)
    FROM orders
)
ORDER BY Sales DESC;


-- ==========================================================
-- Single Order Customers
-- ==========================================================

SELECT
    c."Customer ID",
    c."Customer Name",
    COUNT(DISTINCT o."Order ID") AS TotalOrders
FROM customers c
JOIN orders o
ON c."Customer ID" = o."Customer ID"
GROUP BY
    c."Customer ID",
    c."Customer Name"
HAVING COUNT(DISTINCT o."Order ID") = 1;


-- ==========================================================
-- Highest Order Per Customer
-- ==========================================================

SELECT *
FROM orders o
WHERE Sales =
(
    SELECT MAX(Sales)
    FROM orders
    WHERE "Customer ID" = o."Customer ID"
);


-- ==========================================================
-- Customer Total Sales (CTE)
-- ==========================================================

WITH CustomerSales AS
(
    SELECT
        "Customer ID",
        SUM(Sales) AS TotalSales
    FROM orders
    GROUP BY "Customer ID"
)

SELECT *
FROM CustomerSales
ORDER BY TotalSales DESC;


-- ==========================================================
-- ROW_NUMBER Window Function
-- ==========================================================

SELECT
    "Customer ID",
    Sales,

ROW_NUMBER() OVER
(
PARTITION BY "Customer ID"
ORDER BY Sales DESC
)

AS RowNumber

FROM orders;


-- ==========================================================
-- Customer Ranking
-- ==========================================================

WITH CustomerSales AS
(
SELECT

"Customer ID",

SUM(Sales) AS TotalSales

FROM orders

GROUP BY "Customer ID"
)

SELECT

*,

RANK() OVER
(
ORDER BY TotalSales DESC
)

AS CustomerRank

FROM CustomerSales;


-- ==========================================================
-- Join + CTE + Window Function
-- ==========================================================

WITH CustomerSales AS
(
SELECT

c."Customer ID",

c."Customer Name",

SUM(o.Sales) AS TotalSales

FROM customers c

JOIN orders o

ON c."Customer ID" = o."Customer ID"

GROUP BY

c."Customer ID",

c."Customer Name"
)

SELECT

*,

RANK() OVER
(
ORDER BY TotalSales DESC
)

AS CustomerRank

FROM CustomerSales;


-- ==========================================================
-- Top 10 Customers
-- ==========================================================

SELECT

c."Customer ID",

c."Customer Name",

ROUND(SUM(o.Sales),2) AS TotalSales

FROM customers c

JOIN orders o

ON c."Customer ID" = o."Customer ID"

GROUP BY

c."Customer ID",

c."Customer Name"

ORDER BY TotalSales DESC

LIMIT 10;


-- ==========================================================
-- Top 10 Products
-- ==========================================================

SELECT

p."Product Name",

ROUND(SUM(o.Sales),2) AS TotalSales

FROM products p

JOIN orders o

ON p."Product ID" = o."Product ID"

GROUP BY

p."Product Name"

ORDER BY TotalSales DESC

LIMIT 10;


-- ==========================================================
-- Loss Making Orders
-- ==========================================================

SELECT

"Order ID",

"Customer ID",

Sales,

Profit

FROM orders

WHERE Profit < 0

ORDER BY Profit ASC;


-- ==========================================================
-- Sales by Category
-- ==========================================================

SELECT

p.Category,

ROUND(SUM(o.Sales),2) AS TotalSales

FROM products p

JOIN orders o

ON p."Product ID" = o."Product ID"

GROUP BY

p.Category

ORDER BY TotalSales DESC;


-- ==========================================================
-- END OF SQL ANALYSIS
-- ==========================================================