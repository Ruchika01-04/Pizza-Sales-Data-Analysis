SELECT * 
FROM pizza_sales

SELECT 
SUM(total_price)/COUNT(DISTINCT order_id) AS Avg_order_value
FROM pizza_sales

SELECT 
SUM(quantity) AS total_pizza_sold
FROM pizza_sales

SELECT 
COUNT(DISTINCT order_id) AS total_order
FROM pizza_sales

SELECT 
CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) /
CAST(COUNT (DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS Avg_pizza_per_order
FROM pizza_sales


SELECT DATENAME(DW,order_date) AS order_day,
COUNT(DISTINCT order_id) AS total_order
FROM pizza_sales
GROUP BY DATENAME(DW,order_date)

SELECT DATENAME(MONTH, order_date) AS monthly_order,
COUNT(DISTINCT order_id) AS total_order
FROM pizza_sales
GROUP BY DATENAME(MONTH, order_date) 
ORDER BY total_order DESC

SELECT pizza_size,SUM(total_price) AS Total_sales ,
CAST(SUM(total_price) * 100 /
(SELECT SUM(total_price) pizza FROM pizza_sales )AS DECIMAL(10,2)) AS percentage_total_sales 
FROM pizza_sales
GROUP BY pizza_size
ORDER BY percentage_total_sales DESC


SELECT TOP 5 pizza_name, SUM(quantity) AS total_quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_quantity DESC
