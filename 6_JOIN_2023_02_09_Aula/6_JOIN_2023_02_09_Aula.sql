/*---------------------BASE DE DADOS USANDO PostgreeSQL---------------------*/

CREATE DATABASE LIBRARY;

USE LIBRARY;

/*Criar Base de Dados*/
CREATE TABLE books (
  id_book serial PRIMARY KEY,
  title VARCHAR(255),
  author VARCHAR(255)
);

CREATE TABLE copies (
  id_copy INT,
  id_book_copy INT,
  FOREIGN KEY (id_book_copy) REFERENCES books (id_book)
);

CREATE TABLE borrowers (
  id_borrower serial PRIMARY KEY,
  full_name VARCHAR(255),
  rg VARCHAR(10),
  phone VARCHAR(20)
);

CREATE TABLE loans (
  id_loan serial PRIMARY KEY,
  id_copy INTEGER REFERENCES copies (id_copy),
  id_borrower INTEGER REFERENCES borrowers (id_borrower),
  loan_date DATE,
  return_date DATE,
  overdue_days INTEGER,
  fine DECIMAL(10,2)
);

/*Popular a Base de Dados*/
INSERT INTO books 
  (title, author)
VALUES
  ('É assim que começa','Colleen Hoover'),
  ('É assim que acaba','Colleen Hoover');

INSERT INTO copies
  (id_copy, id_book_copy)
VALUES
  (1,3),
  (2,4);

INSERT INTO borrowers (
  (id_copy, id_borrower, loan_date, return_date, overdue_days, fine),
  (1,'Ana Oliveira Lima', '2023-02-10', '2023-02-17', 3, 10.20),
  (1,'Renan Costa Silva', '2023-03-11'.'2023-02-18',0,0),
);
