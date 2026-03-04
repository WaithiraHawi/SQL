-- Top 10 Products by Revenue
SELECT
    stock_code,
    SUM(revenue) AS total_revenue
FROM fact_sales
GROUP BY stock_code
ORDER BY total_revenue DESC
LIMIT 10;

-- Repeat Purchase Rate
SELECT
    COUNT(*) FILTER (WHERE total_orders > 1)::decimal
    / COUNT(*) AS repeat_purchase_rate
FROM (
    SELECT customer_id,
           COUNT(DISTINCT invoice_no) AS total_orders
    FROM fact_sales
    GROUP BY customer_id
) t;
