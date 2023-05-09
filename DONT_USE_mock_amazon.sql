DONT USE THIS ONE PLEASE DONT USE IT
PLEEEEEEEEEASE NO
CREATE TABLE "Product" (
  "product_id" SERIAL,
  "name" VARCHAR(50),
  "price" NUMERIC(4,2),
  "inventory" INTEGER,
  PRIMARY KEY ("product_id")
);

CREATE TABLE "Customer" (
  "customer_id" SERIAL,
  "address" VARCHAR(50),
  "phone_number" VARCHAR(20),
  "email" VARCHAR(30),
  "username" VARCHAR(25),
  PRIMARY KEY ("customer_id")
);

CREATE TABLE "Cart" (
  "cart_id" SERIAL,
  "quantity" INTEGER,
  "total" NUMERIC(6,2),
  "paid" BOOLEAN,
  "customer_id" INTEGER,
  PRIMARY KEY ("cart_id"),
  CONSTRAINT "FK_Cart.customer_id"
    FOREIGN KEY ("customer_id")
      REFERENCES "Customer"("customer_id")
);

CREATE TABLE "Order" (
  "order_id" SERIAL,
  "order_date" DATE,
  "shipped" BOOLEAN,
  "refunded" BOOLEAN,
  "return_date" DATE,
  "quantity" INTEGER,
  "cart_id" INTEGER,
  PRIMARY KEY ("order_id")
);

CREATE TABLE "Payment_Info" (
  "payment_id" SERIAL,
  "card_inumber" VARCHAR(50),
  "expiry" VARCHAR(15),
  "security_code" INTEGER,
  "card_name" VARCHAR(50),
  "card_address" VARCHAR(50),
  "zipcode" VARCHAR(20),
  "city" VARCHAR(50),
  "state" VARCHAR(50),
  "customer_id" INTEGER,
  PRIMARY KEY ("payment_id"),
  CONSTRAINT "FK_Payment_Info.customer_id"
    FOREIGN KEY ("customer_id")
      REFERENCES "Customer"("customer_id")
);

CREATE TABLE "Delivery" (
  "delivery_id" SERIAL,
  "est_delivery_date" DATE,
  "package_service" VARCHAR(150),
  "tracking_number" INTEGER,
  "order_id" INTEGER,
  PRIMARY KEY ("delivery_id")
);

CREATE TABLE "Seller" (
  "seller_id" SERIAL,
  "name" VARCHAR(150),
  "seller_address" VARCHAR(150),
  "zipcode" VARHCHAR(20),
  "city" VARCHAR(100),
  "state" VARCHAR(50),
  PRIMARY KEY ("seller_id")
);

CREATE TABLE "Rating" (
  "rating_id" SERIAL,
  "product_rating" INTEGER,
  "review" VARCHAR(500),
  "seller_rating" INTEGER,
  "product_id" INTEGER,
  "seller_id" INTEGER,
  PRIMARY KEY ("rating_id"),
  CONSTRAINT "FK_Rating.product_id"
    FOREIGN KEY ("product_id")
      REFERENCES "Product"("product_id"),
  CONSTRAINT "FK_Rating.seller_id"
    FOREIGN KEY ("seller_id")
      REFERENCES "Seller"("seller_id")
);

CREATE TABLE "Product_Cart" (
  "product_id" INTEGER,
  "cart_id" INTEGER,
  "prod_cart_id" SERIAL,
  PRIMARY KEY ("prod_cart_id"),
  CONSTRAINT "FK_Product_Cart.cart_id"
    FOREIGN KEY ("cart_id")
      REFERENCES "Cart"("cart_id"),
  CONSTRAINT "FK_Product_Cart.product_id"
    FOREIGN KEY ("product_id")
      REFERENCES "Product"("product_id")
);

CREATE TABLE "prod_seller" (
  "prod_seller_id" SERIAL,
  "product_id" INTEGER,
  "seller_id" INTEGER,
  PRIMARY KEY ("prod_seller_id"),
  CONSTRAINT "FK_prod_seller.seller_id"
    FOREIGN KEY ("seller_id")
      REFERENCES "Seller"("seller_id"),
  CONSTRAINT "FK_prod_seller.product_id"
    FOREIGN KEY ("product_id")
      REFERENCES "Product"("product_id")
);






