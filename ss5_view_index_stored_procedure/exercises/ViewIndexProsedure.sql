DROP DATABASE IF EXISTS demo;
CREATE DATABASE demo;
USE demo;
CREATE TABLE product (
		id INT NOT NULL,
		product_code VARCHAR(45) NOT NULL ,
		product_price DOUBLE,
		product_name VARCHAR(45),
		product_amount INT,
		product_description VARCHAR(100),
		product_status BIT
);
INSERT INTO product 
VALUES 
		(1,'abc123',50,'beer',30,'hyper technycal', 1),
		(2,'abc345',100,'coca',30,'true life ', 0),
		(3,'abc567',100,'pepsi',30,'hyper technycal', 1),
		(4,'abc890',500,'motor',30,'create', 0),
		(5,'abc134',500,'bycicle',30,'new generation', 1);


-- a normal query: 
SELECT * FROM product WHERE product_code = 'abc890';
EXPLAIN SELECT * FROM product WHERE product_code = 'abc890';  
-- create indexs:      
CREATE UNIQUE INDEX code_index ON product(product_code);
SELECT * FROM product WHERE product_code = 'abc890';
EXPLAIN SELECT * FROM product WHERE product_code = 'abc890'; 
ALTER TABLE product ADD INDEX composite_index(product_name,product_price);
EXPLAIN SELECT* FROM product WHERE product_name = 'pepsi' OR product_price = 100;  
-- delete index:
ALTER TABLE product DROP INDEX code_index;
ALTER TABLE product DROP INDEX composite_index;


-- Create view:
CREATE VIEW view_of_product AS 
SELECT product_code, product_price, product_name
FROM product;
SELECT * FROM view_of_product;
-- update view
CREATE OR REPLACE VIEW view_of_product AS 
SELECT id,product_code, product_price, product_name
FROM product;
-- drop view
DROP VIEW view_of_product;


DELIMITER //
drop procedure if exists get_all_info;
create procedure get_all_info()
begin
 select*from product;
end//

call get_all_info;
-- add new product:
DELIMITER //
drop procedure if exists add_new//
create procedure add_new(
IN 		new_id int,
		new_product_code VARCHAR(45)  ,
		new_product_price DOUBLE,
		new_product_name VARCHAR(45),
		new_product_amount INT,
		new_product_description VARCHAR(100),
		new_product_status BIT)
begin
insert into product 
values
(new_id,new_product_code,new_product_price,new_product_name,new_product_amount,new_product_description, new_product_status);
end;//
DELIMITER ;
 call add_new(6,'ACY123','150','computer',10,'vip pro siêu cấp',0);
select * from product;


-- update product follow id:
DELIMITER // 
DROP procedure IF exists update_product//
create procedure update_product(
	IN 	id_update int,
		product_code_update VARCHAR(45)  ,
		product_price_update DOUBLE,
		product_name_update VARCHAR(45),
		product_amount_update INT,
		product_description_update VARCHAR(100),
		product_status_update BIT
 )
begin
		set sql_safe_updates = 0;
		update product 
		set product_code =  product_code_update,
			product_price = product_price_update,
			product_name = product_name_update,
			product_amount = product_amount_update,
			product_description = product_description_update,
			product_status = product_status_update
			where id = id_update;
			set sql_safe_updates = 1;
end;//
DELIMITER ;
call update_product(3,'DXDYAX1234',150,'laptop', 15,'high quality',1);
select * from product;

-- delete product follow id:
DELIMITER // 
DROP procedure IF exists delete_product//
create procedure delete_product(
IN 	id_update_delete int
)
begin
 delete from product where id = id_update_delete;
end;// 
DELIMITER ;
set sql_safe_updates = 0;
call delete_product(3);
set sql_safe_updates = 1;
select * from product;


