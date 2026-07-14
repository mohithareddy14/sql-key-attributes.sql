
create database salesdb;
use salesdb;
show databases;
create table customers(
customer_id int primary key,
name varchar(100),
email varchar(100),
address varchar(225));

create table products(
product_id int primary key,
product_name varchar(100),
price decimal(10,2),
description varchar(225));

create table orders(
order_id int primary key,
customer_id int,
product_id int,
order_date int,
total_cost decimal(10,2),
foreign key (customer_id) references customers(customer_id),
foreign key (product_id) references products(Product_id));


insert into customers values
(1,'Geetha','geetha@gmail.com','Hyderabad'),
(2,'Yegna','yegna@gmail.com','Bangalore'),
(3,'Poojitha','poojitha@gmail.com','Chennai'),
(4,'Greeshma','greeshma@gmail.com','Mumbai'),
(5,'Mohitha','mohitha@gmail.com','Delhi');

insert into products values
(101,'Laptop',60000,'Gaming Laptop'),
(102,'Phone',15000,'Smartphone'),
(103,'Headphones',5000,'Wireless'),
(104,'keyboard',1500,'Mechanical'),
(105,'Mouse',800,'Wireless Mouse');

alter table orders
modify order_date date;

insert into orders values
(1, 1, 101, '2025-01-10', 60000),
(2, 2, 102, '2025-01-11', 20000),
(3, 3, 103, '2025-01-12', 2000),
(4, 1, 104, '2025-01-13', 1500),
(5, 4, 105, '2025-01-14', 800);


SELECT *
FROM orders o
JOIN products p ON o.product_id = p.product_id
JOIN customers c ON o.customer_id = c.customer_id
WHERE c.name = 'Geetha';

SELECT p.product_name, SUM(o.total_cost) AS total_sales
FROM orders o
JOIN products p ON o.product_id = p.product_id
WHERE p.product_name = 'Laptop'
GROUP BY p.product_name;
