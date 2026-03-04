-- Estimate Customer Lifetime Value (Basic Model)

-- CLV = Average Order Value × Purchase Frequency × Customer Lifespan

WITH customer_metrics AS (
    SELECT
        customer_id,
        SUM(revenue) AS total_revenue,
        COUNT(DISTINCT invoice_no) AS total_orders,
        MAX(invoice_date) - MIN(invoice_date) AS lifespan
    FROM fact_sales
    GROUP BY customer_id
)

SELECT
    customer_id,
    total_revenue / total_orders AS avg_order_value,
    total_orders,
    lifespan,
    (total_revenue / total_orders) 
        * total_orders AS estimated_clv
FROM customer_metrics
ORDER BY estimated_clv DESC;
