# 📚 Bookstore Sales & Customer Analytics — SQL Portfolio Project

## 🧠 Overview
This project simulates a real-world bookstore database and showcases SQL skills through business-focused queries. It includes schema design, data import from CSV files, and a wide range of SQL operations — from basic filtering to advanced joins and aggregations. Ideal for data analyst portfolios and resume enhancement.

---

## 🏗️ Database Schema

Three relational tables were created:

### 📘 `Books`
- `Book_ID` (Primary Key)
- `Title`, `Author`, `Genre`, `Published_Year`
- `Price`, `Stock`

### 👤 `Customers`
- `Customer_ID` (Primary Key)
- `Name`, `Email`, `Phone`, `City`, `Country`

### 📦 `Orders`
- `Order_ID` (Primary Key)
- `Customer_ID` → Foreign Key to `Customers`
- `Book_ID` → Foreign Key to `Books`
- `Order_Date`, `Quantity`, `Total_Amount`

---

## 📥 Data Import

CSV files were imported using PostgreSQL’s `\COPY` command:

```sql
\COPY Books FROM 'Books.csv' WITH (FORMAT csv, HEADER true);
\COPY Customers FROM 'Customers.csv' WITH (FORMAT csv, HEADER true);
\COPY Orders FROM 'Orders.csv' WITH (FORMAT csv, HEADER true);
```

---

## 🔍 SQL Queries

### 🔹 Basic Queries
- Filter books by genre or year
- Find customers from specific countries
- Retrieve orders within a date range
- Identify books with highest price or lowest stock

### 🔹 Aggregation & Analysis
- Total stock across all books
- Total revenue from orders
- Average price of books by genre
- Most ordered books and top-selling authors

### 🔹 Business Intelligence
- Cities with high-value orders (₹300+)
- Customers with multiple orders
- Total amount spent per customer (ranked)
- Genre-wise book sales
- Inventory vs. order quantity (including unsold books)

---

## 🧠 Sample Advanced Query

```sql
SELECT b.book_id, b.title, b.stock,
       COALESCE(SUM(o.quantity), 0) AS Order_quantity
FROM books b
LEFT JOIN orders o ON b.book_id = o.book_id
GROUP BY b.book_id, b.title, b.stock;
```

> Lists all books with their stock and total quantity ordered. Books with no orders show `0` using `COALESCE`.

---

## 💡 Skills Demonstrated

- SQL fundamentals: `SELECT`, `WHERE`, `GROUP BY`, `ORDER BY`, `HAVING`
- Joins: `INNER JOIN`, `LEFT JOIN`
- Aggregations: `SUM()`, `COUNT()`, `AVG()`, `MAX()`, `MIN()`
- Subqueries and filtering
- Real-world schema design and data import


