# 📚 Online Bookstore Database Project (MySQL)

## 📖 Project Overview
This project is a **MySQL-based relational database** designed for an **Online Bookstore**.  
It demonstrates database design, table relationships, and a wide range of SQL queries from basic retrieval to advanced analytical queries.

The database manages:
- Books available in the store
- Customers and their details
- Orders placed by customers

This project is ideal for practicing **SQL, database normalization, joins, aggregation, and real-world query scenarios**.



## 🛠️ Technologies Used
- **Database:** MySQL
- **Language:** SQL
- **Concepts Covered:**
  - Database creation
  - Table design
  - Primary & foreign keys
  - Joins
  - Aggregate functions
  - Subqueries
  - Grouping & filtering



## 🗂️ Database Structure

### 📘 Books Table
| Column Name | Data Type |
|------------|----------|
| Book_Id | INT (Primary Key) |
| Title | VARCHAR(100) |
| Author | VARCHAR(100) |
| Genre | VARCHAR(50) |
| Published_year | INT |
| Price | DECIMAL(10,2) |
| Stock | INT |



### 👤 Customers Table
| Column Name | Data Type |
|------------|----------|
| customer_id | INT (Primary Key) |
| name | VARCHAR(100) |
| Email | VARCHAR(100) |
| Phone | VARCHAR(15) |
| City | VARCHAR(50) |
| Country | VARCHAR(100) |



### 🛒 Orders Table
| Column Name | Data Type |
|------------|----------|
| Order_id | INT (Primary Key) |
| customer_id | INT (Foreign Key) |
| Book_id | INT (Foreign Key) |
| Order_date | DATE |
| Quantity | INT |
| Total_amount | DECIMAL(10,2) |



## 🔗 Table Relationships
- Each **order** is linked to:
  - One **customer**
  - One **book**
- Foreign key constraints ensure **data integrity**



## 📊 SQL Queries Implemented

### 🔹 Basic Queries
- Retrieve all books from a specific genre
- Find books published after a certain year
- List customers from a specific country
- Show orders from a specific month
- Calculate total stock available
- Identify the most expensive and least stocked books



### 🔹 Intermediate Queries
- Customers who ordered more than one quantity
- Orders exceeding a certain total amount
- Distinct genres available
- Total revenue generated from all orders



### 🔹 Advanced Queries
- Total number of books sold per genre
- Average price of books by genre
- Customers who placed multiple orders
- Most frequently ordered book
- Top 3 most expensive books by genre
- Total quantity of books sold by each author
- Cities of customers who spent more than a given amount
- Customer who spent the most overall
- Remaining stock after fulfilling all orders



## 🎯 Key Learning Outcomes
- Designing normalized database schemas
- Writing efficient SQL queries
- Using JOINs for multi-table data analysis
- Applying aggregate functions like `SUM()`, `AVG()`, `COUNT()`
- Understanding real-world database relationships



## 🚀 How to Run the Project
1. Install **MySQL**
2. Open MySQL Workbench or any SQL client
3. Run the SQL script provided in this repository
4. Execute the queries to explore the database



## 📌 Future Improvements
- Add indexes for performance optimization
- Implement stored procedures
- Add triggers to auto-update stock
- Create a front-end interface
- Convert this into a full-stack project



## 👨‍💻 Author
Sunil Singh 


⭐ If you find this project useful, feel free to star the repository!
