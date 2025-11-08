-- Create Tables
DROP TABLE IF EXISTS Books;
CREATE TABLE Books (
    Book_ID SERIAL PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Published_Year INT,
    Price NUMERIC(10, 2),
    Stock INT
);
DROP TABLE IF EXISTS customers;
CREATE TABLE Customers (
    Customer_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),
    Country VARCHAR(150)
);
DROP TABLE IF EXISTS orders;
CREATE TABLE Orders (
    Order_ID SERIAL PRIMARY KEY,
    Customer_ID INT REFERENCES Customers(Customer_ID),
    Book_ID INT REFERENCES Books(Book_ID),
    Order_Date DATE,
    Quantity INT,
    Total_Amount NUMERIC(10, 2)
);
SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;

-- \COPY Books(Book_ID, Title, Author, Genre, Published_Year, Price, Stock)
-- FROM 'C:/Users/aamir/Downloads/SQL_Resume_Project-main/SQL_Resume_Project-main/Books.csv'
-- WITH (FORMAT csv, HEADER true);

-- \COPY Customers(Customer_ID, Name, Email, Phone, City, Country)
-- FROM 'C:/Users/aamir/Downloads/SQL_Resume_Project-main/SQL_Resume_Project-main/Customers.csv'
-- WITH (FORMAT csv, HEADER true);

-- \COPY Orders(Order_ID, Customer_ID, Book_ID, Order_Date, Quantity, Total_Amount)
-- FROM 'C:/Users/aamir/Downloads/SQL_Resume_Project-main/SQL_Resume_Project-main/Orders.csv'
-- WITH (FORMAT csv, HEADER true);

---I am learning--- Basic ----
--Q1---
SELECT * FROM Books where genre='Fiction';
---

--Q2--
SELECT * FROM BOOKS WHERE published_year >=1950;
---

--Q3--
SELECT * FROM Customers WHERE country='Canada';
-----

--Q4--
SELECT * FROM ORDERS
WHERE order_date BETWEEN '2023-11-01' AND '2023-11-30';
---

--qQ5--

SELECT sum(stock) as Total_Stock from Books;
----

--q6--
SELECT * FROM Books
WHERE price = (SELECT MAX(price) FROM Books);
-----

--q7--
SELECT * FROM Orders
WHERE total_amount >20;
----

---Q8---
SELECT DISTINCT(genre)  from Books
GROUP BY genre;
---
SELECT * FROM Books
WHERE stock = (SELECT MIN(stock) FROM Books);


--q11---
select sum(total_amount)AS Total_Revenue FROM Orders;

SELECT * FROM Orders;
SELECT * FROM Books;
SELECT * FROM Customers;


------AdVANCE QUESTIONS----
--q1--
SELECT b.genre, SUM(o.quantity) AS Total_Books_sold
FROM Orders o
JOIN Books b ON o.book_id = b.book_id
GROUP BY b.genre;
------
---q2----
SELECT avg(price) AS Average_Price
FROM Books
Where Genre='Fantasy';
-----

---q3--
SELECT customer_id,count(Order_id) AS ORDER_COUNT
FROM orders
GROUP BY customer_id
HAVING COUNT(Order_id)>=2;
---

---q5------
SELECT o.Book_id,b.title,COUNT(o.order_id) AS ORDER_COUNT
FROM orders o
JOIN books b ON o.book_id=b.book_id
GROUP BY Book_id,b.title
ORDER BY ORDER_COUNT DESC LIMIT 1;
-----------        

---q6---
SELECT * FROM books
WHERE genre='Fantasy'
ORDER BY price DESC
LIMIT 3;
---
--Q7---
SELECT b.author,SUM(o.quantity) AS Total_book_Sold
FROM orders o
JOIN books b ON o.book_id=b.book_id
GROUP BY b.Author
------

SELECT * FROM Orders;
SELECT * FROM Books;
SELECT * FROM Customers;

---q8---
SELECT DISTINCT c.city,total_amount
FROM orders o 
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.total_amount >= 300;
----------

---q9----
SELECT c.customer_id, c.name, SUM(o.total_amount) AS Total_Spent
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.name
ORDER BY Total_Spent DESC;
----------

-----q10------
SELECT b.book_id, b.title, b.stock, COALESCE(SUM(o.quantity), 0) AS Order_quantity
FROM books b
LEFT JOIN orders o ON b.book_id = o.book_id
GROUP BY b.book_id, b.title, b.stock;