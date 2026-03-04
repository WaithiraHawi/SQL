-- Extract Date Features
ALTER TABLE retail_clean
ADD COLUMN invoice_year INT,
ADD COLUMN invoice_month INT,
ADD COLUMN invoice_day DATE;

UPDATE retail_clean
SET invoice_year  = EXTRACT(YEAR FROM invoice_date),
    invoice_month = EXTRACT(MONTH FROM invoice_date),
    invoice_day   = DATE(invoice_date);

-- Create Fact Table
CREATE TABLE fact_sales AS
SELECT
    invoice_no,
    customer_id,
    stock_code,
    country,
    invoice_date,
    invoice_year,
    invoice_month,
    quantity,
    unit_price,
    revenue
FROM retail_clean;
