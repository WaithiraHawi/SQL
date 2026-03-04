-- Invoices starting with 'C' are cancellations.
CREATE TABLE retail_clean AS
SELECT *
FROM retail_raw
WHERE invoice_no NOT LIKE 'C%';

-- drop null customers 
DELETE FROM retail_clean
WHERE customer_id IS NULL;

-- Remove Negative or Zero Values
DELETE FROM retail_clean
WHERE quantity <= 0
   OR unit_price <= 0;

-- add evenue columns 
ALTER TABLE retail_clean
ADD COLUMN revenue NUMERIC(12,2);

UPDATE retail_clean
SET revenue = quantity * unit_price;
