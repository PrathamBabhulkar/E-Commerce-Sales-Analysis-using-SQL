# 🛒 E-Commerce Sales Analysis using SQL

## 📌 Project Overview
This project focuses on analyzing **e-commerce sales data** using **SQL** to uncover meaningful insights about customer behavior, product performance, sales trends, and inventory patterns.

The analysis helps stakeholders make **data-driven decisions** related to:
- Marketing strategies  
- Inventory planning  
- Sales optimization  

The project is built using four core datasets:
- **Customers**
- **Products**
- **Orders**
- **OrderDetails**

---

## 🎯 Objectives
- Analyze overall sales performance
- Identify top-selling and low-performing products
- Understand customer purchasing behavior
- Track monthly and yearly sales trends
- Support inventory and demand forecasting decisions

---

## 🗂️ Database Schema
The project uses a relational database structure with the following tables:

- **Customers** – Stores customer details  
- **Products** – Contains product information and pricing  
- **Orders** – Stores order-level data  
- **OrderDetails** – Contains individual product order information  

### 📊 ER Diagram
![Database Schema](unnamed.png)

> _Add your ER diagram image inside the `images` folder._

---

## 🛠️ Tools & Technologies
- **SQL** (MySQL / PostgreSQL / SQLite)
- **DBMS**: MySQL / PostgreSQL
- **Data Source**: Sample E-commerce Dataset
- **IDE**: MySQL Workbench / pgAdmin / DBeaver

---

## 🔍 Key Analysis Performed
- Total sales and revenue analysis
- Monthly and yearly sales trends
- Top 10 best-selling products
- Customer segmentation based on purchase behavior
- Order frequency analysis
- Inventory performance insights

---

## 📈 Sample SQL Queries

```sql
SELECT 
    p.product_name,
    SUM(od.quantity * od.price) AS total_sales
FROM OrderDetails od
JOIN Products p ON od.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sales DESC;
