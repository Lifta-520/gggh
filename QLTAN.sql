use master
go
create database QLDAN
go
use QLDAN
go
create table users(
	userID int primary key identity,
	username varchar(50) not null,
	upass varchar(10) not null,
	uphone varchar(20) not null,
)
go 
insert into users values( 'admin' , 123, 'User 1' )
go
create table LoaiMon (
	MaLoai nvarchar (50) not null,
	LoaiMon nvarchar (50) null,
	primary key clustered (MaLoai ASC)
)
go
create table KhachHang (
	MaKH nvarchar (10) not null,
	TenKH nvarchar (50) not null,
	DiaChiKH nvarchar (50) not null,
	DienThoaiKH nvarchar (15) not null,
	primary key clustered (MaKH ASC)
)
go
create table MonAn (
	MaMon nvarchar (50) not null,
	TenMon nvarchar (50) not null,
	MaLoai nvarchar (50) not null,
	LoaiMon nvarchar (50) null,
	Gia	float not null,
	GhiChu nvarchar (200) null,
	primary key clustered (MaMon ASC),
	constraint Fk_LoaiMon foreign key(MaLoai) references LoaiMon(MaLoai)
)
go
create table NhanVien (
	MaNV nvarchar (10) not null,
	TenNV nvarchar (50) not null,
	GioiTinh nvarchar (10) not null,
	DiaChiNV nvarchar (50) not null,
	DienThoaiNV nvarchar (15) not null,
	NgaySinhNV date not null,
	primary key clustered (MaNV ASC)
)
go
create table HoaDon (
	MaHD nvarchar (30) not null,
	MaNV nvarchar (10) not null,
	NgayBan date not null,
	MaKH nvarchar (10) not null,
	TongTien float not null,
	primary key clustered (MaHD ASC),
	constraint Fk_NhanVien foreign key(MaNV) references NhanVien(MaNV),
	constraint Fk_KhachHang foreign key(MaKH) references KhachHang(MaKH)
)
go
create table ChiTietHD (
	MaHD nvarchar (30) not null,
	MaMon nvarchar (50) not null,
	SoLuong int not null,
	DonGia float not null,
	GiamGia float not null,
	ThanhTien float not null,
	TenMon nvarchar (50) not null,
	MaNV nvarchar (10) not null,
	MaKH nvarchar (10) not null,
	NgayBan date not null,
	primary key clustered (MaHD ASC, MaMon ASC),
	
)

INSERT INTO NhanVien (MaNV, TenNV, GioiTinh, DiaChiNV, DienThoaiNV, NgaySinhNV)
VALUES ('1', N'Nguyễn Văn A', 'Nam',N'TP.HCM','0989898989', '2-10-1999');
INSERT INTO NhanVien (MaNV, TenNV, GioiTinh, DiaChiNV, DienThoaiNV, NgaySinhNV)
VALUES ('2', N'Nguyễn Văn B', N'Nữ',N'TP.HCM','0389486472', '1-03-2000');
INSERT INTO NhanVien (MaNV, TenNV, GioiTinh, DiaChiNV, DienThoaiNV, NgaySinhNV)
VALUES ('3', N'Nguyễn Văn C', 'Nam',N'TP.HCM','0386886472', '2-05-2000');
INSERT INTO NhanVien (MaNV, TenNV, GioiTinh, DiaChiNV, DienThoaiNV, NgaySinhNV)
VALUES ('4', N'Nguyễn Văn D', N'Nữ',N'TP.HCM','0377657738', '6-09-2004');

INSERT INTO LoaiMon (MaLoai, LoaiMon)
VALUES ('1', N'Gà rán');
INSERT INTO LoaiMon (MaLoai, LoaiMon)
VALUES ('2', N'Nước ngọt');
INSERT INTO LoaiMon (MaLoai, LoaiMon)
VALUES ('3', N'Đồ ăn vặt');
INSERT INTO LoaiMon (MaLoai, LoaiMon)
VALUES ('4', N'Pizza');

INSERT INTO MonAn (MaMon, TenMon, MaLoai, Gia, GhiChu, LoaiMon)
VALUES ('1', N'Đùi gà KFC', '1','36000', N'Đùi gà rất ngon', N'Gà rán');
INSERT INTO MonAn (MaMon, TenMon, MaLoai, Gia, GhiChu, LoaiMon)
VALUES ('2', N'Pepsi','2', '10000', N'Pepsi rất ngon', N'Nước ngọt');
INSERT INTO MonAn (MaMon, TenMon, MaLoai, Gia, GhiChu, LoaiMon)
VALUES ('3', N'Bò húc','2','12000', N'Bò húc rất ngon', N'Nước ngọt');
INSERT INTO MonAn (MaMon, TenMon, MaLoai, Gia, GhiChu, LoaiMon)
VALUES ('4', N'Oishi phồng tôm', '3','5000',N'Snack rất ngon', N'Đồ ăn vặt');
INSERT INTO MonAn (MaMon, TenMon, MaLoai, Gia, GhiChu, LoaiMon)
VALUES ('5', N'Snack khoai tây', '3','20000',N'Snack rất ngon', N'Đồ ăn vặt');
INSERT INTO MonAn (MaMon, TenMon, MaLoai, Gia, GhiChu, LoaiMon)
VALUES ('6', N'Pizza bò và tôm', '4','89000',N'Pizza rất ngon', N'Pizza');

INSERT INTO KhachHang (MaKH, TenKH, DiaChiKH, DienThoaiKH)
VALUES ('1', N'Nguyễn Trần Bình An', N'TP.HCM','0493972997');
INSERT INTO KhachHang (MaKH, TenKH, DiaChiKH, DienThoaiKH)
VALUES ('2', N'Trần Xuân Vũ', N'TP.HCM','0850384977');
INSERT INTO KhachHang (MaKH, TenKH, DiaChiKH, DienThoaiKH)
VALUES ('3', N'Nguyễn Duy Khang', N'TP.HCM','0937458432');
INSERT INTO KhachHang (MaKH, TenKH, DiaChiKH, DienThoaiKH)
VALUES ('4', N'Trầm Kim Ngân', N'TP.HCM','0937347365')
