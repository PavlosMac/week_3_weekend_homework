DROP TABLE Tickets;
DROP TABLE Films;
DROP TABLE Customers;

CREATE TABLE films(
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(255),
  price FLOAT
);

CREATE TABLE customers(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  funds FLOAT
);

CREATE TABLE tickets(
  id SERIAL4 PRIMARY KEY,
  film_id INT4 references films(id) ON DELETE CASCADE,
  customer_id INT4 references customers(id) ON DELETE CASCADE
);

