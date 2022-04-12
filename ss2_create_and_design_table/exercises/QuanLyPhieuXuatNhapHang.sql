create database quan_ly_phieu_xuat_nhap_hang;
use quan_ly_phieu_xuat_nhap_hang;
create table phieu_xuat(
so_px varchar(20) primary key,
ngay_xuat Date
);
create table vat_tu(
ma_vtu int primary key,
ten_vtu varchar(20)
);
create table chi_tiet_phieu_xuat(
so_px varchar(20),
ma_vtu int,
dg_xuat float,
sl_xuat int,
PRIMARY KEY(so_p, ma_vtu),
foreign key (so_px) references phieu_xuat(so_px),
foreign key (ma_vtu) references vat_tu(ma_vtu)
);
create table phieu_nhap(
so_pn int primary key,
ngay_nhap date
);
create table chi_tiet_phieu_nhap(
ma_vtu int,
so_pn int,
dg_nhap float,
sl_nhap int,
PRIMARY KEY (ma_vtu, so_pn),
foreign key (so_pn) references phieu_nhap(so_pn),
foreign key (ma_vtu) references vat_tu(ma_vtu)
);
create table don_dh(
so_dh int primary key,
ngay_dh date
);
create table chi_tiet_don_dat_hang(
so_dh int,
ma_vtu int,
PRIMARY KEY(so_dh,ma_vtu),
foreign key (so_dh) references don_dh(so_dh),
foreign key (ma_vtu) references vat_tu(ma_vtu)
);
create table nha_cc(
ma_ncc int primary key,
so_dh int,
ten_ncc varchar(20),
dia_chi varchar(20),
foreign key (so_dh) references don_dh(so_dh)
);
create table SDT(
ma_NCC int,
id_Sdt int,
foreign key (ma_NCC) references nha_cc(ma_NCC)
);