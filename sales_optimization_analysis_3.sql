
use case_study_ecom;

select * from products;

SELECT * FROM case_study_ecom.order_details;

alter table case_study_ecom.order_details rename column ï»¿order_id to order_id;

#	1️⃣ Identifying Top-Selling Products 
SELECT p.name AS product_name, SUM(od.quantity) AS total_units_sold
FROM Order_Details od
JOIN Products p ON od.product_id = p.product_id
GROUP BY p.name
ORDER BY total_units_sold DESC
LIMIT 10;


#	2️⃣ Finding Revenue Trends Month-over-Month (MoM Growth)
SELECT DATE_FORMAT(o.order_date, '%Y-%m') AS month,
	   date_format(o.order_date, '%M') as Month_name,
       SUM(o.total_amount) AS monthly_revenue
FROM Orders o
GROUP BY month, month_name
ORDER BY month;


#	3️⃣ Detecting High-Value Customers (Revenue Contribution)

SELECT c.customer_id, c.name,
       SUM(o.total_amount) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_spent DESC;

#	4️⃣ Low-Performing Products (Sales Decliners)

SELECT p.name,
       SUM(od.quantity) AS units_sold
FROM Products p
LEFT JOIN Order_Details od ON p.product_id = od.product_id
GROUP BY p.name
HAVING units_sold IS NULL OR units_sold < 120
ORDER BY units_sold;

#	5️⃣ Conversion Analysis – Orders per Customer

SELECT c.customer_id, c.name,
       COUNT(o.order_id) AS total_orders
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_orders DESC
limit 10;


