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
od_qty			INT(50),
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
		('3','1','8'),
		('2','5','4'),
		('2','3','3');
        
#Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select o_id ,c_id ,o_date from `order`;

#Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select c_name, p_name, od_qty From customer 
join `order` on customer.c_id = `order`.c_id
join order_detail on `order`.o_id = order_detail.o_id
join product on order_detail.p_id = product.p_id;

#Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select c_name From  customer 
left join `order` on  customer.c_id = `order`.c_id
where `order`.c_id is null ;

#Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
select `order`.o_id, o_date, sum(od_qty*p_price	) as `toal` from 
`order` join  order_detail on `order`.o_id = order_detail.o_id 
join product on order_detail.p_id = product.p_id
group by `order`.o_id;
