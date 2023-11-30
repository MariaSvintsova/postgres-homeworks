-- SQL-команды для создания таблиц
-- DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS orders CASCADE;
DROP TABLE IF EXISTS customers CASCADE;
DROP TABLE IF EXISTS employees CASCADE;

CREATE TABLE employees
(
	employee_id int PRIMARY KEY,
	first_name text,
	last_name text,
	title varchar(250) NOT NULL,
	birth_date text,
	notes text
);
SELECT * FROM employees;



CREATE TABLE IF NOT EXISTS customers
(
	customer_id TEXT PRIMARY KEY,
	company_name VARCHAR(250) NOT NULL,
	contact_name VARCHAR(250) NOT NULL
);
SELECT * FROM customers;

CREATE TABLE orders
(
	order_id int PRIMARY KEY,
	customer_id text REFERENCES customers(customer_id) NOT NULL,
	employee_id int REFERENCES employees(employee_id) NOT NULL,
	order_date varchar(250) NOT NULL,
	ship_city text
);
SELECT * FROM orders;