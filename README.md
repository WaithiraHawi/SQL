# Online Retail SQL Analytics Project
Comprehensive end-to-end SQL analytics project using transactional e-commerce data to generate business insights, customer segmentation, retention analysis and revenue optimization strategies.

# Project Overview

This project analyzes transactional data from an international online retail store to answer key business questions:
What drives revenue growth?
Who are the highest-value customers?
What does customer retention look like?
How can we segment customers for targeted marketing?
What is the estimated Customer Lifetime Value (CLV)?
The project demonstrates advanced SQL techniques including:
Data cleaning & transformation
Feature engineering
KPI development
RFM segmentation
Cohort retention analysis
CLV modeling
Window functions & CTEs
Business-driven analytical storytelling

# Dataset
Source: UCI Online Retail Dataset
Period Covered: 2010–2011
Transactions: 500K+
Geography: International (majority UK-based)
Data Fields:
InvoiceNo
StockCode
Description
Quantity
InvoiceDate
UnitPrice
CustomerID

# Project Structure
online-retail-sql-project/
│
├── 01_schema.sql
├── 02_data_cleaning.sql
├── 03_feature_engineering.sql
├── 04_kpi_analysis.sql
├── 05_rfm_analysis.sql
├── 06_cohort_analysis.sql
├── 07_clv_analysis.sql
└── README.md

# Data Cleaning Process
Key cleaning steps performed:
Removed cancelled invoices (InvoiceNo starting with 'C')
Removed null CustomerID
Removed negative/zero quantities and unit prices
Created revenue column (Quantity × UnitPrice)
Extracted date features (year, month, day)
This ensures clean, analysis-ready transactional data.

# Business KPI Analysis
Key metrics calculated:
Total Revenue
Total Orders
Total Customers
Average Order Value (AOV)
Monthly Revenue Trends
Revenue by Country
Repeat Purchase Rate

For instance;
Revenue is highly concentrated in the UK.
A small percentage of customers contribute the majority of revenue (Pareto Principle).
Clear Q4 seasonality spike (holiday purchasing behavior).

# RFM Customer Segmentation
RFM (Recency, Frequency, Monetary) scoring was implemented using SQL window functions:
NTILE(5) used for quintile scoring
Customers segmented into groups such as:
Champions (555)
Loyal Customers
At Risk
Big Spenders

# Business Impact:
This segmentation can power:
Targeted email campaigns
Retention strategies
Loyalty programs
Reactivation campaigns

# Cohort Retention Analysis
Cohort analysis was performed by:
Identifying each customer’s first purchase month.
Tracking repeat purchases across subsequent months.
Building a retention matrix structure.

Insight:
Strong initial acquisition periods.
Noticeable drop-off after first month.
Retention improves significantly among high-frequency buyers.

# Customer Lifetime Value (CLV) Estimation
Basic CLV model:

CLV = Average Order Value × Purchase Frequency × Customer Lifespan

Used transactional history to approximate:
Customer lifespan
Order frequency
Revenue contribution
This provides prioritization for:
VIP customer retention
Marketing spend allocation
Customer profitability analysis

# Advanced SQL Techniques
Common Table Expressions (CTEs)
Window Functions (NTILE, ROW_NUMBER)
Aggregate Functions
Date Manipulation
Cohort Bucketing
Derived Metrics
Conditional Aggregation
Revenue Modeling

# Key Business Findings
Revenue is geographically concentrated.
Customer value distribution is highly skewed.
High-frequency customers drive long-term profitability.
Retention significantly impacts overall revenue growth.
Seasonal revenue peaks suggest promotional opportunities.

Author: Dorothy Mary Waithira Kamau
