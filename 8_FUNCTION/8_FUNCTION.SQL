/*---------------------BASE DE DADOS USANDO PostgreSQL---------------------*/
CREATE DATABASE MEGASTORE;

USE MEGASTORE;


/*Criar Base de Dados*/
CREATE TABLE sales (
    sale_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    purchase_date DATE NOT NULL,
    quantity INTEGER NOT NULL
);

/*Popular a Base de Dados*/ 
INSERT INTO sales 
(product_name, purchase_date, quantity)
VALUES 
('Product A', '2023-02-01', 10),
('Product B', '2023-02-02', 10),
('Product C', '2023-02-03', 10),
('Product D', '2023-02-04', 10),
('Product E', '2023-02-05', 10);

/*Usar Function*/ 
CREATE FUNCTION count_customers_ondate(target_date DATE)
RETURNS INTEGER AS $$
BEGIN
    RETURN (SELECT COUNT(DISTINCT purchase_date) FROM sales WHERE purchase_date = target_date);
END;
$$ LANGUAGE plpgsql;