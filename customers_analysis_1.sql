####  CUSTOMERS INSIGHTS AREA  ####

-- Set default database so you don’t need to type schema each time
USE case_study_ecom;

-- Fix the weird BOM character in column name
ALTER TABLE customers 
RENAME COLUMN `ï»¿customer_id` TO customer_id;

-- Preview the table (no schema needed)
SELECT * FROM customers;

#   1. Customer Demographics & Location Analysis

select location, count(customer_id) as Total_customer
from customers
group by location
order by count(customer_id) DESC;

#	2. High-Value Customers (Top Spenders)

select c.customer_id, c.name, sum(o.total_amount) as Total_spent
from customers c 
join orders o on c.customer_id = o.customer_id 
group by c.customer_id, c.name
order by sum(o.total_amount) DESC
limit 10;

#	3. Repeat Customers vs New Customers

select customer_id, count(customer_id) as Total_orders,
CASE 
	when count(customer_id)                      = 1 then 'New Customer'
    else 'Repeat Customer'
END as Customer_type
from orders
group by customer_id;

SELECT customer_id,
       COUNT(order_id) AS total_orders,
       CASE 
           WHEN COUNT(order_id) = 1 THEN 'New Customer'
           ELSE 'Repeat Customer'
       END AS customer_type
FROM Orders
GROUP BY customer_id;


#	4. Average Order Value (AOV) by Customer

SELECT 
    c.customer_id,
    c.name,
    ROUND(AVG(o.total_amount), 2) AS avg_order_value
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY avg_order_value DESC;


select c.customer_id, c.name, avg(o.total_amount) as avg_order_value
from customers c
join orders o on c.customer_id = o.customer_id
group by c.customer_id, c.name
order by avg(o.total_amount) DESC;


#	5. Customer Purchase Frequency

SELECT 
    customer_id,
    COUNT(order_id) AS total_orders
FROM Orders
GROUP BY customer_id
ORDER BY total_orders DESC;

SELECT 
    customer_id,
    COUNT(order_id) AS total_orders
FROM Orders
GROUP BY customer_id
ORDER BY customer_id DESC;


#	6. Revenue Contribution by Customer Segments

WITH customer_revenue AS (
    SELECT 
        c.customer_id,
        SUM(o.total_amount) AS total_revenue
    FROM Orders o
    JOIN Customers c ON o.customer_id = c.customer_id
    GROUP BY c.customer_id
)

SELECT 
    CASE
        WHEN total_revenue > 20000 THEN 'Platinum'
        WHEN total_revenue BETWEEN 5000 AND 20000 THEN 'Gold'
        ELSE 'Silver'
    END AS segment,
    COUNT(*) AS customers_in_segment,
    SUM(total_revenue) AS revenue
FROM customer_revenue
GROUP BY segment
ORDER BY revenue DESC;


####################  Demo practice  ######################################

select name, count(*)
from customers 
group by name 
having count(*) =1;


# CTE( Common Table Expression)
with pune_emp as (
	select name, location
    from customers
    where location = 'Pune')
    
    select name from pune_emp;
    
    
    # Temporary table
    
    create temporary table temp_table as 
    select name, location
    from customers 
    where location = 'Pune';
    
    select * from temp_table;
    
    
    
    








