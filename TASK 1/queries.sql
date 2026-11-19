-- ============================================================
-- Maincrafts Technology: Data Analytics & Business Intelligence
-- Task 1: SQL Data Extraction
-- Database: SQLite | Table: sales (9,799 rows, cleaned dataset)
-- Note: the dataset has no Profit, Quantity or Discount columns,
-- so all queries use Sales as the measure.
-- ============================================================

-- Table structure (as imported from cleaned CSV)
-- sales(row_id, order_id, order_date, ship_date, ship_mode,
--       customer_id, customer_name, segment, country, city, state,
--       postal_code, region, product_id, category, sub_category,
--       product_name, sales)

-- Sanity check: row count and total sales
SELECT COUNT(*) AS total_rows, ROUND(SUM(sales), 2) AS total_sales
FROM sales;

-- Query 1: Total sales by region
SELECT region, ROUND(SUM(sales), 2) AS total_sales
FROM sales
GROUP BY region
ORDER BY total_sales DESC;

-- Query 2: Top 5 products by sales
SELECT product_name, ROUND(SUM(sales), 2) AS total_sales
FROM sales
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 5;

-- Query 3: Monthly sales trend (order_date stored as YYYY-MM-DD)
SELECT SUBSTR(order_date, 1, 7) AS month, ROUND(SUM(sales), 2) AS total_sales
FROM sales
GROUP BY month
ORDER BY month;

-- Query 4: Total sales by category
SELECT category, ROUND(SUM(sales), 2) AS total_sales
FROM sales
GROUP BY category
ORDER BY total_sales DESC;

-- Query 5: Top 5 customers by sales
SELECT customer_name, ROUND(SUM(sales), 2) AS total_sales
FROM sales
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 5;
