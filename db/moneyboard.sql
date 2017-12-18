DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS vendors;


CREATE TABLE vendors(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE categories(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE transactions(
  id SERIAL4 PRIMARY KEY,
  category_id INT4 REFERENCES categories(id),
  vendor_id INT4 REFERENCES vendors(id),
  amount DECIMAL(10,2)
);
