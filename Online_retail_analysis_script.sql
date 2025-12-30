-- =========================
-- Data Exploration
-- =========================

Select count(*) from online_retail;

Select * from online_retail
limit 5;

--Checking for Missing Values
select 
	sum (case when CustomerID is Null then 1 else 0 end) as missing_customerid,
	sum (case when Description is Null then 1 else 0 end) as missing_description
from online_retail;

--Cancelled invoices
select count(*)
 from online_retail where InvoiceNo like 'c%';

--checking for zero ordred values
select count(*)
 from online_retail where Quantity <= 0;

-- =========================
-- Data Cleaning
-- =========================

--creating new table by droping missing values, incompleted invoices and zeo orderd quantities
CREATE TABLE online_retail_clean as 
select * from online_retail
where InvoiceNo not like 'c%'
	  and Quantity > 0
	  and Unitprice >0
	  and CustomerID IS NOT NULL;

--Comparing old and new tables
SELECT
    (SELECT COUNT(*) FROM online_retail) AS raw_rows,
    (SELECT COUNT(*) FROM online_retail_clean) AS clean_rows;


-- =========================
-- Revenue Analysis
-- =========================

--Total revenue
select SUM(Quantity * UnitPrice) AS total_revenue
from online_retail_clean;

--Revenue by Country
select Country AS country_name,
	SUM(Quantity * UnitPrice) AS revenue
from online_retail_clean
group by Country
order by revenue DESC;

--Top 10 Products by Revenue
select StockCode, Description,
	SUM(Quantity * UnitPrice) AS revenue
from online_retail_clean
group by StockCode, Description
order by revenue DESC
limit 10;

--Monthly Revenue Trend
--InvoiceDate stored as DD-MM-YYYY, so year and month extracted using substr()
select substr(InvoiceDate, 7,4)|| '-' ||substr(InvoiceDate, 4,2) as month,
	SUM(Quantity * UnitPrice) AS revenue
from online_retail_clean
group by month
order by month;

--Top 10 Customers by total spend
select CustomerID,
	SUM(Quantity * UnitPrice) AS total_spend
from online_retail_clean
where CustomerID <> ''
group by CustomerID
order by total_spend DESC
limit 10;

--Average order value
select
	avg(order_total)as avg_order_value
from (
		select
			InvoiceNo,
			SUM(Quantity * UnitPrice) AS order_total
		from online_retail_clean
    	group by InvoiceNo );

--Average order value per month
select
	month,
	avg(order_total)as avg_order_value
from (
		select
			InvoiceNo,
			substr(InvoiceDate, 7, 4) || '-' || substr(InvoiceDate, 4, 2) AS month,
			SUM(Quantity * UnitPrice) AS order_total
		from online_retail_clean
    	group by InvoiceNo, month 
)t
group by month
order by month;
