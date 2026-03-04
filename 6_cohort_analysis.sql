-- First Purchase Month
WITH first_purchase AS (
    SELECT
        customer_id,
        MIN(DATE_TRUNC('month', invoice_date)) AS cohort_month
    FROM fact_sales
    GROUP BY customer_id
),

cohort_data AS (
    SELECT
        f.customer_id,
        DATE_TRUNC('month', f.invoice_date) AS purchase_month,
        fp.cohort_month
    FROM fact_sales f
    JOIN first_purchase fp
    ON f.customer_id = fp.customer_id
)

SELECT
    cohort_month,
    purchase_month,
    COUNT(DISTINCT customer_id) AS customers
FROM cohort_data
GROUP BY cohort_month, purchase_month
ORDER BY cohort_month, purchase_month;

-- Insight: This enables retention rate calculation, cohort heatmap visualization and churn analysis
