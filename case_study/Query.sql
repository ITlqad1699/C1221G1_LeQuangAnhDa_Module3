USE furama_resort;

#2: Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
SELECT ho_ten FROM nhan_vien WHERE nhan_vien.ho_ten REGEXP '^[HKT]' AND LENGTH(ho_ten) <= 15;

#3: Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
SELECT*FROM khach_hang kh WHERE((CURDATE() - kh.ngay_sinh) BETWEEN 180000 AND 500000) AND (kh.dia_chi LIKE '%Đà Nẵng' or kH.dia_chi like '%Quảng Trị');

#4: Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
SELECT khach_hang.*,COUNT(khach_hang.ma_khach_hang) AS so_lan_dat_phong 
FROM khach_hang JOIN hop_dong ON khach_hang.ma_khach_hang = hop_dong.ma_khach_hang 
GROUP BY khach_hang.ma_khach_hang 
HAVING khach_hang.ma_loai_khach = 1 
ORDER BY so_lan_dat_phong ASC;

#5: Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
SELECT khach_hang.ma_khach_hang, khach_hang.ho_ten, loai_khach.ten_loai_khach, hop_dong.ma_hop_dong, dich_vu.ten_dich_vu,hop_dong.ngay_lam_hop_dong, hop_dong.ngay_ket_thuc, SUM(COALESCE(hop_dong_chi_tiet.so_luong*dich_vu_di_kem.gia,0)+dich_vu.chi_phi_thue) FROM khach_hang
LEFT JOIN loai_khach ON loai_khach.ma_loai_khach = khach_hang.ma_loai_khach  
LEFT JOIN hop_dong  ON khach_hang.ma_khach_hang = hop_dong.ma_khach_hang 
LEFT JOIN dich_vu ON dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
LEFT JOIN hop_dong_chi_tiet ON hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
LEFT JOIN dich_vu_di_kem ON dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
GROUP BY hop_dong.ma_hop_dong, khach_hang.ma_khach_hang
ORDER BY khach_hang.ma_khach_hang, hop_dong.ma_hop_dong DESC
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

#8: Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
# Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên
#cách 1:
select distinct khach_hang.ho_ten from khach_hang;
#cách 2:
select  khach_hang.ho_ten from khach_hang 
union
select  khach_hang.ho_ten from khach_hang;
#cách 3:
select khach_hang.ho_ten from khach_hang
group by khach_hang.ho_ten;














