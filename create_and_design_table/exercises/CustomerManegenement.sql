DROP DATABASE IF EXISTS customer_manegenement;
CREATE DATABASE customer_manegenement;
USE  customer_manegenement;

CREATE TABLE customer(
c_id 			INT PRIMARY KEY,
c_name 			VARCHAR(50),
c_age 			INT 
);

CREATE TABLE `order`(
o_id 			INT PRIMARY KEY,
c_id 			INT,
 o_date 			DATE,
 o_total_price 	DOUBLE,
FOREIGN KEY (c_id ) REFERENCES customer (c_id )
);

CREATE TABLE product (
p_id				INT PRIMARY KEY,
p_name 			VARCHAR(50),
p_price			DOUBLE
);

CREATE TABLE order_detail(
o_id 			INT,
p_id 			INT,
od_qty			VARCHAR(50),
PRIMARY KEY (o_id , p_id),
FOREIGN KEY (o_id) REFERENCES `Order` (o_id),
FOREIGN KEY (p_id) REFERENCES  Product (p_id)
);


