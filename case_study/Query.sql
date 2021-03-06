USE furama_resort;

#2: Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
SELECT ho_ten FROM nhan_vien WHERE nhan_vien.ho_ten REgexp '^[HKT]' and LENGTH(ho_ten) <= 15;

#3: Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
SELECT*FROM khach_hang kh WHERE((CURDATE() - kh.ngay_sinh) BETWEEN 180000 AND 500000) AND (kh.dia_chi LIKE '%đà nẵng' or kH.dia_chi like '%quảng trị');

#4: Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
SELECT khach_hang.*,COUNT(khach_hang.ma_khach_hang) AS so_lan_dat_phong 
FROM khach_hang JOIN hop_dong ON khach_hang.ma_khach_hang = hop_dong.ma_khach_hang 
GROUP BY khach_hang.ma_khach_hang 
havinG khach_hang.ma_loai_khach = 1 
ORDER BY so_lan_dat_phong ASC;

#5: hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien (với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
SELECT khach_hang.ma_khach_hang, khach_hang.ho_ten, loai_khach.ten_loai_khach, hop_dong.ma_hop_dong, dich_vu.ten_dich_vu,hop_dong.ngay_lam_hop_dong, hop_dong.ngay_ket_thuc, SUM(COALESCE(hop_dong_chi_tiet.so_luong*dich_vu_di_kem.gia,0)+dich_vu.chi_phi_thue) as tong_tien  fROM khach_hang
LEFT JOIN loai_khach On loai_khach.ma_loai_khach = khach_hang.ma_loai_khach  
lEFT JOIN hop_dong  On khach_hang.ma_khach_hang = hop_dong.ma_khach_hang 
left join dich_vu ON dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
LEFT JOiN hop_dong_chi_tiet ON hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
LEfT JOIN dich_vu_di_kem ON dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
GROUP BY hop_dong.ma_hop_dong, khach_hang.ma_khach_hang
ORDER BY khach_hang.ma_khach_hang, hop_dong.ma_hop_dong dESC
;

#6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).
SELECT dich_vu.ma_dich_vu, dich_vu.ten_dich_vu, dich_vu.dien_tich, dich_vu.chi_phi_thue,loai_dich_vu.ten_loai_dich_vu ,hop_dong.ngay_lam_hop_dong, hop_dong.ngay_ket_thuc 
FROM hop_dong
RIGHT JOIN dich_vu ON dich_vu.ma_dich_vu = hop_dong.ma_dich_vu  
LEFT JOIN loai_dich_vu ON loai_dich_vu.ma_loai_dich_vu = dich_vu.ma_loai_dich_vu
GROUP BY dich_vu.ma_dich_vu
HAVING dich_vu.ma_dich_vu NOT IN ( 
SELECT ma_dich_vu 
FROM hop_dong 
WHERE(hop_dong.ngay_lam_hop_dong BETWEEN '2021-01-01' AND '2021-03-31')
OR (hop_dong.ngay_ket_thuc BETWEEN '2021-01-01' AND '2021-03-31'));

#7. Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.
SELECT dich_vu.ma_dich_vu, dich_vu.ten_dich_vu, dich_vu.dien_tich, dich_vu.chi_phi_thue,loai_dich_vu.ten_loai_dich_vu,hop_dong.ngay_lam_hop_dong, hop_dong.ngay_ket_thuc
FROM hop_dong
RIGHT JOIN dich_vu ON dich_vu.ma_dich_vu = hop_dong.ma_dich_vu  
LEFT JOIN loai_dich_vu ON loai_dich_vu.ma_loai_dich_vu = dich_vu.ma_loai_dich_vu
GROUP BY dich_vu.ma_dich_vu
HAVING YEAR(hop_dong.ngay_ket_thuc) = 2020 
AND 
dich_vu.ma_dich_vu NOT IN(
SELECT ma_dich_vu 
FROM hop_dong 
WHERE hop_dong.ngay_ket_thuc 
BETWEEN '2021-01-01' AND '2021-12-31' ) ; 

#8: hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
# Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên
#cách 1:
SELECT DISTINCT khach_hang.ho_ten FROM khach_hang;
#cách 2:
sELECT  khach_hang.Ho_ten fROM khach_hang 
uNION
sELECT  khach_hang.Ho_ten fROM khach_hang;
#cách 3:
seLECT Khach_hang.hO_ten frOM Khach_hang
grOUP By Khach_hang.hO_ten;

#9 Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
SELECT MONTH(hop_dong.ngay_lam_hop_dong) AS thang, COUNt(khach_hang.ma_loai_khach) as so_khach
FROM khach_hang 
LEFT JOIN hop_dong  on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang 
WHERE  YEAR(hop_dong.ngay_lam_hop_dong) = 2021
GROUP BY MONTH(hop_dong.ngay_lam_hop_dong)
ORDER BY MONTH(hop_dong.ngay_lam_hop_dong);

#10 Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
SELECt hop_dong.ma_hop_dong, hop_dong.ngay_lam_hop_dong, hop_dong.ngay_ket_thuc, hop_dong.tien_dat_coc, SUM(CoALESCE(hop_dong_chi_tiet.so_luong,0)) AS so_luong_dich_vu_di_kem
FROM hop_dong 
LEFT JOIN hop_dong_chi_tiet ON hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
GROUP BY hop_dong.ma_hop_dong;

#11	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
SELECT dich_vu_di_kem.ma_dich_vu_di_kem, ten_dich_vu_di_kem, loai_khach.ten_loai_khach, khach_hang.ma_khach_hang FROM khach_hang
LEfT join loai_khach ON loai_khach.ma_loai_khach = khach_hang.ma_loai_khach  
iNNER JOIN hop_dong  ON khach_hang.ma_khach_hang = hop_dong.ma_khach_hang 
INNER JOiN hop_dong_chi_tiet ON hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
INNER JOIN dich_vu_di_kem ON dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
WHERE khach_hang.ma_loai_khach = 1 AND (khach_hang.dia_chi LIKE '%Vinh' or khach_hang.dia_chi LIKE '%Quảng Ngãi' )
oRdER BY MA_dich_vu_di_kem;

#12	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
SELECT hop_dong.ma_hop_dong, nhan_vien.ho_ten, khach_hang.ho_ten, khach_hang.so_dien_thoai,dich_vu.ten_dich_vu,SUM(COALESCE(hop_dong_chi_tiet.so_luong,0)) AS so_luong_dich_vu_di_kem, hop_dong.tien_dat_coc 
FROM khach_hang 
LEFT JOIN hop_dong  ON khach_hang.ma_khach_hang = hop_dong.ma_khach_hang 
LEFT JOIN nhan_vien ON nhan_vien.ma_nhan_vien = hop_dong.ma_nhan_vien
LEFT JOIN dich_vu ON dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
LEFT JOIN hop_dong_chi_tiet ON hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
LEFT JOIN dich_vu_di_kem ON dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
WHERE (hop_dong.ngay_lam_hop_dong BETWEEN '2020-10-01' AND '2020-12-31') AND (hop_dong.ngay_lam_hop_dong NOT BETWEEN '2021-01-01' AND '2021-06-30')
GROUP BY hop_dong.ma_hop_dong;

#13 Hiển thị thông tin các dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
SELECT hop_dong_chi_tiet.ma_dich_vu_di_kem, dich_vu_di_kem.ten_dich_vu_di_kem,SUM(hop_dong_chi_tiet.so_luong) AS so_luong_dich_vu_di_kem
FROM hop_dong_chi_tiet 
JOIN dich_vu_di_kem ON hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
GROUP BY hop_dong_chi_tiet.ma_dich_vu_di_kem
HAVING so_luong_dich_vu_di_kem = (SELECT SUM(so_luong) FROM hop_dong_chi_tiet GROUP BY ma_dich_vu_di_kem ORDER BY SUM(so_luong) DESC LIMIT 1);

#14	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).
SELECT hop_dong.ma_hop_dong, loai_dich_vu.ten_loai_dich_vu, dich_vu_di_kem.ten_dich_vu_di_kem, COUNT(hop_dong_chi_tiet.ma_dich_vu_di_kem) AS so_lan_su_dung
FROM hop_dong 
LEFT JOIN dich_vu ON hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
LEFT JOIN loai_dich_vu ON loai_dich_vu.ma_loai_dich_vu = dich_vu.ma_loai_dich_vu
LEFT JOIN hop_dong_chi_tiet ON hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
LEFT JOIN dich_vu_di_kem ON dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
GROUP BY hop_dong_chi_tiet.ma_dich_vu_di_kem 
HAVING so_lan_su_dung = 1
ORDER BY hop_dong.ma_hop_dong;

#15 Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.
select nhan_vien.ma_nhan_vien, nhan_vien.ho_ten, trinh_do.ten_trinh_do, bo_phan.ten_bo_phan, nhan_vien.so_dien_thoai, nhan_vien.dia_chi
from nhan_vien 
left join trinh_do on trinh_do.ma_trinh_do = nhan_vien.ma_trinh_do
left join bo_phan on bo_phan.ma_bo_phan = nhan_vien.ma_bo_phan
left join hop_dong on hop_dong.ma_nhan_vien = nhan_vien.ma_nhan_vien
group by nhan_vien.ma_nhan_vien
having count(hop_dong.ma_nhan_vien) in (1,2,3);

#16	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
-- tạo ra view giả để lấy trường dữ liệu:
#cách 1:
drop view if exists view_nhan_vien ;
create view view_nhan_vien as 
select nhan_vien.ma_nhan_vien
	from nhan_vien 
	left join hop_dong on hop_dong.ma_nhan_vien = nhan_vien.ma_nhan_vien
	group by nhan_vien.ma_nhan_vien 
	having count(hop_dong.ma_nhan_vien) = 0;
select * from view_nhan_vien;
--  hàm xóa nhân viên 
DELIMITER // 
drop procedure if exists delete_nhan_vien//
create procedure delete_nhan_vien()
begin
	set sql_safe_updates = 0;
	delete from nhan_vien 
    where ma_nhan_vien in  (select*from view_nhan_vien);
    set sql_safe_updates = 1;
end;//
DELIMITER ;

call delete_nhan_vien;

#cách 2:
delete from nhan_vien
where nhan_vien.ma_nhan_vien not in (	
	select ma_nhan_vien from (
		select distinct nhan_vien.ma_nhan_vien
		from  nhan_vien
		join hop_dong on hop_dong.ma_nhan_vien = nhan_vien.ma_nhan_vien
		where year(hop_dong.ngay_lam_hop_dong) between '2019' and '2021') as table_nhan_vien_gia);

-- test lại nào anh em: 
select nhan_vien.ma_nhan_vien, nhan_vien.ho_ten
	from nhan_vien 
	left join hop_dong on hop_dong.ma_nhan_vien = nhan_vien.ma_nhan_vien
	group by nhan_vien.ma_nhan_vien 
	having count(hop_dong.ma_nhan_vien) > 0;
    
#17	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ
DROP VIEW IF EXISTS view_tong_tien;
CREATE VIEW view_tong_tien AS 
SELECT khach_hang.ma_khach_hang FROM khach_hang
LEFT JOIN loai_khach ON loai_khach.ma_loai_khach = khach_hang.ma_loai_khach  
LEFT JOIN hop_dong  ON khach_hang.ma_khach_hang = hop_dong.ma_khach_hang 
LEFT JOIN dich_vu ON dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
LEFT JOIN hop_dong_chi_tiet ON hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
LEFT JOIN dich_vu_di_kem ON dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
WHERE YEAR(hop_dong.ngay_lam_hop_dong) = 2021 AND khach_hang.ma_loai_khach = 2
GROUP BY  hop_dong.ma_hop_dong,khach_hang.ma_khach_hang
HAVING SUM(COALESCE(hop_dong_chi_tiet.so_luong*dich_vu_di_kem.gia,0)+dich_vu.chi_phi_thue)> 10000000;
set sql_safe_updates = 0;
update khach_hang
set khach_hang.ma_loai_khach = 1 where ma_khach_hang in (select*from view_tong_tien);
set sql_safe_updates = 1;
select khach_hang.ho_ten, loai_khach.ten_loai_khach 
from khach_hang join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach 
where khach_hang.ma_khach_hang = 10;


-- DELIMITER //
-- drop procedure if exists update_loai_khach//
-- create procedure update_loai_khach()
-- begin
-- 	set sql_safe_updates = 0;
-- 	update khach_hang
--     set khach_hang.ma_loai_khach = 1 where ma_khach_hang in (select*from view_tong_tien);
-- 	set sql_safe_updates = 1;
-- end;//
-- DELIMITER ;
 

#18 Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
-- cách 1:
drop view if exists view_khach_hang;
create view view_khach_hang as
SELECT  khach_hang.ma_khach_hang
FROM khach_hang 
LEFT JOIN hop_dong  ON khach_hang.ma_khach_hang = hop_dong.ma_khach_hang 
where year(hop_dong.ngay_ket_thuc) <> 2021
GROUP BY khach_hang.ma_khach_hang;

DELIMITER // 
drop procedure if exists delete_khach_hang//
create procedure delete_khach_hang()
begin
	set sql_safe_updates = 0;
	set foreign_key_checks=0;
	delete from khach_hang 
    where khach_hang.ma_khach_hang in  (select*from view_khach_hang);
	set foreign_key_checks=1;
    set sql_safe_updates = 1;
end;//
DELIMITER ;

call delete_khach_hang;

select*from khach_hang;


-- cách 2:
ALTER TABLE hop_dong
    DROP FOREIGN KEY fk_ma_khach_hang;
ALTER TABLE hop_dong
    ADD CONSTRAINT fk_ma_khach_hang FOREIGN KEY (ma_khach_hang) REFERENCES khach_hang (ma_khach_hang) ON DELETE SET NULL;
delete khach_hang
FROM khach_hang 
JOIN hop_dong ON khach_hang.ma_khach_hang = hop_dong.ma_khach_hang 
where year(hop_dong.ngay_ket_thuc) < 2021;



#19	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
-- bước 1:
DROP VIEW IF EXISTS view_dich_vu_chi_tiet;
CREATE VIEW view_dich_vu_chi_tiet AS
SELECT dich_vu_di_kem.ma_dich_vu_di_kem
FROM hop_dong JOIN hop_dong_chi_tiet ON hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong 
JOIN dich_vu_di_kem ON hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
WHERE so_luong >= 10 AND YEAR(hop_dong.ngay_ket_thuc) = 2020
GROUP BY dich_vu_di_kem.ma_dich_vu_di_kem; 
-- bước 2:
DELIMITER //
DROP PROCEDURE IF EXISTS update_dich_vu_di_kem//
CREATE PROCEDURE update_dich_vu_di_kem()
BEGIN
	SET sql_safe_updates = 0;
	UPDATE dich_vu_di_kem
    SET dich_vu_di_kem.gia = dich_vu_di_kem.gia*2 WHERE ma_dich_vu_di_kem IN (SELECT*FROM view_dich_vu_chi_tiet);
	SET sql_safe_updates = 1;
END;//
DELIMITER ;
-- bước 3:
CALL  update_dich_vu_di_kem;
-- bước 4:
SELECT * FROM dich_vu_di_kem;

#20 Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
SELECT nhan_vien.ma_nhan_vien, nhan_vien.ho_ten, nhan_vien.email, nhan_vien.so_dien_thoai, nhan_vien.ngay_sinh, nhan_vien.dia_chi FROM nhan_vien
UNION 
SELECT khach_hang.ma_khach_hang, khach_hang.ho_ten, khach_hang.email, khach_hang.so_dien_thoai, khach_hang.ngay_sinh, khach_hang.dia_chi FROM khach_hang;

#21
#22
#23 Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó với ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang.
DELIMITER // 
DROP PROCEDURE IF EXISTS delete_khach_hang_co_tham_so//
CREATE PROCEDURE delete_khach_hang_co_tham_so(IN ma_khach_hang_muon_xoa INT)
BEGIN
	ALTER TABLE hop_dong
    DROP FOREIGN KEY fk_ma_khach_hang;
	ALTER TABLE hop_dong
    ADD CONSTRAINT fk_ma_khach_hang FOREIGN KEY (ma_khach_hang) REFERENCES khach_hang (ma_khach_hang) ON DELETE SET NULL;
	DELETE FROM khach_hang 
    WHERE ma_khach_hang_muon_xoa = khach_hang.ma_khach_hang;
END;//
DELIMITER ;
CALL delete_khach_hang_co_tham_so(4);
SELECT * FROM khach_hang;
-- #24	Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong với yêu cầu sp_them_moi_hop_dong phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung, với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.


delimiter //
DROP PROCEDURE IF EXISTS sp_them_moi_hop_dong//
CREATE PROCEDURE sp_them_moi_hop_dong(IN ngay_lam_hop_dong_moi DATETIME, ngay_ket_thuc_moi DATETIME,
                                      tien_dat_coc_moi DOUBLE,
                                      ma_nhan_vien_moi INT, ma_khach_hang_moi INT, ma_dich_vu_moi INT)
BEGIN
    SET sql_safe_updates = 0;
     IF (ngay_lam_hop_dong_moi <= ngay_ket_thuc_moi) THEN 
    INSERT INTO hop_dong
    (ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, ma_nhan_vien, ma_khach_hang, ma_dich_vu)
        VALUE (ngay_lam_hop_dong_moi, ngay_ket_thuc_moi, tien_dat_coc_moi,
               (SELECT ma_nhan_vien
                FROM nhan_vien
                WHERE ma_nhan_vien = ma_nhan_vien_moi),
               (SELECT ma_khach_hang
                FROM khach_hang
                WHERE ma_khach_hang = ma_khach_hang_moi),
               (SELECT ma_dich_vu
                FROM dich_vu
                WHERE ma_dich_vu = ma_dich_vu_moi)
        );
		ELSE 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'ngày kết thúc phải lớn hơn hoặc bằng ngày làm hợp đồng';
        END IF;
    SET sql_safe_updates = 1;
END //
delimiter ;

CALL  sp_them_moi_hop_dong('2022-03-13','2022-03-26',100000,2,8,5);
CALL  sp_them_moi_hop_dong('2022-03-26','2022-03-7',100000,2,9,7);

#25	Tạo Trigger có tên tr_xoa_hop_dong khi xóa bản ghi trong bảng hop_dong thì hiển thị tổng số lượng bản ghi còn lại có trong bảng hop_dong ra giao diện console của database.
#Lưu ý: Đối với MySQL thì sử dụng SIGNAL hoặc ghi log thay cho việc ghi ở console.
#bước 1:
CREATE TABLE hien_thi_tong_record(
	id int primary key auto_increment,
	so_luong_record INT
);
#bước 2:
drop trigger if exists dem_tong_record;
delimiter // 
CREATE TRIGGER dem_tong_record 
AFTER DELETE 
ON  hop_dong FOR EACH ROW 
BEGIN 
	declare tong_record int;
    set tong_record =  (select count(*) from hop_dong);
	insert into hien_thi_tong_record
    set so_luong_record = tong_record;
END //
delimiter ;
#bước 3:
DELIMITER // 
DROP PROCEDURE IF EXISTS xoa_hop_dong//
CREATE PROCEDURE xoa_hop_dong(IN ma_hop_dong_muon_xoa INT)
BEGIN
	SET sql_safe_updates = 0;
   	SET foreign_key_checks =0;
	DELETE FROM hop_dong 
    WHERE ma_hop_dong_muon_xoa = hop_dong.ma_hop_dong ;
    SET sql_safe_updates = 1;
	SET foreign_key_checks =1;
END;//
DELIMITER ;
CALL xoa_hop_dong(3);
#bước 4:
SELECT*FROM hien_thi_tong_record;

#26 ; Tạo Trigger có tên tr_cap_nhat_hop_dong khi cập nhật ngày kết thúc hợp đồng, 
#cần kiểm tra xem thời gian cập nhật có phù hợp hay không, 
#với quy tắc sau: Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày. 
#Nếu dữ liệu hợp lệ thì cho phép cập nhật, nếu dữ liệu không hợp lệ thì 
#in ra thông báo “Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày” trên console của database.

DROP PROCEDURE IF EXISTS validate_them_moi_hop_dong;
delimiter //
CREATE PROCEDURE validate_hop_dong(IN ngay_lam DATE, ngay_dung DATE)
DETERMINISTIC
NO SQL
BEGIN
	IF (DATE(ngay_dung) - DATE(ngay_lam) < 2) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'ngày kết thúc phải lớn hơn ngày làm hợp đồng ít nhất 2 ngày';
	END IF;
end; //
dEliMITeR ;

DROP PROCEDURE IF EXISTS  hop_dong_insert;
DELIMITER $$
CREATE TRIGGER hop_dong_insert
BEFORE INSERT ON hop_dong FOR EACH ROW
BEGIN
	CALL validate_hop_dong(NEW.ngay_lam_hop_dong, NEW.ngay_ket_thuc);
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS  cap_nhat_hop_dong;
DELIMITER $$
CREATE TRIGGER cap_nhat_hop_dong 
BEFORE UPDATE ON hop_dong FOR EACH ROW
BEGIN
	CALL validate_hop_dong(NEW.ngay_lam_hop_dong, NEW.ngay_ket_thuc);
END$$
DELIMITER ;

delimiter //
DROP PROCEDURE IF EXISTS sp_them_moi_hop_dong//
CREATE PROCEDURE sp_them_moi_hop_dong(IN ngay_lam_hop_dong_moi DATETIME, ngay_ket_thuc_moi DATETIME,
                                      tien_dat_coc_moi DOUBLE,
                                      ma_nhan_vien_moi INT, ma_khach_hang_moi INT, ma_dich_vu_moi INT)
BEGIN
    SET sql_safe_updates = 0;
     IF (ngay_lam_hop_dong_moi <= ngay_ket_thuc_moi) THEN 
    INSERT INTO hop_dong
    (ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, ma_nhan_vien, ma_khach_hang, ma_dich_vu)
        VALUE (ngay_lam_hop_dong_moi, ngay_ket_thuc_moi, tien_dat_coc_moi,
               (SELECT ma_nhan_vien
                FROM nhan_vien
                WHERE ma_nhan_vien = ma_nhan_vien_moi),
               (SELECT ma_khach_hang
                FROM khach_hang
                WHERE ma_khach_hang = ma_khach_hang_moi),
               (SELECT ma_dich_vu
                FROM dich_vu
                WHERE ma_dich_vu = ma_dich_vu_moi)
        );
        END IF;
    SET sql_safe_updates = 1;
END //
delimiter ;

CALL sp_them_moi_hop_dong('2022-03-13','2022-03-13',100000,2,8,5);

#27	Tạo Function thực hiện yêu cầu sau:
#a đếm số dịch vụ:
DROP FUNCTION IF EXISTS func_dem_dich_vu;
delimiter //
CREATE FUNCTION func_dem_dich_vu()
RETURNS INTEGER 
READS SQL DATA
DETERMINISTIC
BEGIN 
   DECLARE c INT;
   SET c = (SELECT COUNT(*) FROM (SELECT dich_vu.ma_dich_vu, SUM(dich_vu.chi_phi_thue) 
			FROM hop_dong RIGHT JOIN dich_vu ON hop_dong.ma_dich_vu = dich_vu.ma_dich_vu 
			GROUP BY dich_vu.ma_dich_vu
			HAVING SUM(dich_vu.chi_phi_thue) > 2000000) AS ten);
	RETURN c;
END //
delimiter ;

SELECT func_dem_dich_vu();
#b tính hiệu ngày tháng:
DROP FUNCTION IF EXISTS func_tinh_thoi_gian_hop_dong;
delimiter // 
CREATE FUNCTION func_tinh_thoi_gian_hop_dong(ma_khach_hang_nhap INT)
RETURNS INTEGER 
READS SQL DATA
DETERMINISTIC
BEGIN 
	DECLARE c INT;
    SET c = (SELECT MAX(DATE(ngay_ket_thuc) - DATE(ngay_lam_hop_dong)) FROM hop_dong 
    WHERE (DATE(ngay_ket_thuc) - DATE(ngay_lam_hop_dong) >= (SELECT MAX(DATE(ngay_ket_thuc) - DATE(ngay_lam_hop_dong)) AS hieu_ngay_thang 
    FROM hop_dong 
    WHERE ma_khach_hang = ma_khach_hang_nhap
	GROUP BY ma_khach_hang))AND ma_khach_hang = ma_khach_hang_nhap);
    RETURN c;
END//
delimiter ;

SELECT FUNC_TINH_THOI_GIAN_HOP_DONG(3);


#28 Tạo Stored Procedure sp_xoa_dich_vu_va_hd_room để tìm các dịch vụ được thuê bởi khách hàng với loại dịch vụ là “Room” 
#từ đầu năm 2015 đến hết năm 2019 để xóa thông tin của các dịch vụ đó (tức là xóa các bảng ghi trong bảng dich_vu) 
#và xóa những hop_dong sử dụng dịch vụ liên quan
#(tức là phải xóa những bản gi trong bảng hop_dong) và những bản liên quan khác.
drop view if exists view_xoa_dich_vu;
create view view_xoa_dich_vu as 
select dich_vu.ma_dich_vu 
from hop_dong left join dich_vu on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
where dich_vu.ma_dich_vu in (3,6) and year(hop_dong.ngay_ket_thuc) < 2021
group by dich_vu.ma_dich_vu;


drop view if exists view_xoa_hop_dong;
create view view_xoa_hop_dong as 
select hop_dong.ma_hop_dong
from hop_dong left join dich_vu on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
where dich_vu.ma_dich_vu in (3,6) and year(hop_dong.ngay_ket_thuc) < 2021
group by hop_dong.ma_hop_dong;

DROP PROCEDURE IF EXISTS  sp_xoa_dich_vu_va_hd_room;
delimiter // 
create procedure sp_xoa_dich_vu_va_hd_room()
begin
    ALTER TABLE hop_dong
    DROP FOREIGN KEY fk_dich_vu;
	ALTER TABLE hop_dong
    ADD CONSTRAINT fk_dich_vu FOREIGN KEY (ma_dich_vu) REFERENCES dich_vu (ma_dich_vu) ON DELETE SET NULL;
    ALTER TABLE hop_dong
    DROP FOREIGN KEY fk_ma_khach_hang;
	ALTER TABLE hop_dong
    ADD CONSTRAINT fk_ma_khach_hang FOREIGN KEY (ma_khach_hang) REFERENCES khach_hang (ma_khach_hang) ON DELETE SET NULL;
    ALTER TABLE hop_dong
    DROP FOREIGN KEY fk_ma_nhan_vien;
	ALTER TABLE hop_dong
    ADD CONSTRAINT fk_ma_nhan_vien FOREIGN KEY (ma_nhan_vien) REFERENCES nhan_vien (ma_nhan_vien) ON DELETE SET NULL;
    ALTER TABLE hop_dong_chi_tiet
    DROP FOREIGN KEY fk_ma_hop_dong;
	ALTER TABLE hop_dong_chi_tiet
    ADD CONSTRAINT fk_ma_hop_dong FOREIGN KEY (ma_hop_dong) REFERENCES hop_dong (ma_hop_dong) ON DELETE SET NULL;
	delete from hop_dong 
    where hop_dong.ma_hop_dong in (select*from view_xoa_hop_dong);
    delete from dich_vu 
    where dich_vu.ma_dich_vu in  (select*from view_xoa_dich_vu);
end //
delimiter ;

set sql_safe_updates = 0;
call sp_xoa_dich_vu_va_hd_room;




    