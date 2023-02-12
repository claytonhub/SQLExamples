CREATE TABLE books (
  book_id serial PRIMARY KEY,
  title VARCHAR(255),
  author VARCHAR(255)
);

CREATE TABLE copies (
  copy_id serial PRIMARY KEY,
  book_id INTEGER REFERENCES books (book_id),
  unique(book_id)
);

CREATE TABLE borrowers (
  borrower_id serial PRIMARY KEY,
  full_name VARCHAR(255),
  rg VARCHAR(255),
  phone VARCHAR(255)
);

CREATE TABLE loans (
  loan_id serial PRIMARY KEY,
  copy_id INTEGER REFERENCES copies (copy_id),
  borrower_id INTEGER REFERENCES borrowers (borrower_id),
  loan_date DATE,
  return_date DATE,
  overdue_days INTEGER,
  fine DECIMAL(10,2)
);
