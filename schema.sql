-- Create database
CREATE DATABASE online_retail;

-- Connect to database
-- \c online_retail;

-- Create raw table
CREATE TABLE retail_raw (
    invoice_no      VARCHAR(20),
    stock_code      VARCHAR(20),
    description     TEXT,
    quantity        INT,
    invoice_date    TIMESTAMP,
    unit_price      NUMERIC(10,2),
    customer_id     NUMERIC,
    country         VARCHAR(100)
);
