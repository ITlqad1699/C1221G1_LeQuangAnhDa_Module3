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

Insert into customer 
value	('1','Minh Quan','10'),
		('2','Anh Da','20' ),
		('3', 'Thong Nguyen','21');
    
insert into `order` (o_id ,c_id ,o_date )
value 	('1','1','2006-03-21'),
		('2','2','2006-03-23'),
		('3','1','2006-03-16');
    
insert into product
value   ('1','May Giat','3'),
		('2','Tu Lanh','5'),
		('3','Quat','7'),
		('4','Dieu Hoa','1'),
		('5','Bep Dien','2');
    
insert into order_detail
value	('1','1','3'),
		('1','3','7'),
		('1','4','2'),
		('2','1','1'),
		(),
		(),
    

