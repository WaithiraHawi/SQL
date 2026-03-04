-- Calculating RFM Metrics
WITH rfm_base AS (
    SELECT
        customer_id,
        MAX(invoice_date) AS last_purchase_date,
        COUNT(DISTINCT invoice_no) AS frequency,
        SUM(revenue) AS monetary
    FROM fact_sales
    GROUP BY customer_id
),

rfm_calc AS (
    SELECT *,
        (SELECT MAX(invoice_date) FROM fact_sales) 
        - last_purchase_date AS recency
    FROM rfm_base
)

SELECT *
FROM rfm_calc;

-- Creating RFM Scores (Quintiles)
WITH rfm_scores AS (
    SELECT *,
        NTILE(5) OVER (ORDER BY recency DESC) AS r_score,
        NTILE(5) OVER (ORDER BY frequency) AS f_score,
        NTILE(5) OVER (ORDER BY monetary) AS m_score
    FROM rfm_calc
)

SELECT *,
       CONCAT(r_score, f_score, m_score) AS rfm_segment
FROM rfm_scores;

-- Business Insight 555 = Champions,  High R + Low F = At-risk customers and High M = VIP customers
