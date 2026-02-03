-- creating database
CREATE DATABASE IF NOT EXISTS onlineBookstore;

USE  onlineBookstore;

-- creating table
CREATE TABLE Books (
	Book_Id INT PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Published_year INT,
    Price NUMERIC(10,2),
    Stock int
);


DROP TABLE IF EXISTS customers;
CREATE TABLE customers(
	customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),
    Country VARCHAR(100)
);
drop table if exists orders;
CREATE TABLE Orders (
	Order_id INT PRIMARY KEY,
    customer_id INT, 
    Book_id INT ,
    Order_date DATE,
    Quantity INT,
    Total_amount DECIMAL(10,2),
    CONSTRAINT fk_custm FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    CONSTRAINT fk_bk FOREIGN KEY (Book_id) REFERENCES Books(Book_id)
);

select * from Books;
SELECT * FROM customers;
SELECT * FROM orders;


-- 1) Retrieve all books in the "fiction" genre.
SELECT * FROM books
WHERE Genre = "Fiction";

-- 2) find books published after the year 1950.
SELECT * FROM books 
WHERE Published_year > 1950;


-- 3) List all the customer from the canada. 
SELECT * FROM customers
WHERE Country = "canada";

-- 4) Show orders placed in november 2023. 
SELECT * FROM orders
where order_date BETWEEN  "2023-11-01" AND "2023-11-30";

-- 5) Retrieve the total stck of book avilable:
SELECT SUM(stock) as total_stock
 from books;

-- 6) Find the details of most expensive book:
SELECT Title,
 max(Price)  FROM books;

select * from books
order by price desc
LIMIT 1;

-- 7) Show all customers who orderd more than 1 quantity of a book:

SELECT * FROM orders
where Quantity >1;

-- 8) Retrieve all orders where the total amount exceeds $20:
SELECT * FROM orders
where Total_amount > 20;

-- 9) list all genres avilable in the book table;
SELECT DISTINCT(Genre) from books;

-- 10) Find the book with the lowest stock:

SELECT * FROM books
ORDER BY stock 
LIMIT 2;

-- 11) Calculate the total revenue generated from all orders:
select sum(total_amount) as total_revenue
FROM orders;


-- Advance questions
-- 1) Retrieve the total number of books sold for each genre;
SELECT b.Genre, SUM(o.Quantity) AS total_sold_books
FROM Books as b
JOIN orders as o
ON b.Book_id = o.Book_id
GROUP BY b.Genre;

-- 2) Find the average price of book in the "Fantasy" genre:
SELECT AVG(Price) AS average_price
FROM Books
WHERE Genre = "Fantasy";

-- 3) List customers who placed at leased 2 orders:
SELECT c.customer_id, c.name, COUNT(o.order_id) as order_count
from orders as o
join customers as c
on c.customer_id = o.customer_id
GROUP BY c.customer_id
HAVING COUNT(o.order_id) >=2;


SELECT customer_id, COUNT(order_id)
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) >=2;


-- 4) Find the most frequently orderd book:
SELECT b.book_id, b.Title, COUNT( o.order_id) AS orderd_count
FROM orders AS o
JOIN books  AS b
ON b.book_id = o.book_id
GROUP BY b.BOOK_ID
ORDER BY orderd_count DESC
LIMIT 1;


-- 5) Show the top 3 expensive books of "fantasy" genre:
SELECT * FROM books
WHERE genre = "fantasy"
ORDER BY Price DESC
LIMIT 3;


-- 6) Retrieve the total quentity of books sold by each author;
select b.author,SUM(o.Quantity) 
from orders as o
join books as b
on o.book_id = b.book_id
group by b.author;


-- 7) List the cities where customers who spent over $30 are located:
select distinct (c.city) , o.total_amount
from orders as o
join customers as  c
on o.customer_id = c.customer_id
where total_amount >30;


-- 8) find the customers who spent the most on orders:
select c.customer_id, c.name, sum(o.total_amount) as total_spent
from orders as o
join customers as c
on o.customer_id = c.customer_id
group by c.customer_id
order by total_spent desc
limit 1;



-- 9) Calculate the stock remaining after fulfiling all orders:
select b.book_id, b.title, b.stock, coalesce(sum(o.quantity),0) as order_quantity,
b.stock - coalesce(sum(o.quantity),0) as remaininig_quantity
from books as b
left join orders as o
on b.book_id = o.book_id
group by b.book_id;