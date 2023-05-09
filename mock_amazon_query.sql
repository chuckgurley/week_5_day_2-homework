CREATE TABLE Product (
  product_id SERIAL PRIMARY KEY,
  name VARCHAR(50),
  price NUMERIC(4,2),
  inventory INTEGER
 
);

CREATE TABLE Customer (
  customer_id SERIAL PRIMARY KEY,
  address VARCHAR(50),
  phone_number VARCHAR(20),
  email VARCHAR(30),
  username VARCHAR(25)
  
);

CREATE TABLE Seller (
  seller_id SERIAL PRIMARY KEY,
  name VARCHAR(150),
  seller_address VARCHAR(150),
  zipcode VARCHAR(20),
  city VARCHAR(100),
  state VARCHAR(50)
  
);

CREATE TABLE Cart (
  cart_id SERIAL PRIMARY KEY,
  quantity INTEGER,
  total NUMERIC(6,2),
  paid BOOLEAN,
  customer_id INTEGER,
  FOREIGN KEY(customer_id) REFERENCES Customer(customer_id)
);

CREATE TABLE "Order" (
  order_id SERIAL PRIMARY KEY,
  order_date DATE,
  shipped BOOLEAN,
  refunded BOOLEAN,
  return_date DATE,
  quantity INTEGER,
  cart_id INTEGER,
  FOREIGN KEY (cart_id) REFERENCES Cart(cart_id)
);

CREATE TABLE Payment_Info (
  payment_id SERIAL PRIMARY KEY,
  card_inumber VARCHAR(50),
  expiry VARCHAR(15),
  security_code INTEGER,
  card_name VARCHAR(50),
  card_address VARCHAR(50),
  zipcode VARCHAR(20),
  city VARCHAR(50),
  state VARCHAR(50),
  customer_id INTEGER, 
  FOREIGN KEY(customer_id) REFERENCES Customer(customer_id)
);

CREATE TABLE Delivery (
  delivery_id SERIAL PRIMARY KEY,
  est_delivery_date DATE,
  package_service VARCHAR(150),
  tracking_number INTEGER,
  order_id INTEGER,  
  FOREIGN KEY(order_id) REFERENCES "Order"(order_id)
);



CREATE TABLE Rating (
  rating_id SERIAL PRIMARY KEY,
  product_rating INTEGER,
  review VARCHAR(500),
  seller_rating INTEGER,
  product_id INTEGER,
  seller_id INTEGER,
  FOREIGN KEY(product_id) REFERENCES Product(product_id),
  FOREIGN KEY(seller_id) REFERENCES Seller(seller_id)
  );

CREATE TABLE Product_Cart (
  product_id INTEGER PRIMARY KEY,
  cart_id INTEGER,
  prod_cart_id SERIAL,
  FOREIGN KEY (cart_id)
  REFERENCES Cart(cart_id),
  FOREIGN KEY (product_id)
  REFERENCES Product(product_id)
);

CREATE TABLE prod_seller (
  prod_seller_id SERIAL PRIMARY KEY,
  product_id INTEGER,
  seller_id INTEGER,
  FOREIGN KEY (seller_id)
  REFERENCES Seller(seller_id),
  FOREIGN KEY (product_id)
  REFERENCES Product(product_id)
);

ALTER TABLE "Order" RENAME TO "order";









