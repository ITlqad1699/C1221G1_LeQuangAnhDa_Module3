use furama_resort;
# câu 2: Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
select ho_ten from nhan_vien where nhan_vien.ho_ten regexp '^[HKT]' and length(ho_ten) <= 15;