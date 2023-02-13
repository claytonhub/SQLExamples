/*---------------------BASE DE DADOS USANDO PostgreSQL---------------------*/
CREATE DATABASE MEGASTORE;

USE MEGASTORE;

/*Criar Base de Dados*/
CREATE TABLE customer (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    age INT NOT NULL
);

CREATE TABLE product (
    id SERIAL PRIMARY KEY,
    item VARCHAR NOT NULL,
    brand VARCHAR NOT NULL
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    CONSTRAINT fk_customer_id FOREIGN KEY (customer_id) REFERENCES customer (id),
    CONSTRAINT fk_product_id FOREIGN KEY (product_id) REFERENCES product (id)
);

/*Popular a Base de Dados*/ 
INSERT INTO customer 
    (first_name, last_name, age)
VALUES
    ('Sarah', 'Johnson', 35),
    ('Michael', 'Smith', 42),
    ('Jessica', 'Brown',29),
    ('David', 'Davis',31),
    ('Rachel', 'Wilson',26);

INSERT INTO product 
    (item, brand)
VALUES
    ('Laptops', 'Dell'),
    ('Cell Phones', 'Apple'),
    ('Televisions', 'Samsung'),
    ('Headphones', 'Bose'),
    ('Cameras', 'Canon');

INSERT INTO orders
    (customer_id, product_id, quantity)
VALUES
    (1, 1, 1),
    (2, 2, 2),
    (3, 3, 3),
    (4, 4, 4),
    (5, 5, 5);


/*Consultas a Base de Dados*/  
SELECT *
FROM orders
INNER JOIN customer
ON orders.customer_id = customer.id;

SELECT *
FROM orders
RIGHT JOIN customer
ON orders.customer_id = customer.id;

SELECT *
FROM orders
RIGHT JOIN customer
ON orders.customer_id = customer.id
WHERE orders.id IS NULL;

SELECT orders.id AS Orders, orders.quantity, customer.id AS Customer, customer.first_name
FROM orders
JOIN customer
ON orders.id = customer.id;

SELECT *
FROM orders
RIGHT JOIN customer
ON customer_id = customer.id
LEFT JOIN product
ON product_id = product.id;

SELECT customer.first_name, customer.last_name, customer.id 
FROM orders
RIGHT JOIN customer
ON customer_id = customer.id
LEFT JOIN product
ON product_id = product.id;

SELECT customer.id AS Customer, customer.first_name, customer.last_name, orders.id AS Order, orders.quantity, product.item
FROM orders
RIGHT JOIN customer
ON customer_id = customer.id
LEFT JOIN product
ON product_id = product.id;
