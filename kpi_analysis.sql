-- Total Revenue
SELECT SUM(revenue) AS total_revenue
FROM fact_sales;

--Total Orders
SELECT COUNT(DISTINCT invoice_no) AS total_orders
FROM fact_sales;

-- total customers 
SELECT COUNT(DISTINCT customer_id) AS total_customers
FROM fact_sales;

-- Average Order Value (AOV)
SELECT 
    SUM(revenue) / COUNT(DISTINCT invoice_no) AS avg_order_value
FROM fact_sales;

--Monthly Revenue Trend
SELECT 
    invoice_year,
    invoice_month,
    SUM(revenue) AS monthly_revenue
FROM fact_sales
GROUP BY invoice_year, invoice_month
ORDER BY invoice_year, invoice_month;

-- Revenue by Country
SELECT 
    country,
    SUM(revenue) AS total_revenue
FROM fact_sales
GROUP BY country
ORDER BY total_revenue DESC;
