#Product Insight Areas

USE case_study_ecom;

SELECT * FROM case_study_ecom.products;
SELECT * FROM products;

select category from case_study_ecom.products;

# 1️⃣ Best-Selling Products 

SELECT 
    p.product_id,
    p.name,
    SUM(od.quantity) AS total_units_sold,
    SUM(od.quantity * od.price_per_unit) AS total_revenue
FROM order_details od
JOIN products p ON od.product_id = p.product_id
GROUP BY p.product_id, p.name
ORDER BY total_units_sold DESC;




select p.product_id, p.name, 
	sum(od.quantity) as total_unit_sold,
	sum(od.quantity * od.price_per_unit) as Total_Revenue
from products p 
join order_details od on p.product_id = od.product_id
group by p.product_id, p.name
order by sum(od.quantity) DESC;


#	2️⃣ Underperforming / Low-Selling Products
SELECT 
    p.product_id,
    p.name,
    COALESCE(SUM(od.quantity), 0) AS total_units_sold
FROM products p
LEFT JOIN order_details od ON p.product_id = od.product_id
GROUP BY p.product_id, p.name
ORDER BY total_units_sold ASC;

#	3️⃣ Highest Revenue-Generating Categories

SELECT 
    p.category,
    SUM(od.quantity * od.price_per_unit) AS total_revenue
FROM Order_Details od
JOIN Products p ON od.product_id = p.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;

#	4️⃣ Price vs Sales Relationship (Is price too high?)

SELECT 
    p.name,
    p.price,
    SUM(od.quantity) AS total_units_sold
FROM Products p
JOIN Order_Details od ON p.product_id = od.product_id
GROUP BY p.name, p.price
ORDER BY p.price DESC;

#	5️⃣ Product Contribution to Total Sales (Pareto Analysis: 80/20 Rule)

SELECT 
    p.product_id,
    p.name,
    SUM(od.quantity * od.price_per_unit) AS product_revenue,
    ROUND(
        SUM(od.quantity * od.price_per_unit) * 100.0 /
        (SELECT SUM(quantity * price_per_unit) FROM Order_Details),
    2) AS revenue_percentage
FROM Order_Details od
JOIN Products p ON od.product_id = p.product_id
GROUP BY p.product_id, p.name
ORDER BY product_revenue DESC;















