-- =============================================
-- E-Commerce Sales SQL Queries
-- =============================================

-- 1. Monthly Order Trends
SELECT 
    EXTRACT(YEAR FROM invoicedate) AS yr,
    EXTRACT(MONTH FROM invoicedate) AS mo,
    COUNT(DISTINCT invoiceno) AS total_order
FROM sales_data
GROUP BY yr, mo
ORDER BY yr, mo;

-- 2. Monthly Revenue
SELECT
    EXTRACT(YEAR FROM invoicedate) AS yr,
    EXTRACT(MONTH FROM invoicedate) AS mo,
    SUM(quantity * unitprice) AS monthly_revenue
FROM sales_data
GROUP BY yr, mo
ORDER BY yr, mo;

-- 3. Top 5 Best-Selling Products by Quantity
SELECT 
    description,
    SUM(quantity) AS total_quantity
FROM sales_data
GROUP BY description
ORDER BY total_quantity DESC
LIMIT 5;

-- 4. Top 5 Products by Revenue
SELECT 
    description,
    SUM(quantity * unitprice) AS total_revenue
FROM sales_data
GROUP BY description
ORDER BY total_revenue DESC
LIMIT 5;

-- 5. Top 5 Revenue-Generating Countries
SELECT 
    country,
    SUM(quantity * unitprice) AS total_revenue
FROM sales_data
GROUP BY country
ORDER BY total_revenue DESC
LIMIT 5;

-- 6. Top 5 Highest-Spending Customers
SELECT 
    customerid,
    SUM(quantity * unitprice) AS total_spent
FROM sales_data
WHERE customerid IS NOT NULL
GROUP BY customerid
ORDER BY total_spent DESC
LIMIT 5;
