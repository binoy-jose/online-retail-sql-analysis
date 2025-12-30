# online-retail-sql-analysis
SQL based analysis of online retail data focusing on revenue, customers, products, and trends

## Project Overview
This project analyzes an online retail dataset using SQL to derive business insights related to sales performance,
customer behavior, and product trends. The focus is on data cleaning, aggregation, and time-based analysis.

## 📊 Dataset
- Online Retail Dataset
- Contains transactional data including invoices, products, quantities, prices, customers, and invoice dates.

## 🧹 Data Cleaning Steps
- Removed cancelled invoices (InvoiceNo starting with 'C')
- Removed records with zero or negative quantities and unit prices
- Handled missing and empty CustomerID values
- Created a cleaned table for analysis

## 📈 Key Analyses Performed
- Total revenue calculation
- Revenue by country
- Top products by revenue
- Monthly revenue trend analysis
- Top customers by total spend
- Average Order Value (AOV) per month using nested queries

## 🛠️ SQL Concepts Used
- WHERE, GROUP BY, ORDER BY
- CASE statements
- String functions (SUBSTR)
- Date handling and transformation
- Subqueries and aggregations

## 📌 Key Insights
- Revenue is concentrated in a few major countries
- A small number of products contribute significantly to total revenue
- Monthly trends show seasonality in sales
- Average order value varies across months, indicating changes in customer spending behavior

## 🧾 Tools Used
- SQL (SQLite)

## 📌 Conclusion
This project demonstrates practical SQL skills including data cleaning, aggregation, and analytical querying to extract
meaningful business insights from transactional data.
