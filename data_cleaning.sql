-- Invoices starting with 'C' are cancellations.
CREATE TABLE retail_clean AS
SELECT *
FROM retail_raw
WHERE invoice_no NOT LIKE 'C%';
