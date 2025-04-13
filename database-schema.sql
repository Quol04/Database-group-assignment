--GROUP Work Assignment :
-- Create a new database to store bookstore data.
-- Determine the table schema and data types
-- Write the SQL commands to create tables that match the data structure

-- create a new database named BookStoreDB
CREATE DATABASE BookStoreDB;

-- 1. create author table

CREATE TABLE author(
author_id INT PRIMARY KEY AUTO_INCREMENT,
authorName VARCHAR (50),
email VARCHAR(50)
);

-- 2. create book_author table

CREATE TABLE book_author(
bookAuthor_id int PRIMARY KEY AUTO_INCREMENT,
book_id INT,
author_id INT,
FOREIGN KEY(book_id) REFERENCES book (book_id),
FOREIGN KEY(author_id) REFERENCES author (author_id)
);


-- 3. book_language table

CREATE TABLE book_language(
language_id INT PRIMARY KEY AUTO_INCREMENT,
 language VARCHAR(20)
);


-- 4. book table

CREATE TABLE book(
book_id INT PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(50),
language_id INT,
publisher_id INT,
yearPublished DATE,
FOREIGN KEY(language_id) REFERENCES book_language (language_id),
FOREIGN KEY(publisher_id) REFERENCES publisher (publisher_id)
);

-- 5. publisher table

CREATE TABLE publisher(
publisher_id INT PRIMARY KEY AUTO_INCREMENT,
publisherName VARCHAR(50),
phoneNumber INT
);

-- 6. customer table

CREATE TABLE customer(
customer_id INT PRIMARY KEY AUTO_INCREMENT,
customerName VARCHAR(50),
email VARCHAR(50),
age INT,
phoneNumber INT
);

-- 7. customer_address table

 CREATE TABLE customer_address(
customerAddress_id INT PRIMARY KEY AUTO_INCREMENT,
customer_id INT,
address_id INT,
addressStatus_id INT,
FOREIGN KEY(customer_id) REFERENCES customer (customer_id),
FOREIGN KEY(address_id ) REFERENCES address (address_id ),
FOREIGN KEY(addressStatus_id) REFERENCES address_status (addressStatus_id)
);

-- 8. address_status table

CREATE TABLE address_status(
addressStatus_id INT PRIMARY KEY AUTO_INCREMENT,
status VARCHAR(50)
);

-- 9. country table

CREATE TABLE country(
country_id INT PRIMARY KEY AUTO_INCREMENT,
countryName VARCHAR (20)
);

-- 10. address table

CREATE TABLE address(
address_id INT PRIMARY KEY AUTO_INCREMENT,
street VARCHAR(30),
city VARCHAR(20),
zipCode int,
country_id INT ,
FOREIGN KEY(country_id) REFERENCES country (country_id)
);

-- 11. cust_order table

CREATE TABLE cust_order(
order_id INT PRIMARY KEY AUTO_INCREMENT,
customer_id INT,
shipping_id INT,
orderDate DATE,
orderStatus_id INT,
FOREIGN KEY(customer_id) REFERENCES customer (customer_id),
FOREIGN KEY(shipping_id) REFERENCES shipping_method (shipping_id),
FOREIGN KEY(orderStatus_id) REFERENCES order_status (orderStatus_id)
);

-- 12. order_line table

CREATE TABLE order_line(
orderLine_id INT PRIMARY KEY AUTO_INCREMENT,
book_id INT,
order_id INT,
FOREIGN KEY(book_id) REFERENCES book (book_id),
FOREIGN KEY(order_id) REFERENCES cust_order (order_id)
);

-- 13. shipping_method table

CREATE TABLE shipping_method(
shipping_id INT PRIMARY KEY AUTO_INCREMENT,
method VARCHAR(20)
);

-- 14. order_status table

CREATE TABLE order_status(
orderStatus_id INT PRIMARY KEY AUTO_INCREMENT,
orderstatus VARCHAR(30)
);

-- 15. order_history table

CREATE TABLE order_history(
history_id INT PRIMARY KEY AUTO_INCREMENT,
orderHistory VARCHAR(30),
order_id INT,
orderStatus_id INT,
FOREIGN KEY(order_id) REFERENCES cust_order (order_id),
FOREIGN KEY(orderStatus_id) REFERENCES order_status (orderStatus_id)
);