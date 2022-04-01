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
create view view_nhan_vien as 
select nhan_vien.ma_nhan_vien
	from nhan_vien 
	left join hop_dong on hop_dong.ma_nhan_vien = nhan_vien.ma_nhan_vien
	group by nhan_vien.ma_nhan_vien 
	having count(hop_dong.ma_nhan_vien) = 0;
select * from view_nhan_vien;
drop view view_nhan_vien;
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

-- test lại nào anh em: 
select nhan_vien.ma_nhan_vien, nhan_vien.ho_ten
	from nhan_vien 
	left join hop_dong on hop_dong.ma_nhan_vien = nhan_vien.ma_nhan_vien
	group by nhan_vien.ma_nhan_vien 
	having count(hop_dong.ma_nhan_vien) > 0;
    
#17	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ
drop view if exists view_tong_tien;
create view view_tong_tien as 
SELECT khach_hang.ma_khach_hang,sum(COALESCE(hop_dong_chi_tiet.so_luong*dich_vu_di_kem.gia,0)+dich_vu.chi_phi_thue) as tong_tien  fROM khach_hang
LEFT JOIN loai_khach On loai_khach.ma_loai_khach = khach_hang.ma_loai_khach  
lEFT JOIN hop_dong  On khach_hang.ma_khach_hang = hop_dong.ma_khach_hang 
left join dich_vu ON dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
LEFT JOiN hop_dong_chi_tiet ON hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
LEfT JOIN dich_vu_di_kem ON dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
GROUP BY  hop_dong.ma_hop_dong,khach_hang.ma_khach_hang;

drop view if exists view_thu;
create view view_thu as 
select  view_tong_tien.ma_khach_hang
from view_tong_tien
group by view_tong_tien.ma_khach_hang
having sum(tong_tien) > 1000000;

DELIMITER //
drop procedure if exists update_loai_khach//
create procedure update_loai_khach()
begin
	set sql_safe_updates = 0;
	update khach_hang
    set khach_hang.ma_loai_khach = 1 where ma_khach_hang in (select*from view_thu);
	set sql_safe_updates = 1;
end;//
DELIMITER ;

call update_loai_khach;



