CREATE DATABASE [SQL-5]
USE [SQL-5]
CREATE TABLE CUSTOMERS(
CUSTOMERID INT PRIMARY KEY,
NAME VARCHAR(100),
EMAIL VARCHAR(150)
);
CREATE TABLE PRODUCTS(
PRODUCTID INT PRIMARY KEY,
PRODUCTNAME VARCHAR(100),
PRICE DECIMAL(10,2)
);
CREATE TABLE ORDERS(
ORDERID INT PRIMARY KEY,
CUSTOMERID INT 
FOREIGN KEY(CUSTOMERID) REFERENCES CUSTOMERS(CUSTOMERID),
PRODUCTNAME VARCHAR(100),
ORDERDATE DATE,
QUANTITY INT);

INSERT INTO Customers (CustomerID, Name, Email)
VALUES
(1, 'John Doe', 'johndoe@example.com'),
(2, 'Jane Smith', 'janesmith@example.com'),
(3, 'Robert Johnson', 'robertjohnson@example.com'),
(4, 'Emily Brown', 'emilybrown@example.com'),
(5, 'Michael Davis', 'michaeldavis@example.com'),
(6, 'Sarah Wilson', 'sarahwilson@example.com'),
(7, 'David Thompson', 'davidthompson@example.com'),
(8, 'Jessica Lee', 'jessicalee@example.com'),
(9, 'William Turner', 'williamturner@example.com'),
(10, 'Olivia Martinez', 'oliviamartinez@example.com'),
(11, 'James Anderson', 'jamesanderson@example.com'),
(12, 'Kelly Clarkson', 'kellyclarkson@example.com');

INSERT INTO Products (ProductID, ProductName, Price)
VALUES
(1, 'Product A', 10.99),
(2, 'Product B', 8.99),
(3, 'Product C', 5.99),
(4, 'Product D', 12.99),
(5, 'Product E', 7.99),
(6, 'Product F', 6.99),
(7, 'Product G', 9.99),
(8, 'Product H', 11.99),
(9, 'Product I', 14.99),
(10, 'Product J', 4.99),
(11, 'Product K', 3.99),
(12, 'Product L', 15.99);

INSERT INTO Orders (OrderID, CustomerID, ProductName, OrderDate, Quantity)
VALUES
(1, 1, 'Product A', '2023-07-01', 5),
(2, 2, 'Product B', '2023-07-02', 3),
(3, 3, 'Product C', '2023-07-03', 2),
(4, 4, 'Product A', '2023-07-04', 1),
(5, 5, 'Product B', '2023-07-05', 4),
(6, 6, 'Product C', '2023-07-06', 2),
(7, 7, 'Product A', '2023-07-07', 3),
(8, 8, 'Product B', '2023-07-08', 2),
(9, 9, 'Product C', '2023-07-09', 5),
(10, 10, 'Product A', '2023-07-10', 1),
(11, 11, 'Product D', '2023-07-10', 3),
(12, 12, 'Product E', '2023-07-11', 6),
(13, 5, 'Product G', '2023-07-12', 2),
(14, 4, 'Product H', '2023-07-13', 4),
(15,6, 'Product I', '2023-07-14', 3);

--1. Write a query to retrieve all records from the Customers table..
SELECT * FROM CUSTOMERS

--2. Write a query to retrieve the names and email addresses of customers whose names start with 'J'.
SELECT NAME,EMAIL FROM CUSTOMERS
WHERE NAME LIKE 'J%' 
--Write a query to retrieve the order details (OrderID, ProductName, Quantity) for all orders..
SELECT ORDERID,PRODUCTNAME,QUANTITY FROM ORDERS
--4.Write a query to calculate the total quantity of products ordered.
SELECT SUM(QUANTITY) AS [TOTAL PRODUCTS] FROM ORDERS
--5. Write a query to retrieve the names of customers who have placed an order.
SELECT C.NAME
FROM CUSTOMERS C
INNER JOIN ORDERS O ON
C.CUSTOMERID = O.CUSTOMERID

--6. Write a query to retrieve the products with a price greater than $10.00.
SELECT PRODUCTNAME FROM PRODUCTS
WHERE PRICE > 10.00

--7. Write a query to retrieve the customer name and order date for all orders placed on or after '2023-07-05'.
SELECT C.NAME,O.ORDERDATE 
FROM CUSTOMERS C
INNER JOIN ORDERS O ON
C.CUSTOMERID =  O.CUSTOMERID
WHERE ORDERDATE >= '2023-07-05'
--8. Write a query to calculate the average price of all products.
SELECT AVG(PRICE) AS [AVERAGE PRICE] FROM PRODUCTS
--9. Write a query to retrieve the customer names along with the total quantity of products they have ordered.
SELECT C.NAME,SUM(O.QUANTITY) AS [TOTAL QUANTITY OF PRODUCTS]
FROM CUSTOMERS C
JOIN ORDERS O ON
C.CUSTOMERID = O.CUSTOMERID
GROUP BY C.NAME
--10.	Write a query to retrieve the products that have not been ordered.
SELECT P.PRODUCTNAME 
FROM PRODUCTS P
LEFT JOIN ORDERS O ON
P.PRODUCTNAME = O.PRODUCTNAME
WHERE O.PRODUCTNAME IS NULL

--1.	Write a query to retrieve the top 5 customers who have placed the highest total quantity of orders.
SELECT TOP 5 C.NAME AS CustomerName, SUM(O.QUANTITY) AS TotalQuantityOrdered  
FROM CUSTOMERS C  
INNER JOIN ORDERS O ON C.CUSTOMERID = O.CUSTOMERID  
GROUP BY C.NAME  
ORDER BY TotalQuantityOrdered DESC;
--2.	Write a query to calculate the average price of products for each product category
--3.	Write a query to retrieve the customers who have not placed any orders.
SELECT * FROM CUSTOMERS
SELECT * FROM ORDERS
SELECT * FROM PRODUCTS
SELECT C.NAME 
FROM CUSTOMERS C
LEFT JOIN ORDERS O
ON C.CUSTOMERID = O.CUSTOMERID
WHERE O.ORDERID IS NULL

--4.	Write a query to retrieve the order details (OrderID, ProductName, Quantity) for orders placed by customers whose names start with 'M'.
SELECT O.ORDERID,O.PRODUCTNAME,O.QUANTITY,C.NAME
FROM CUSTOMERS C
INNER JOIN ORDERS O ON 
C.CUSTOMERID = O.CUSTOMERID
WHERE NAME LIKE'M%'

--5.	Write a query to calculate the total revenue generated from all orders.
SELECT SUM(O.QUANTITY * P.PRICE) AS [TOTAL REVENUE]
FROM ORDERS O
INNER JOIN PRODUCTS P
ON O.PRODUCTNAME = P.PRODUCTNAME