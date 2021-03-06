USE [master]
GO
/****** Object:  Database [QLSINHVIEN]    Script Date: 6/14/2017 11:38:49 AM ******/
CREATE DATABASE [QLSINHVIEN]
 CONTAINMENT = NONE
-- ON  PRIMARY 
--( NAME = N'QLSINHVIEN', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\QLSINHVIEN.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
-- LOG ON 
--( NAME = N'QLSINHVIEN_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\QLSINHVIEN_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
--GO
ALTER DATABASE [QLSINHVIEN] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLSINHVIEN].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLSINHVIEN] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLSINHVIEN] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLSINHVIEN] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLSINHVIEN] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLSINHVIEN] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLSINHVIEN] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLSINHVIEN] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLSINHVIEN] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLSINHVIEN] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLSINHVIEN] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLSINHVIEN] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLSINHVIEN] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLSINHVIEN] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLSINHVIEN] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLSINHVIEN] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLSINHVIEN] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLSINHVIEN] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLSINHVIEN] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLSINHVIEN] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLSINHVIEN] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLSINHVIEN] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLSINHVIEN] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLSINHVIEN] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLSINHVIEN] SET  MULTI_USER 
GO
ALTER DATABASE [QLSINHVIEN] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLSINHVIEN] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLSINHVIEN] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLSINHVIEN] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QLSINHVIEN] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLSINHVIEN', N'ON'
GO
ALTER DATABASE [QLSINHVIEN] SET QUERY_STORE = OFF
GO
USE [QLSINHVIEN]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [QLSINHVIEN]
GO
/****** Object:  UserDefinedFunction [dbo].[func_ThongKeSinhVienTheoDanToc]    Script Date: 6/14/2017 11:38:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[func_ThongKeSinhVienTheoDanToc]()
RETURNS @BangThongKe TABLE
(
	[Mã Sinh Viên] VARCHAR(6) PRIMARY KEY,
	[Họ Tên] NVARCHAR(30),
	[Dân Tộc]  NVARCHAR(30),
	[Nơi Sinh] NVARCHAR(50),
	[Lớp] NVARCHAR(30)
)
AS
BEGIN
INSERT INTO @BangThongKe ([Mã Sinh Viên], [Họ Tên], [Dân Tộc], [Nơi Sinh], [Lớp])
SELECT A.MaSINHVIEN, A.HoTen, A.TenDanToc, A.NoiSinh, LOP.TenLop FROM
(SELECT MaSINHVIEN, HoTen, TenDanToc, NoiSinh, MaLop FROM SINHVIEN
INNER JOIN DANTOC 
ON SINHVIEN.MaDanToc = DANTOC.MaDanToc
WHERE DANTOC.MaDanToc != 'DT0001') A
INNER JOIN LOP
ON A.MaLop = LOP.MaLop
RETURN
END





GO
/****** Object:  UserDefinedFunction [dbo].[func_ThongKeSinhVienTheoTonGiao]    Script Date: 6/14/2017 11:38:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[func_ThongKeSinhVienTheoTonGiao]()
RETURNS @BangThongKe TABLE
(
	[Mã Sinh Viên] VARCHAR(6) PRIMARY KEY,
	[Họ Tên] NVARCHAR(30),
	[Tôn Giáo]  NVARCHAR(30),
	[Nơi Sinh] NVARCHAR(50),
	[Lớp] NVARCHAR(30)
)
AS
BEGIN
INSERT INTO @BangThongKe ([Mã Sinh Viên], [Họ Tên], [Tôn Giáo], [Nơi Sinh], [Lớp])
SELECT MaSINHVIEN, HoTen, TenTonGiao, NoiSinh, TenLop FROM 
(SELECT MaSINHVIEN, HoTen, TenTonGiao, NoiSinh, MaLop FROM SINHVIEN
INNER JOIN TONGIAO 
ON SINHVIEN.MaTonGiao = TONGIAO.MaTonGiao
WHERE TONGIAO.MaTonGiao != 'TG0001') A
INNER JOIN LOP
ON A.MaLop = LOP.MaLop
RETURN 
END





GO
/****** Object:  UserDefinedFunction [dbo].[func_TinhHocPhi]    Script Date: 6/14/2017 11:38:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[func_TinhHocPhi] (@MaSINHVIEN VARCHAR(6), @TenNamHoc VARCHAR(30), @TenHocKy NVARCHAR(30))
RETURNS FLOAT 
AS
BEGIN
DECLARE @HocPhi MONEY, @MaNamHoc VARCHAR(6), @MaHocKy VARCHAR(4)
SELECT @MaNamHoc = MaNamHoc FROM NAMHOC WHERE TenNamHoc LIKE '%' + RTRIM(LTRIM(@TenNamHoc)) + '%'
SELECT @MaHocKy = MaHocKy FROM HOCKY WHERE TenHocKy LIKE '%' + RTRIM(LTRIM(@TenHocKy)) + '%'
SELECT @HocPhi = SUM(TienHoc*SoTinChi)/2 FROM DIEM, MONHOC, TINCHI
WHERE DIEM.MaSINHVIEN = @MaSINHVIEN AND DIEM.MaNamHoc = @MaNamHoc AND DIEM.MaHocKy = @MaHocKy
AND DIEM.MaMonHoc = MONHOC.MaMonHoc AND MONHOC.MaTinChi = TINCHI.MaTinChi
GROUP BY MaSINHVIEN, MaNamHoc, MaHocKy
RETURN @HocPhi
END





GO
/****** Object:  UserDefinedFunction [dbo].[func_TinhSoHSTheoLoaiHocLuc]    Script Date: 6/14/2017 11:38:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[func_TinhSoHSTheoLoaiHocLuc] (@TenHocKy NVARCHAR(30), @TenNamHoc VARCHAR(30),  @TenHocLuc NVARCHAR(30))
RETURNS INT
AS
BEGIN
DECLARE @MaHocKy VARCHAR(4), @MaHocLuc VARCHAR(6), @MaNamHoc VARCHAR(6), @SoHS INT
SELECT @MaHocKy = MaHocKy FROM HOCKY WHERE TenHocKy LIKE '%' + RTRIM(LTRIM(@TenHocKy)) + '%'
SELECT @MaHocLuc = MaHocLuc FROM HOCLUC WHERE TenHocLuc LIKE '%' + RTRIM(LTRIM(@TenHocLuc)) + '%'
SELECT @MaNamHoc = MaNamHoc FROM NAMHOC WHERE TenNamHoc LIKE '%' + RTRIM(LTRIM(@TenNamHoc)) + '%'
IF @MaHocKy = NULL
BEGIN
SELECT @SoHS = COUNT(MaSINHVIEN) FROM KQ_CA_NAM_TONG_HOP
WHERE MaNamHoc = @MaNamHoc AND MaHocLuc = @MaHocLuc
GROUP BY MaSINHVIEN
END
ELSE
BEGIN
SELECT @SoHS = COUNT(MaSINHVIEN) FROM KQ_HOC_KY_TONG_HOP
WHERE MaNamHoc = @MaNamHoc AND MaHocLuc = @MaHocLuc AND MaHocKy = @MaHocKy
GROUP BY MaSINHVIEN
END
RETURN @SoHS
END





GO
/****** Object:  Table [dbo].[KQ_HOC_KY_MON_HOC]    Script Date: 6/14/2017 11:38:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KQ_HOC_KY_MON_HOC](
	[MaSINHVIEN] [varchar](6) NOT NULL,
	[MaLopTC] [varchar](10) NOT NULL,
	[MaMonHoc] [varchar](6) NOT NULL,
	[MaHocKy] [varchar](4) NOT NULL,
	[MaNamHoc] [varchar](6) NOT NULL,
	[DTBMonHocKy] [float] NULL,
	[MaKetQua] [varchar](6) NULL,
 CONSTRAINT [PK_KQ_HOC_KY_MON_HOC] PRIMARY KEY CLUSTERED 
(
	[MaSINHVIEN] ASC,
	[MaLopTC] ASC,
	[MaMonHoc] ASC,
	[MaHocKy] ASC,
	[MaNamHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MONHOC]    Script Date: 6/14/2017 11:38:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MONHOC](
	[MaMonHoc] [varchar](6) NOT NULL,
	[TenMonHoc] [nvarchar](30) NOT NULL,
	[SoTiet] [int] NOT NULL,
	[MaKhoa] [varchar](5) NULL,
	[MaTinChi] [varchar](6) NULL,
	[SoTinChi] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaMonHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[vw_DIEM_XetCanhCaoHocTap]    Script Date: 6/14/2017 11:38:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_DIEM_XetCanhCaoHocTap]
AS
SELECT MaSINHVIEN, SUM(SoTinChi) AS SoTinChiNo FROM
(SELECT MaSINHVIEN, B.MaMonHoc, C.SoTinChi  FROM 
(SELECT * FROM
(SELECT MaSINHVIEN, MaMonHoc, MAX(DTBMonHocKy) AS DTBMonCuoiCung, 
CASE
	WHEN MAX(DTBMonHocKy) < 4 THEN N'Trượt'	
	WHEN MAX(DTBMonHocKy) >= 4 THEN N'Qua'
END
AS KetQua
FROM KQ_HOC_KY_MON_HOC
GROUP BY MaSINHVIEN, MaMonHoc) A
WHERE A.KetQua = N'Trượt') B
INNER JOIN MONHOC C
ON B.MaMonHoc = C.MaMonHoc) D
GROUP BY MaSINHVIEN





GO
/****** Object:  Table [dbo].[GIANGVIEN]    Script Date: 6/14/2017 11:38:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GIANGVIEN](
	[MaGIANGVIEN] [varchar](6) NOT NULL,
	[TenGIANGVIEN] [nvarchar](30) NOT NULL,
	[GioiTinh] [bit] NOT NULL,
	[DiaChi] [nvarchar](50) NOT NULL,
	[DienThoai] [varchar](15) NOT NULL,
	[MaMonHoc] [varchar](6) NULL,
	[MaHocVi] [varchar](6) NULL,
	[MaLoaiGV] [varchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaGIANGVIEN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HOCVI]    Script Date: 6/14/2017 11:38:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOCVI](
	[MAHOCVI] [varchar](6) NOT NULL,
	[TENHOCVI] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[MAHOCVI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LOAIGIANGVIEN]    Script Date: 6/14/2017 11:38:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOAIGIANGVIEN](
	[MALOAIGV] [varchar](5) NOT NULL,
	[TENLOAIGV] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[MALOAIGV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[vw_GIANGVIEN_ThongTinGiangVien]    Script Date: 6/14/2017 11:38:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_GIANGVIEN_ThongTinGiangVien]
AS
SELECT MaGIANGVIEN AS N'Mã Giảng Viên', TenGIANGVIEN AS N'Tên Giảng Viên', 
CASE
	WHEN (GioiTinh = 1) THEN N'Nữ'
	WHEN (GioiTinh = 0) THEN N'Nam'
END
AS N'Giới Tính', 
DiaChi AS N'Địa Chỉ', DienThoai AS N'Điện Thoại', TenMonHoc AS N'Tên Môn Học', TENHOCVI AS N'Học Vị', TENLOAIGV AS N'Loại Giảng Viên'
FROM GIANGVIEN, MONHOC, HOCVI, LOAIGIANGVIEN
WHERE GIANGVIEN.MaMonHoc = MONHOC.MaMonHoc AND GIANGVIEN.MaHocVi = HOCVI.MAHOCVI AND GIANGVIEN.MaLoaiGV = LOAIGIANGVIEN.MALOAIGV





GO
/****** Object:  Table [dbo].[KHOA]    Script Date: 6/14/2017 11:38:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHOA](
	[MaKhoa] [varchar](5) NOT NULL,
	[TenKhoa] [nvarchar](50) NOT NULL,
	[SDT] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKhoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[vw_KHOA_ThongTinKhoa]    Script Date: 6/14/2017 11:38:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_KHOA_ThongTinKhoa]
AS
SELECT k.MaKhoa N'Mã Khoa',k.Tenkhoa N'Tên Khoa',k.SDT N'Số Điện Thoại'
FROM dbo.KHOA k






GO
/****** Object:  Table [dbo].[LOP]    Script Date: 6/14/2017 11:38:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOP](
	[MaLop] [varchar](10) NOT NULL,
	[TenLop] [nvarchar](30) NOT NULL,
	[MaKhoa] [varchar](5) NULL,
	[SiSo] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[vw_LOPHOC_ThongTinLopHoc]    Script Date: 6/14/2017 11:38:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_LOPHOC_ThongTinLopHoc]
AS
SELECT l.MaLop 'Mã Lớp', l.TenLop 'Tên Lớp', k.TenKhoa 'Tên Khoa',l.SiSo 'Sĩ Số'
FROM dbo.LOP l,dbo.KHOA k
WHERE l.MaKhoa=k.MaKhoa






GO
/****** Object:  Table [dbo].[LOPTINCHI]    Script Date: 6/14/2017 11:38:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOPTINCHI](
	[MaLopTC] [varchar](10) NOT NULL,
	[SiSo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLopTC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NAMHOC]    Script Date: 6/14/2017 11:38:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NAMHOC](
	[MaNamHoc] [varchar](6) NOT NULL,
	[TenNamHoc] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNamHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PHANCONG]    Script Date: 6/14/2017 11:38:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHANCONG](
	[STT] [int] IDENTITY(1,1) NOT NULL,
	[MaNamHoc] [varchar](6) NULL,
	[MaLopTC] [varchar](10) NULL,
	[MaMonHoc] [varchar](6) NULL,
	[MaGIANGVIEN] [varchar](6) NULL,
PRIMARY KEY CLUSTERED 
(
	[STT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[vw_LOPTINCHI_ThongTinLopTinChi]    Script Date: 6/14/2017 11:38:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_LOPTINCHI_ThongTinLopTinChi]
AS
SELECT TOP 99.99 percent l.MaLopTC N'Mã Lớp Tín Chỉ',m.TenMonHoc N'Tên Môn Học',n.TenNamHoc N'Tên Năm Học',l.SiSo N'Sĩ Số',g.TenGIANGVIEN N'Tên Giảng Viên'
FROM dbo.LOPTINCHI l,dbo.PHANCONG p,dbo.MONHOC m,dbo.NAMHOC n,dbo.GIANGVIEN g
WHERE p.MaMonHoc=m.MaMonHoc AND p.MaLopTC=l.MaLopTC AND p.MaNamHoc=n.MaNamHoc AND g.MaGIANGVIEN=p.MaGIANGVIEN
ORDER BY n.TenNamHoc, l.MaLopTC


GO
/****** Object:  Table [dbo].[MucDoCanhCaoHocTap]    Script Date: 6/14/2017 11:38:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MucDoCanhCaoHocTap](
	[MucCanhCao] [nvarchar](30) NOT NULL,
	[SoTinChiNo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MucCanhCao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[vw_MDCCHT_XemThongTin]    Script Date: 6/14/2017 11:38:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_MDCCHT_XemThongTin]
AS
SELECT MucCanhCao AS N'Mức Độ Cảnh Cáo', SoTinChiNo AS N'Số Tín Chỉ Nợ' FROM MucDoCanhCaoHocTap





GO
/****** Object:  View [dbo].[vw_MONHOC_ThongTinMonHoc]    Script Date: 6/14/2017 11:38:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_MONHOC_ThongTinMonHoc]
AS
SELECT MaMonHoc AS N'Mã Môn Học', TenMonHoc AS N'Tên Môn Học', SoTiet AS N'Số Tiết', 
TenKhoa AS N'Tên Khoa', MaTinChi AS N'Loại Tín Chỉ', SoTinChi AS N'Số Tín Chỉ' FROM MONHOC, KHOA
WHERE MONHOC.MaKhoa = KHOA.MaKhoa





GO
/****** Object:  Table [dbo].[LOAINGUOIDUNG]    Script Date: 6/14/2017 11:38:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOAINGUOIDUNG](
	[MaLoai] [varchar](6) NOT NULL,
	[TenLoaiND] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NGUOIDUNG]    Script Date: 6/14/2017 11:38:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NGUOIDUNG](
	[MaND] [varchar](6) NOT NULL,
	[MaLoai] [varchar](6) NOT NULL,
	[TenND] [nvarchar](30) NOT NULL,
	[TenDNhap] [varchar](30) NOT NULL,
	[matkhau] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaND] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[vw_NGUOIDUNG_ThongTinNguoiDung]    Script Date: 6/14/2017 11:38:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_NGUOIDUNG_ThongTinNguoiDung]
AS
SELECT MaND AS N'Mã Người Dùng', TenLoaiND AS N'Quyền Hạn', TenND AS N'Tên Người Dùng', TenDNhap AS N'Tên Đăng Nhập', MatKhau AS N'Mật Khẩu'
FROM NGUOIDUNG,LOAINGUOIDUNG WHERE NGUOIDUNG.MaLoai = LOAINGUOIDUNG.MaLoai 





GO
/****** Object:  Table [dbo].[SINHVIEN]    Script Date: 6/14/2017 11:38:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SINHVIEN](
	[MaSINHVIEN] [varchar](6) NOT NULL,
	[HoTen] [nvarchar](30) NOT NULL,
	[GioiTinh] [bit] NULL,
	[NgaySinh] [datetime] NULL,
	[NoiSinh] [nvarchar](50) NOT NULL,
	[MaDanToc] [varchar](6) NULL,
	[MaTonGiao] [varchar](6) NULL,
	[HoTenCha] [nvarchar](30) NOT NULL,
	[MaNNghiepCha] [varchar](6) NULL,
	[HoTenMe] [nvarchar](30) NOT NULL,
	[MaNNghiepMe] [varchar](6) NULL,
	[DienThoai] [varchar](15) NULL,
	[MaLop] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSINHVIEN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TONGIAO]    Script Date: 6/14/2017 11:38:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TONGIAO](
	[MaTonGiao] [varchar](6) NOT NULL,
	[TenTonGiao] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTonGiao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DANTOC]    Script Date: 6/14/2017 11:38:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DANTOC](
	[MaDanToc] [varchar](6) NOT NULL,
	[TenDanToc] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDanToc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NGHENGHIEP]    Script Date: 6/14/2017 11:38:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NGHENGHIEP](
	[MaNghe] [varchar](6) NOT NULL,
	[TenNghe] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNghe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[vw_SINHVIEN_ThongTinSinhVien]    Script Date: 6/14/2017 11:38:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_SINHVIEN_ThongTinSinhVien]
AS
SELECT MaSINHVIEN AS N'Mã Sinh Viên', HoTen AS N'Họ Tên', 
CASE
	WHEN (GioiTinh = 1) THEN N'Nữ'
	WHEN (GioiTinh = 0) THEN N'Nam'
END
AS N'Giới Tính',
NgaySinh AS N'Ngày Sinh', NoiSinh AS N'Nơi Sinh', TenDanToc AS N'Dân Tộc', TenTonGiao AS N'Tôn Giáo', HoTenCha AS N'Họ Tên Cha',
NNA.TenNghe AS N'Nghề Nghiệp Cha', HoTenMe AS N'Họ Tên Mẹ', NNB.TenNghe AS N'Nghề Nghiệp Mẹ', DienThoai AS N'Điện Thoại', TenLop AS N'Tên Lớp'
FROM SINHVIEN, DANTOC, TONGIAO, NGHENGHIEP NNA, NGHENGHIEP NNB, LOP
WHERE SINHVIEN.MaDanToc = DANTOC.MaDanToc AND SINHVIEN.MaTonGiao = TONGIAO.MaTonGiao AND SINHVIEN.MaNNghiepCha = NNA.MaNghe
AND SINHVIEN.MaNNghiepMe = NNB.MaNghe AND SINHVIEN.MaLop = LOP.MaLop





GO
/****** Object:  Table [dbo].[DIEM]    Script Date: 6/14/2017 11:38:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIEM](
	[STT] [int] IDENTITY(1,1) NOT NULL,
	[MaSINHVIEN] [varchar](6) NULL,
	[MaMonHoc] [varchar](6) NULL,
	[MaHocKy] [varchar](4) NULL,
	[MaNamHoc] [varchar](6) NULL,
	[MaLopTC] [varchar](10) NULL,
	[MaLoai] [varchar](6) NULL,
	[Diem] [float] NULL,
 CONSTRAINT [PK__DIEM__CA1EB690060CEE47] PRIMARY KEY CLUSTERED 
(
	[STT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HOCKY]    Script Date: 6/14/2017 11:38:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOCKY](
	[MaHocKy] [varchar](4) NOT NULL,
	[TenHocKy] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHocKy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[vw_LOPTINCHI_SinhVienCacLopTinChi]    Script Date: 6/14/2017 11:38:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_LOPTINCHI_SinhVienCacLopTinChi]
AS
SELECT distinct TOP 99.99 percent p.MaLopTC N'Mã Lớp Tín Chỉ',m.TenMonHoc N'Tên Môn Học',n.TenNamHoc N'Tên Năm Học', d.MaSINHVIEN N'Mã Sinh Viên', h.TenHocKy N'Học Kỳ'
FROM dbo.PHANCONG p,dbo.MONHOC m,dbo.NAMHOC n,dbo.DIEM d,dbo.HOCKY h
WHERE p.MaMonHoc=m.MaMonHoc AND p.MaNamHoc=n.MaNamHoc  AND d.MaMonHoc=p.MaMonHoc AND d.MaNamHoc=p.MaNamHoc AND d.MaLopTC=p.MaLopTC AND d.MaHocKy=h.MaHocKy
ORDER BY n.TenNamHoc,p.MaLopTC,h.TenHocKy,d.MaSINHVIEN

GO
/****** Object:  Table [dbo].[HANHKIEM]    Script Date: 6/14/2017 11:38:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HANHKIEM](
	[MaHanhKiem] [varchar](6) NOT NULL,
	[TenHanhKiem] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHanhKiem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HOCLUC]    Script Date: 6/14/2017 11:38:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOCLUC](
	[MaHocLuc] [varchar](6) NOT NULL,
	[TenHocLuc] [nvarchar](30) NOT NULL,
	[DiemCanDuoi] [float] NOT NULL,
	[DiemCanTren] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHocLuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KETQUA]    Script Date: 6/14/2017 11:38:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KETQUA](
	[MaKetQua] [varchar](6) NOT NULL,
	[TenKetQua] [nvarchar](30) NOT NULL,
	[DiemCanDuoi] [float] NULL,
	[DiemCanTren] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKetQua] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KQ_CA_NAM_TONG_HOP]    Script Date: 6/14/2017 11:38:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KQ_CA_NAM_TONG_HOP](
	[MaSINHVIEN] [varchar](6) NOT NULL,
	[MaLop] [varchar](10) NOT NULL,
	[MaNamHoc] [varchar](6) NOT NULL,
	[MaHocLuc] [varchar](6) NULL,
	[MaHanhKiem] [varchar](6) NULL,
	[DTBCaNam] [float] NULL,
 CONSTRAINT [PK_KQ_CA_NAM_TONG_HOP] PRIMARY KEY CLUSTERED 
(
	[MaSINHVIEN] ASC,
	[MaNamHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KQ_HOC_KY_TONG_HOP]    Script Date: 6/14/2017 11:38:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KQ_HOC_KY_TONG_HOP](
	[MaSINHVIEN] [varchar](6) NOT NULL,
	[MaLop] [varchar](10) NOT NULL,
	[MaHocKy] [varchar](4) NOT NULL,
	[MaNamHoc] [varchar](6) NOT NULL,
	[MaHocLuc] [varchar](6) NULL,
	[MaHanhKiem] [varchar](6) NULL,
	[DTBMon] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSINHVIEN] ASC,
	[MaHocKy] ASC,
	[MaLop] ASC,
	[MaNamHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LOAIDIEM]    Script Date: 6/14/2017 11:38:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOAIDIEM](
	[MaLoai] [varchar](6) NOT NULL,
	[TenLoai] [nvarchar](30) NOT NULL,
	[HeSo] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QUYDINH]    Script Date: 6/14/2017 11:38:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QUYDINH](
	[TuoiCanDuoi] [int] NOT NULL,
	[TuoiCanTren] [int] NOT NULL,
	[SiSoCanDuoi] [int] NOT NULL,
	[SiSoCanTren] [int] NOT NULL,
	[ThangDiem] [int] NOT NULL,
	[TenTruong] [nvarchar](100) NULL,
	[DiaChiTruong] [nvarchar](100) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TINCHI]    Script Date: 6/14/2017 11:38:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TINCHI](
	[MaTinChi] [varchar](6) NOT NULL,
	[TienHoc] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTinChi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[DANTOC] ([MaDanToc], [TenDanToc]) VALUES (N'DT0001', N'Kinh')
INSERT [dbo].[DANTOC] ([MaDanToc], [TenDanToc]) VALUES (N'DT0002', N'Hoa')
INSERT [dbo].[DANTOC] ([MaDanToc], [TenDanToc]) VALUES (N'DT0003', N'Khome')
INSERT [dbo].[DANTOC] ([MaDanToc], [TenDanToc]) VALUES (N'DT0004', N'Chăm')
INSERT [dbo].[DANTOC] ([MaDanToc], [TenDanToc]) VALUES (N'DT0005', N'Khác')
SET IDENTITY_INSERT [dbo].[DIEM] ON 

INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (2, N'SV0002', N'MH0002', N'HK01', N'NH0910', N'LTC0002', N'LD0002', 7)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (3, N'SV0003', N'MH0003', N'HK01', N'NH0910', N'LTC0003', N'LD0002', 2.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (4, N'SV0004', N'MH0004', N'HK01', N'NH0910', N'LTC0004', N'LD0002', 8)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (5, N'SV0005', N'MH0005', N'HK01', N'NH0910', N'LTC0005', N'LD0002', 7)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (6, N'SV0006', N'MH0006', N'HK01', N'NH0910', N'LTC0006', N'LD0002', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (7, N'SV0007', N'MH0007', N'HK01', N'NH0910', N'LTC0007', N'LD0002', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (8, N'SV0008', N'MH0008', N'HK01', N'NH0910', N'LTC0008', N'LD0002', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (9, N'SV0009', N'MH0009', N'HK01', N'NH0910', N'LTC0009', N'LD0002', 1)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (10, N'SV0010', N'MH0010', N'HK01', N'NH0910', N'LTC0010', N'LD0002', 5.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (11, N'SV0011', N'MH0001', N'HK01', N'NH0910', N'LTC0001', N'LD0002', 4)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (12, N'SV0012', N'MH0002', N'HK01', N'NH0910', N'LTC0002', N'LD0002', 0.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (13, N'SV0013', N'MH0003', N'HK01', N'NH0910', N'LTC0003', N'LD0002', 9)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (14, N'SV0014', N'MH0004', N'HK01', N'NH0910', N'LTC0004', N'LD0002', 0.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (15, N'SV0015', N'MH0005', N'HK01', N'NH0910', N'LTC0005', N'LD0002', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (16, N'SV0016', N'MH0006', N'HK01', N'NH0910', N'LTC0006', N'LD0002', 7)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (17, N'SV0017', N'MH0007', N'HK01', N'NH0910', N'LTC0007', N'LD0002', 5.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (18, N'SV0018', N'MH0008', N'HK01', N'NH0910', N'LTC0008', N'LD0002', 6)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (19, N'SV0019', N'MH0009', N'HK01', N'NH0910', N'LTC0009', N'LD0002', 5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (20, N'SV0020', N'MH0010', N'HK01', N'NH0910', N'LTC0010', N'LD0002', 2)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (22, N'SV0002', N'MH0003', N'HK02', N'NH0910', N'LTC0003', N'LD0002', 1.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (23, N'SV0003', N'MH0004', N'HK02', N'NH0910', N'LTC0004', N'LD0002', 10)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (24, N'SV0004', N'MH0005', N'HK02', N'NH0910', N'LTC0005', N'LD0002', 6)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (25, N'SV0005', N'MH0006', N'HK02', N'NH0910', N'LTC0006', N'LD0002', 6)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (26, N'SV0006', N'MH0007', N'HK02', N'NH0910', N'LTC0007', N'LD0002', 8)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (27, N'SV0007', N'MH0008', N'HK02', N'NH0910', N'LTC0008', N'LD0002', 0.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (28, N'SV0008', N'MH0009', N'HK02', N'NH0910', N'LTC0009', N'LD0002', 0.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (29, N'SV0009', N'MH0010', N'HK02', N'NH0910', N'LTC0010', N'LD0002', 1)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (30, N'SV0010', N'MH0001', N'HK02', N'NH0910', N'LTC0001', N'LD0002', 6)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (31, N'SV0011', N'MH0002', N'HK02', N'NH0910', N'LTC0002', N'LD0002', 5.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (32, N'SV0012', N'MH0003', N'HK02', N'NH0910', N'LTC0003', N'LD0002', 3)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (33, N'SV0013', N'MH0004', N'HK02', N'NH0910', N'LTC0004', N'LD0002', 2)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (34, N'SV0014', N'MH0005', N'HK02', N'NH0910', N'LTC0005', N'LD0002', 5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (35, N'SV0015', N'MH0006', N'HK02', N'NH0910', N'LTC0006', N'LD0002', 2)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (36, N'SV0016', N'MH0007', N'HK02', N'NH0910', N'LTC0007', N'LD0002', 9)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (37, N'SV0017', N'MH0008', N'HK02', N'NH0910', N'LTC0008', N'LD0002', 4)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (38, N'SV0018', N'MH0009', N'HK02', N'NH0910', N'LTC0009', N'LD0002', 8)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (39, N'SV0019', N'MH0010', N'HK02', N'NH0910', N'LTC0010', N'LD0002', 7)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (40, N'SV0020', N'MH0001', N'HK02', N'NH0910', N'LTC0001', N'LD0002', 4)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (42, N'SV0002', N'MH0004', N'HK01', N'NH1011', N'LTC0004', N'LD0002', 9)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (43, N'SV0003', N'MH0005', N'HK01', N'NH1011', N'LTC0005', N'LD0002', 0.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (44, N'SV0004', N'MH0006', N'HK01', N'NH1011', N'LTC0006', N'LD0002', 0.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (45, N'SV0005', N'MH0007', N'HK01', N'NH1011', N'LTC0007', N'LD0002', 10)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (46, N'SV0006', N'MH0008', N'HK01', N'NH1011', N'LTC0008', N'LD0002', 9)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (47, N'SV0007', N'MH0009', N'HK01', N'NH1011', N'LTC0009', N'LD0002', 1)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (48, N'SV0008', N'MH0010', N'HK01', N'NH1011', N'LTC0010', N'LD0002', 1.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (49, N'SV0009', N'MH0001', N'HK01', N'NH1011', N'LTC0001', N'LD0002', 8)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (50, N'SV0010', N'MH0002', N'HK01', N'NH1011', N'LTC0002', N'LD0002', 6.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (51, N'SV0011', N'MH0003', N'HK01', N'NH1011', N'LTC0003', N'LD0002', 4)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (52, N'SV0012', N'MH0004', N'HK01', N'NH1011', N'LTC0004', N'LD0002', 4.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (53, N'SV0013', N'MH0005', N'HK01', N'NH1011', N'LTC0005', N'LD0002', 10)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (54, N'SV0014', N'MH0006', N'HK01', N'NH1011', N'LTC0006', N'LD0002', 3.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (55, N'SV0015', N'MH0007', N'HK01', N'NH1011', N'LTC0007', N'LD0002', 7)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (56, N'SV0016', N'MH0008', N'HK01', N'NH1011', N'LTC0008', N'LD0002', 3.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (57, N'SV0017', N'MH0009', N'HK01', N'NH1011', N'LTC0009', N'LD0002', 1.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (58, N'SV0018', N'MH0010', N'HK01', N'NH1011', N'LTC0010', N'LD0002', 6)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (59, N'SV0019', N'MH0001', N'HK01', N'NH1011', N'LTC0001', N'LD0002', 0.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (60, N'SV0020', N'MH0002', N'HK01', N'NH1011', N'LTC0002', N'LD0002', 6.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (62, N'SV0002', N'MH0004', N'HK02', N'NH1011', N'LTC0004', N'LD0002', 8.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (63, N'SV0003', N'MH0005', N'HK02', N'NH1011', N'LTC0005', N'LD0002', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (64, N'SV0004', N'MH0006', N'HK02', N'NH1011', N'LTC0006', N'LD0002', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (65, N'SV0005', N'MH0007', N'HK02', N'NH1011', N'LTC0007', N'LD0002', 1.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (66, N'SV0006', N'MH0008', N'HK02', N'NH1011', N'LTC0008', N'LD0002', 4.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (67, N'SV0007', N'MH0009', N'HK02', N'NH1011', N'LTC0009', N'LD0002', 6)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (68, N'SV0008', N'MH0010', N'HK02', N'NH1011', N'LTC0010', N'LD0002', 5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (69, N'SV0009', N'MH0001', N'HK02', N'NH1011', N'LTC0001', N'LD0002', 2.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (70, N'SV0010', N'MH0002', N'HK02', N'NH1011', N'LTC0002', N'LD0002', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (71, N'SV0011', N'MH0003', N'HK02', N'NH1011', N'LTC0003', N'LD0002', 5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (72, N'SV0012', N'MH0004', N'HK02', N'NH1011', N'LTC0004', N'LD0002', 1.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (73, N'SV0013', N'MH0005', N'HK02', N'NH1011', N'LTC0005', N'LD0002', 2)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (74, N'SV0014', N'MH0006', N'HK02', N'NH1011', N'LTC0006', N'LD0002', 10)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (75, N'SV0015', N'MH0007', N'HK02', N'NH1011', N'LTC0007', N'LD0002', 9)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (76, N'SV0016', N'MH0008', N'HK02', N'NH1011', N'LTC0008', N'LD0002', 4)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (77, N'SV0017', N'MH0009', N'HK02', N'NH1011', N'LTC0009', N'LD0002', 8)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (78, N'SV0018', N'MH0010', N'HK02', N'NH1011', N'LTC0010', N'LD0002', 9)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (79, N'SV0019', N'MH0001', N'HK02', N'NH1011', N'LTC0001', N'LD0002', 4.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (80, N'SV0020', N'MH0002', N'HK02', N'NH1011', N'LTC0002', N'LD0002', 5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (82, N'SV0002', N'MH0005', N'HK01', N'NH1112', N'LTC0005', N'LD0002', 2)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (83, N'SV0003', N'MH0006', N'HK01', N'NH1112', N'LTC0006', N'LD0002', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (84, N'SV0004', N'MH0007', N'HK01', N'NH1112', N'LTC0007', N'LD0002', 0.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (85, N'SV0005', N'MH0008', N'HK01', N'NH1112', N'LTC0008', N'LD0002', 1)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (86, N'SV0006', N'MH0009', N'HK01', N'NH1112', N'LTC0009', N'LD0002', 3.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (87, N'SV0007', N'MH0010', N'HK01', N'NH1112', N'LTC0010', N'LD0002', 0.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (88, N'SV0008', N'MH0001', N'HK01', N'NH1112', N'LTC0001', N'LD0002', 8.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (89, N'SV0009', N'MH0002', N'HK01', N'NH1112', N'LTC0002', N'LD0002', 6)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (90, N'SV0010', N'MH0003', N'HK01', N'NH1112', N'LTC0003', N'LD0002', 8.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (91, N'SV0011', N'MH0004', N'HK01', N'NH1112', N'LTC0004', N'LD0002', 1.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (92, N'SV0012', N'MH0005', N'HK01', N'NH1112', N'LTC0005', N'LD0002', 2)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (93, N'SV0013', N'MH0006', N'HK01', N'NH1112', N'LTC0006', N'LD0002', 0.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (94, N'SV0014', N'MH0007', N'HK01', N'NH1112', N'LTC0007', N'LD0002', 5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (95, N'SV0015', N'MH0008', N'HK01', N'NH1112', N'LTC0008', N'LD0002', 10)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (96, N'SV0016', N'MH0009', N'HK01', N'NH1112', N'LTC0009', N'LD0002', 4)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (97, N'SV0017', N'MH0010', N'HK01', N'NH1112', N'LTC0010', N'LD0002', 10)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (98, N'SV0018', N'MH0001', N'HK01', N'NH1112', N'LTC0001', N'LD0002', 6.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (99, N'SV0019', N'MH0002', N'HK01', N'NH1112', N'LTC0002', N'LD0002', 5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (100, N'SV0020', N'MH0003', N'HK01', N'NH1112', N'LTC0003', N'LD0002', 0.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (102, N'SV0002', N'MH0006', N'HK02', N'NH1112', N'LTC0006', N'LD0002', 9.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (103, N'SV0003', N'MH0007', N'HK02', N'NH1112', N'LTC0007', N'LD0002', 1.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (104, N'SV0004', N'MH0008', N'HK02', N'NH1112', N'LTC0008', N'LD0002', 8.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (105, N'SV0005', N'MH0009', N'HK02', N'NH1112', N'LTC0009', N'LD0002', 4)
GO
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (106, N'SV0006', N'MH0010', N'HK02', N'NH1112', N'LTC0010', N'LD0002', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (107, N'SV0007', N'MH0001', N'HK02', N'NH1112', N'LTC0001', N'LD0002', 4.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (108, N'SV0008', N'MH0002', N'HK02', N'NH1112', N'LTC0002', N'LD0002', 2)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (109, N'SV0009', N'MH0003', N'HK02', N'NH1112', N'LTC0003', N'LD0002', 5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (110, N'SV0010', N'MH0004', N'HK02', N'NH1112', N'LTC0004', N'LD0002', 1)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (111, N'SV0011', N'MH0005', N'HK02', N'NH1112', N'LTC0005', N'LD0002', 3)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (112, N'SV0012', N'MH0006', N'HK02', N'NH1112', N'LTC0006', N'LD0002', 10)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (113, N'SV0013', N'MH0007', N'HK02', N'NH1112', N'LTC0007', N'LD0002', 2)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (114, N'SV0014', N'MH0008', N'HK02', N'NH1112', N'LTC0008', N'LD0002', 1.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (115, N'SV0015', N'MH0009', N'HK02', N'NH1112', N'LTC0009', N'LD0002', 6)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (116, N'SV0016', N'MH0010', N'HK02', N'NH1112', N'LTC0010', N'LD0002', 10)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (117, N'SV0017', N'MH0001', N'HK02', N'NH1112', N'LTC0001', N'LD0002', 2.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (118, N'SV0018', N'MH0002', N'HK02', N'NH1112', N'LTC0002', N'LD0002', 0.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (119, N'SV0019', N'MH0003', N'HK02', N'NH1112', N'LTC0003', N'LD0002', 3)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (120, N'SV0020', N'MH0004', N'HK02', N'NH1112', N'LTC0004', N'LD0002', 0.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (122, N'SV0002', N'MH0007', N'HK01', N'NH1213', N'LTC0007', N'LD0002', 5.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (123, N'SV0003', N'MH0008', N'HK01', N'NH1213', N'LTC0008', N'LD0002', 9.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (124, N'SV0004', N'MH0009', N'HK01', N'NH1213', N'LTC0009', N'LD0002', 5.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (125, N'SV0005', N'MH0010', N'HK01', N'NH1213', N'LTC0010', N'LD0002', 2)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (126, N'SV0006', N'MH0001', N'HK01', N'NH1213', N'LTC0001', N'LD0002', 3)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (127, N'SV0007', N'MH0002', N'HK01', N'NH1213', N'LTC0002', N'LD0002', 2)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (128, N'SV0008', N'MH0003', N'HK01', N'NH1213', N'LTC0003', N'LD0002', 8.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (129, N'SV0009', N'MH0004', N'HK01', N'NH1213', N'LTC0004', N'LD0002', 1.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (130, N'SV0010', N'MH0005', N'HK01', N'NH1213', N'LTC0005', N'LD0002', 2)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (131, N'SV0011', N'MH0006', N'HK01', N'NH1213', N'LTC0006', N'LD0002', 3.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (132, N'SV0012', N'MH0007', N'HK01', N'NH1213', N'LTC0007', N'LD0002', 0.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (133, N'SV0013', N'MH0008', N'HK01', N'NH1213', N'LTC0008', N'LD0002', 4.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (134, N'SV0014', N'MH0009', N'HK01', N'NH1213', N'LTC0009', N'LD0002', 4)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (135, N'SV0015', N'MH0010', N'HK01', N'NH1213', N'LTC0010', N'LD0002', 3)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (136, N'SV0016', N'MH0001', N'HK01', N'NH1213', N'LTC0001', N'LD0002', 8.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (137, N'SV0017', N'MH0002', N'HK01', N'NH1213', N'LTC0002', N'LD0002', 6)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (138, N'SV0018', N'MH0003', N'HK01', N'NH1213', N'LTC0003', N'LD0002', 4)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (139, N'SV0019', N'MH0004', N'HK01', N'NH1213', N'LTC0004', N'LD0002', 3.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (140, N'SV0020', N'MH0005', N'HK01', N'NH1213', N'LTC0005', N'LD0002', 2)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (142, N'SV0002', N'MH0008', N'HK02', N'NH1213', N'LTC0008', N'LD0002', 8.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (143, N'SV0003', N'MH0009', N'HK02', N'NH1213', N'LTC0009', N'LD0002', 2)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (144, N'SV0004', N'MH0010', N'HK02', N'NH1213', N'LTC0010', N'LD0002', 6.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (145, N'SV0005', N'MH0001', N'HK02', N'NH1213', N'LTC0001', N'LD0002', 0.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (146, N'SV0006', N'MH0002', N'HK02', N'NH1213', N'LTC0002', N'LD0002', 9.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (147, N'SV0007', N'MH0003', N'HK02', N'NH1213', N'LTC0003', N'LD0002', 10)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (148, N'SV0008', N'MH0004', N'HK02', N'NH1213', N'LTC0004', N'LD0002', 2.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (149, N'SV0009', N'MH0005', N'HK02', N'NH1213', N'LTC0005', N'LD0002', 10)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (150, N'SV0010', N'MH0006', N'HK02', N'NH1213', N'LTC0006', N'LD0002', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (151, N'SV0011', N'MH0007', N'HK02', N'NH1213', N'LTC0007', N'LD0002', 0.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (152, N'SV0012', N'MH0008', N'HK02', N'NH1213', N'LTC0008', N'LD0002', 10)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (153, N'SV0013', N'MH0009', N'HK02', N'NH1213', N'LTC0009', N'LD0002', 1.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (154, N'SV0014', N'MH0010', N'HK02', N'NH1213', N'LTC0010', N'LD0002', 2)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (155, N'SV0015', N'MH0001', N'HK02', N'NH1213', N'LTC0001', N'LD0002', 4.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (156, N'SV0016', N'MH0002', N'HK02', N'NH1213', N'LTC0002', N'LD0002', 8)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (157, N'SV0017', N'MH0003', N'HK02', N'NH1213', N'LTC0003', N'LD0002', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (158, N'SV0018', N'MH0004', N'HK02', N'NH1213', N'LTC0004', N'LD0002', 0.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (159, N'SV0019', N'MH0005', N'HK02', N'NH1213', N'LTC0005', N'LD0002', 4)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (160, N'SV0020', N'MH0006', N'HK02', N'NH1213', N'LTC0006', N'LD0002', 8)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (162, N'SV0002', N'MH0002', N'HK01', N'NH0910', N'LTC0002', N'LD0001', 4)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (163, N'SV0003', N'MH0003', N'HK01', N'NH0910', N'LTC0003', N'LD0001', 8)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (164, N'SV0004', N'MH0004', N'HK01', N'NH0910', N'LTC0004', N'LD0001', 5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (165, N'SV0005', N'MH0005', N'HK01', N'NH0910', N'LTC0005', N'LD0001', 3)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (166, N'SV0006', N'MH0006', N'HK01', N'NH0910', N'LTC0006', N'LD0001', 8)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (167, N'SV0007', N'MH0007', N'HK01', N'NH0910', N'LTC0007', N'LD0001', 10)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (168, N'SV0008', N'MH0008', N'HK01', N'NH0910', N'LTC0008', N'LD0001', 10)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (169, N'SV0009', N'MH0009', N'HK01', N'NH0910', N'LTC0009', N'LD0001', 3)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (170, N'SV0010', N'MH0010', N'HK01', N'NH0910', N'LTC0010', N'LD0001', 8)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (171, N'SV0011', N'MH0001', N'HK01', N'NH0910', N'LTC0001', N'LD0001', 3)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (172, N'SV0012', N'MH0002', N'HK01', N'NH0910', N'LTC0002', N'LD0001', 4.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (173, N'SV0013', N'MH0003', N'HK01', N'NH0910', N'LTC0003', N'LD0001', 1)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (174, N'SV0014', N'MH0004', N'HK01', N'NH0910', N'LTC0004', N'LD0001', 1.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (175, N'SV0015', N'MH0005', N'HK01', N'NH0910', N'LTC0005', N'LD0001', 2.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (176, N'SV0016', N'MH0006', N'HK01', N'NH0910', N'LTC0006', N'LD0001', 10)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (177, N'SV0017', N'MH0007', N'HK01', N'NH0910', N'LTC0007', N'LD0001', 7)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (178, N'SV0018', N'MH0008', N'HK01', N'NH0910', N'LTC0008', N'LD0001', 5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (179, N'SV0019', N'MH0009', N'HK01', N'NH0910', N'LTC0009', N'LD0001', 1.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (180, N'SV0020', N'MH0010', N'HK01', N'NH0910', N'LTC0010', N'LD0001', 3)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (182, N'SV0002', N'MH0003', N'HK02', N'NH0910', N'LTC0003', N'LD0001', 7)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (183, N'SV0003', N'MH0004', N'HK02', N'NH0910', N'LTC0004', N'LD0001', 8.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (184, N'SV0004', N'MH0005', N'HK02', N'NH0910', N'LTC0005', N'LD0001', 3)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (185, N'SV0005', N'MH0006', N'HK02', N'NH0910', N'LTC0006', N'LD0001', 5.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (186, N'SV0006', N'MH0007', N'HK02', N'NH0910', N'LTC0007', N'LD0001', 10)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (187, N'SV0007', N'MH0008', N'HK02', N'NH0910', N'LTC0008', N'LD0001', 9)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (188, N'SV0008', N'MH0009', N'HK02', N'NH0910', N'LTC0009', N'LD0001', 1.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (189, N'SV0009', N'MH0010', N'HK02', N'NH0910', N'LTC0010', N'LD0001', 4)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (190, N'SV0010', N'MH0001', N'HK02', N'NH0910', N'LTC0001', N'LD0001', 5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (191, N'SV0011', N'MH0002', N'HK02', N'NH0910', N'LTC0002', N'LD0001', 6.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (192, N'SV0012', N'MH0003', N'HK02', N'NH0910', N'LTC0003', N'LD0001', 9)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (193, N'SV0013', N'MH0004', N'HK02', N'NH0910', N'LTC0004', N'LD0001', 9.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (194, N'SV0014', N'MH0005', N'HK02', N'NH0910', N'LTC0005', N'LD0001', 7)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (195, N'SV0015', N'MH0006', N'HK02', N'NH0910', N'LTC0006', N'LD0001', 2)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (196, N'SV0016', N'MH0007', N'HK02', N'NH0910', N'LTC0007', N'LD0001', 4)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (197, N'SV0017', N'MH0008', N'HK02', N'NH0910', N'LTC0008', N'LD0001', 9.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (198, N'SV0018', N'MH0009', N'HK02', N'NH0910', N'LTC0009', N'LD0001', 8.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (199, N'SV0019', N'MH0010', N'HK02', N'NH0910', N'LTC0010', N'LD0001', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (200, N'SV0020', N'MH0001', N'HK02', N'NH0910', N'LTC0001', N'LD0001', 10)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (202, N'SV0002', N'MH0004', N'HK01', N'NH1011', N'LTC0004', N'LD0001', 0.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (203, N'SV0003', N'MH0005', N'HK01', N'NH1011', N'LTC0005', N'LD0001', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (204, N'SV0004', N'MH0006', N'HK01', N'NH1011', N'LTC0006', N'LD0001', 2.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (205, N'SV0005', N'MH0007', N'HK01', N'NH1011', N'LTC0007', N'LD0001', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (206, N'SV0006', N'MH0008', N'HK01', N'NH1011', N'LTC0008', N'LD0001', 9.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (207, N'SV0007', N'MH0009', N'HK01', N'NH1011', N'LTC0009', N'LD0001', 2)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (208, N'SV0008', N'MH0010', N'HK01', N'NH1011', N'LTC0010', N'LD0001', 9.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (209, N'SV0009', N'MH0001', N'HK01', N'NH1011', N'LTC0001', N'LD0001', 5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (210, N'SV0010', N'MH0002', N'HK01', N'NH1011', N'LTC0002', N'LD0001', 5.5)
GO
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (211, N'SV0011', N'MH0003', N'HK01', N'NH1011', N'LTC0003', N'LD0001', 9.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (212, N'SV0012', N'MH0004', N'HK01', N'NH1011', N'LTC0004', N'LD0001', 4)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (213, N'SV0013', N'MH0005', N'HK01', N'NH1011', N'LTC0005', N'LD0001', 6)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (214, N'SV0014', N'MH0006', N'HK01', N'NH1011', N'LTC0006', N'LD0001', 2)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (215, N'SV0015', N'MH0007', N'HK01', N'NH1011', N'LTC0007', N'LD0001', 4.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (216, N'SV0016', N'MH0008', N'HK01', N'NH1011', N'LTC0008', N'LD0001', 7)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (217, N'SV0017', N'MH0009', N'HK01', N'NH1011', N'LTC0009', N'LD0001', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (218, N'SV0018', N'MH0010', N'HK01', N'NH1011', N'LTC0010', N'LD0001', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (219, N'SV0019', N'MH0001', N'HK01', N'NH1011', N'LTC0001', N'LD0001', 10)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (220, N'SV0020', N'MH0002', N'HK01', N'NH1011', N'LTC0002', N'LD0001', 0.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (222, N'SV0002', N'MH0004', N'HK02', N'NH1011', N'LTC0004', N'LD0001', 4.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (223, N'SV0003', N'MH0005', N'HK02', N'NH1011', N'LTC0005', N'LD0001', 4.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (224, N'SV0004', N'MH0006', N'HK02', N'NH1011', N'LTC0006', N'LD0001', 5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (225, N'SV0005', N'MH0007', N'HK02', N'NH1011', N'LTC0007', N'LD0001', 4.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (226, N'SV0006', N'MH0008', N'HK02', N'NH1011', N'LTC0008', N'LD0001', 1)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (227, N'SV0007', N'MH0009', N'HK02', N'NH1011', N'LTC0009', N'LD0001', 6)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (228, N'SV0008', N'MH0010', N'HK02', N'NH1011', N'LTC0010', N'LD0001', 7)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (229, N'SV0009', N'MH0001', N'HK02', N'NH1011', N'LTC0001', N'LD0001', 6.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (230, N'SV0010', N'MH0002', N'HK02', N'NH1011', N'LTC0002', N'LD0001', 10)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (231, N'SV0011', N'MH0003', N'HK02', N'NH1011', N'LTC0003', N'LD0001', 1.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (232, N'SV0012', N'MH0004', N'HK02', N'NH1011', N'LTC0004', N'LD0001', 5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (233, N'SV0013', N'MH0005', N'HK02', N'NH1011', N'LTC0005', N'LD0001', 8)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (234, N'SV0014', N'MH0006', N'HK02', N'NH1011', N'LTC0006', N'LD0001', 5.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (235, N'SV0015', N'MH0007', N'HK02', N'NH1011', N'LTC0007', N'LD0001', 8)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (236, N'SV0016', N'MH0008', N'HK02', N'NH1011', N'LTC0008', N'LD0001', 4)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (237, N'SV0017', N'MH0009', N'HK02', N'NH1011', N'LTC0009', N'LD0001', 2.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (238, N'SV0018', N'MH0010', N'HK02', N'NH1011', N'LTC0010', N'LD0001', 9.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (239, N'SV0019', N'MH0001', N'HK02', N'NH1011', N'LTC0001', N'LD0001', 9)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (240, N'SV0020', N'MH0002', N'HK02', N'NH1011', N'LTC0002', N'LD0001', 3)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (242, N'SV0002', N'MH0005', N'HK01', N'NH1112', N'LTC0005', N'LD0001', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (243, N'SV0003', N'MH0006', N'HK01', N'NH1112', N'LTC0006', N'LD0001', 9)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (244, N'SV0004', N'MH0007', N'HK01', N'NH1112', N'LTC0007', N'LD0001', 7)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (245, N'SV0005', N'MH0008', N'HK01', N'NH1112', N'LTC0008', N'LD0001', 8)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (246, N'SV0006', N'MH0009', N'HK01', N'NH1112', N'LTC0009', N'LD0001', 5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (247, N'SV0007', N'MH0010', N'HK01', N'NH1112', N'LTC0010', N'LD0001', 5.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (248, N'SV0008', N'MH0001', N'HK01', N'NH1112', N'LTC0001', N'LD0001', 4.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (249, N'SV0009', N'MH0002', N'HK01', N'NH1112', N'LTC0002', N'LD0001', 4)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (250, N'SV0010', N'MH0003', N'HK01', N'NH1112', N'LTC0003', N'LD0001', 0.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (251, N'SV0011', N'MH0004', N'HK01', N'NH1112', N'LTC0004', N'LD0001', 9)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (252, N'SV0012', N'MH0005', N'HK01', N'NH1112', N'LTC0005', N'LD0001', 1.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (253, N'SV0013', N'MH0006', N'HK01', N'NH1112', N'LTC0006', N'LD0001', 2.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (254, N'SV0014', N'MH0007', N'HK01', N'NH1112', N'LTC0007', N'LD0001', 8)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (255, N'SV0015', N'MH0008', N'HK01', N'NH1112', N'LTC0008', N'LD0001', 4.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (256, N'SV0016', N'MH0009', N'HK01', N'NH1112', N'LTC0009', N'LD0001', 1)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (257, N'SV0017', N'MH0010', N'HK01', N'NH1112', N'LTC0010', N'LD0001', 4)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (258, N'SV0018', N'MH0001', N'HK01', N'NH1112', N'LTC0001', N'LD0001', 2)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (259, N'SV0019', N'MH0002', N'HK01', N'NH1112', N'LTC0002', N'LD0001', 1)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (260, N'SV0020', N'MH0003', N'HK01', N'NH1112', N'LTC0003', N'LD0001', 6.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (262, N'SV0002', N'MH0006', N'HK02', N'NH1112', N'LTC0006', N'LD0001', 8.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (263, N'SV0003', N'MH0007', N'HK02', N'NH1112', N'LTC0007', N'LD0001', 5.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (264, N'SV0004', N'MH0008', N'HK02', N'NH1112', N'LTC0008', N'LD0001', 2.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (265, N'SV0005', N'MH0009', N'HK02', N'NH1112', N'LTC0009', N'LD0001', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (266, N'SV0006', N'MH0010', N'HK02', N'NH1112', N'LTC0010', N'LD0001', 6.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (267, N'SV0007', N'MH0001', N'HK02', N'NH1112', N'LTC0001', N'LD0001', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (268, N'SV0008', N'MH0002', N'HK02', N'NH1112', N'LTC0002', N'LD0001', 5.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (269, N'SV0009', N'MH0003', N'HK02', N'NH1112', N'LTC0003', N'LD0001', 6)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (270, N'SV0010', N'MH0004', N'HK02', N'NH1112', N'LTC0004', N'LD0001', 4.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (271, N'SV0011', N'MH0005', N'HK02', N'NH1112', N'LTC0005', N'LD0001', 4)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (272, N'SV0012', N'MH0006', N'HK02', N'NH1112', N'LTC0006', N'LD0001', 8)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (273, N'SV0013', N'MH0007', N'HK02', N'NH1112', N'LTC0007', N'LD0001', 4.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (274, N'SV0014', N'MH0008', N'HK02', N'NH1112', N'LTC0008', N'LD0001', 4.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (275, N'SV0015', N'MH0009', N'HK02', N'NH1112', N'LTC0009', N'LD0001', 1)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (276, N'SV0016', N'MH0010', N'HK02', N'NH1112', N'LTC0010', N'LD0001', 1)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (277, N'SV0017', N'MH0001', N'HK02', N'NH1112', N'LTC0001', N'LD0001', 6)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (278, N'SV0018', N'MH0002', N'HK02', N'NH1112', N'LTC0002', N'LD0001', 6.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (279, N'SV0019', N'MH0003', N'HK02', N'NH1112', N'LTC0003', N'LD0001', 4)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (280, N'SV0020', N'MH0004', N'HK02', N'NH1112', N'LTC0004', N'LD0001', 5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (282, N'SV0002', N'MH0007', N'HK01', N'NH1213', N'LTC0007', N'LD0001', 4.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (283, N'SV0003', N'MH0008', N'HK01', N'NH1213', N'LTC0008', N'LD0001', 1)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (284, N'SV0004', N'MH0009', N'HK01', N'NH1213', N'LTC0009', N'LD0001', 4)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (285, N'SV0005', N'MH0010', N'HK01', N'NH1213', N'LTC0010', N'LD0001', 2.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (286, N'SV0006', N'MH0001', N'HK01', N'NH1213', N'LTC0001', N'LD0001', 0.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (287, N'SV0007', N'MH0002', N'HK01', N'NH1213', N'LTC0002', N'LD0001', 8)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (288, N'SV0008', N'MH0003', N'HK01', N'NH1213', N'LTC0003', N'LD0001', 8)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (289, N'SV0009', N'MH0004', N'HK01', N'NH1213', N'LTC0004', N'LD0001', 10)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (290, N'SV0010', N'MH0005', N'HK01', N'NH1213', N'LTC0005', N'LD0001', 3)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (291, N'SV0011', N'MH0006', N'HK01', N'NH1213', N'LTC0006', N'LD0001', 5.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (292, N'SV0012', N'MH0007', N'HK01', N'NH1213', N'LTC0007', N'LD0001', 2.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (293, N'SV0013', N'MH0008', N'HK01', N'NH1213', N'LTC0008', N'LD0001', 10)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (294, N'SV0014', N'MH0009', N'HK01', N'NH1213', N'LTC0009', N'LD0001', 9)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (295, N'SV0015', N'MH0010', N'HK01', N'NH1213', N'LTC0010', N'LD0001', 9.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (296, N'SV0016', N'MH0001', N'HK01', N'NH1213', N'LTC0001', N'LD0001', 0.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (297, N'SV0017', N'MH0002', N'HK01', N'NH1213', N'LTC0002', N'LD0001', 1)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (298, N'SV0018', N'MH0003', N'HK01', N'NH1213', N'LTC0003', N'LD0001', 4.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (299, N'SV0019', N'MH0004', N'HK01', N'NH1213', N'LTC0004', N'LD0001', 4)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (300, N'SV0020', N'MH0005', N'HK01', N'NH1213', N'LTC0005', N'LD0001', 6)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (302, N'SV0002', N'MH0008', N'HK02', N'NH1213', N'LTC0008', N'LD0001', 1)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (303, N'SV0003', N'MH0009', N'HK02', N'NH1213', N'LTC0009', N'LD0001', 6)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (304, N'SV0004', N'MH0010', N'HK02', N'NH1213', N'LTC0010', N'LD0001', 5.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (305, N'SV0005', N'MH0001', N'HK02', N'NH1213', N'LTC0001', N'LD0001', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (306, N'SV0006', N'MH0002', N'HK02', N'NH1213', N'LTC0002', N'LD0001', 9)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (307, N'SV0007', N'MH0003', N'HK02', N'NH1213', N'LTC0003', N'LD0001', 0.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (308, N'SV0008', N'MH0004', N'HK02', N'NH1213', N'LTC0004', N'LD0001', 9)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (309, N'SV0009', N'MH0005', N'HK02', N'NH1213', N'LTC0005', N'LD0001', 7)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (310, N'SV0010', N'MH0006', N'HK02', N'NH1213', N'LTC0006', N'LD0001', 4)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (311, N'SV0011', N'MH0007', N'HK02', N'NH1213', N'LTC0007', N'LD0001', 8)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (312, N'SV0012', N'MH0008', N'HK02', N'NH1213', N'LTC0008', N'LD0001', 6)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (313, N'SV0013', N'MH0009', N'HK02', N'NH1213', N'LTC0009', N'LD0001', 1.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (314, N'SV0014', N'MH0010', N'HK02', N'NH1213', N'LTC0010', N'LD0001', 8.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (315, N'SV0015', N'MH0001', N'HK02', N'NH1213', N'LTC0001', N'LD0001', 4)
GO
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (316, N'SV0016', N'MH0002', N'HK02', N'NH1213', N'LTC0002', N'LD0001', 6.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (317, N'SV0017', N'MH0003', N'HK02', N'NH1213', N'LTC0003', N'LD0001', 10)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (318, N'SV0018', N'MH0004', N'HK02', N'NH1213', N'LTC0004', N'LD0001', 3.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (319, N'SV0019', N'MH0005', N'HK02', N'NH1213', N'LTC0005', N'LD0001', 2)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (320, N'SV0020', N'MH0006', N'HK02', N'NH1213', N'LTC0006', N'LD0001', 3.5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (333, N'SV0026', N'MH0001', N'HK01', N'NH0910', N'LTC0001', N'LD0001', 6)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (334, N'SV0026', N'MH0001', N'HK01', N'NH0910', N'LTC0001', N'LD0002', 4)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (339, N'SV0024', N'MH0001', N'HK01', N'NH0910', N'LTC0001', N'LD0001', NULL)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (340, N'SV0024', N'MH0001', N'HK01', N'NH0910', N'LTC0001', N'LD0002', NULL)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (341, N'SV0006', N'MH0002', N'HK01', N'NH0910', N'LTC0002', N'LD0001', 3)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (342, N'SV0006', N'MH0002', N'HK01', N'NH0910', N'LTC0002', N'LD0002', 8)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (343, N'SV0011', N'MH0002', N'HK01', N'NH0910', N'LTC0002', N'LD0001', 2)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (344, N'SV0011', N'MH0002', N'HK01', N'NH0910', N'LTC0002', N'LD0002', 9)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (345, N'SV0022', N'MH0002', N'HK01', N'NH0910', N'LTC0002', N'LD0001', 4)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (346, N'SV0022', N'MH0002', N'HK01', N'NH0910', N'LTC0002', N'LD0002', 3)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (347, N'SV0036', N'MH0002', N'HK01', N'NH0910', N'LTC0002', N'LD0001', 5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (348, N'SV0036', N'MH0002', N'HK01', N'NH0910', N'LTC0002', N'LD0002', 2)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (349, N'SV0051', N'MH0010', N'HK01', N'NH1314', N'LTC0001', N'LD0001', 1)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (350, N'SV0051', N'MH0010', N'HK01', N'NH1314', N'LTC0001', N'LD0002', 2)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (351, N'SV0050', N'MH0010', N'HK01', N'NH1314', N'LTC0001', N'LD0001', 3)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (352, N'SV0050', N'MH0010', N'HK01', N'NH1314', N'LTC0001', N'LD0002', 4)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (353, N'SV0049', N'MH0010', N'HK01', N'NH1314', N'LTC0001', N'LD0001', 5)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (354, N'SV0049', N'MH0010', N'HK01', N'NH1314', N'LTC0001', N'LD0002', 6)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (355, N'SV0051', N'MH0010', N'HK02', N'NH1314', N'LTC0001', N'LD0001', NULL)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (356, N'SV0051', N'MH0010', N'HK02', N'NH1314', N'LTC0001', N'LD0002', NULL)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (357, N'SV0050', N'MH0010', N'HK02', N'NH1314', N'LTC0001', N'LD0001', NULL)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (358, N'SV0050', N'MH0010', N'HK02', N'NH1314', N'LTC0001', N'LD0002', NULL)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (359, N'SV0001', N'MH0010', N'HK01', N'NH1314', N'LTC0001', N'LD0001', NULL)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (360, N'SV0001', N'MH0010', N'HK01', N'NH1314', N'LTC0001', N'LD0002', NULL)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (371, N'SV0055', N'MH0004', N'HK01', N'NH1415', N'LTC0001', N'LD0001', NULL)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (372, N'SV0055', N'MH0004', N'HK01', N'NH1415', N'LTC0001', N'LD0002', NULL)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (373, N'SV0001', N'MH0004', N'HK01', N'NH1415', N'LTC0001', N'LD0001', NULL)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (374, N'SV0001', N'MH0004', N'HK01', N'NH1415', N'LTC0001', N'LD0002', NULL)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (375, N'SV0001', N'MH0004', N'HK01', N'NH1415', N'LTC0001', N'LD0001', NULL)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (376, N'SV0001', N'MH0004', N'HK01', N'NH1415', N'LTC0001', N'LD0002', NULL)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (381, N'SV0001', N'MH0004', N'HK02', N'NH1415', N'LTC0001', N'LD0001', NULL)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (382, N'SV0001', N'MH0004', N'HK02', N'NH1415', N'LTC0001', N'LD0002', NULL)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (383, N'SV0001', N'MH0004', N'HK02', N'NH1415', N'LTC0001', N'LD0001', NULL)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (384, N'SV0001', N'MH0004', N'HK02', N'NH1415', N'LTC0001', N'LD0002', NULL)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (385, N'SV0001', N'MH0004', N'HK02', N'NH1415', N'LTC0001', N'LD0001', NULL)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (386, N'SV0001', N'MH0004', N'HK02', N'NH1415', N'LTC0001', N'LD0002', NULL)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (399, N'SV0002', N'MH0004', N'HK02', N'NH1415', N'LTC0001', N'LD0001', NULL)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (400, N'SV0002', N'MH0004', N'HK02', N'NH1415', N'LTC0001', N'LD0002', NULL)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (401, N'SV0003', N'MH0004', N'HK02', N'NH1415', N'LTC0001', N'LD0001', NULL)
INSERT [dbo].[DIEM] ([STT], [MaSINHVIEN], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLopTC], [MaLoai], [Diem]) VALUES (402, N'SV0003', N'MH0004', N'HK02', N'NH1415', N'LTC0001', N'LD0002', NULL)
SET IDENTITY_INSERT [dbo].[DIEM] OFF
INSERT [dbo].[GIANGVIEN] ([MaGIANGVIEN], [TenGIANGVIEN], [GioiTinh], [DiaChi], [DienThoai], [MaMonHoc], [MaHocVi], [MaLoaiGV]) VALUES (N'GV0001', N'Nguyễn Minh Thái', 0, N'100 Trần Hưng Đạo, Long Xuyên', N'0975058876', N'MH0001', N'HV0001', N'GV001')
INSERT [dbo].[GIANGVIEN] ([MaGIANGVIEN], [TenGIANGVIEN], [GioiTinh], [DiaChi], [DienThoai], [MaMonHoc], [MaHocVi], [MaLoaiGV]) VALUES (N'GV0002', N'Phan Thị Hồng Nhung', 1, N'Thành Phố Hồ Chí Minh', N'0976630315', N'MH0002', N'HV0002', N'GV001')
INSERT [dbo].[GIANGVIEN] ([MaGIANGVIEN], [TenGIANGVIEN], [GioiTinh], [DiaChi], [DienThoai], [MaMonHoc], [MaHocVi], [MaLoaiGV]) VALUES (N'GV0003', N'Huỳnh Thanh Trúc', 0, N'10C Nguyễn Trung Trực - Châu Đốc', N'0699015456', N'MH0003', N'HV0003', N'GV002')
INSERT [dbo].[GIANGVIEN] ([MaGIANGVIEN], [TenGIANGVIEN], [GioiTinh], [DiaChi], [DienThoai], [MaMonHoc], [MaHocVi], [MaLoaiGV]) VALUES (N'GV0004', N'Lâm Trọng Phú', 0, N'Long Biên B - An Phú', N'0845241566', N'MH0004', N'HV0003', N'GV001')
INSERT [dbo].[GIANGVIEN] ([MaGIANGVIEN], [TenGIANGVIEN], [GioiTinh], [DiaChi], [DienThoai], [MaMonHoc], [MaHocVi], [MaLoaiGV]) VALUES (N'GV0005', N'Phan Thị Cẩm Trang', 1, N'Rạch Giá - Kiên Giang', N'0123456789', N'MH0005', N'HV0003', N'GV002')
INSERT [dbo].[GIANGVIEN] ([MaGIANGVIEN], [TenGIANGVIEN], [GioiTinh], [DiaChi], [DienThoai], [MaMonHoc], [MaHocVi], [MaLoaiGV]) VALUES (N'GV0006', N'Lê Minh Huân', 0, N'000 Long Xuyên, An Giang', N'0123456789', N'MH0006', N'HV0003', N'GV001')
INSERT [dbo].[GIANGVIEN] ([MaGIANGVIEN], [TenGIANGVIEN], [GioiTinh], [DiaChi], [DienThoai], [MaMonHoc], [MaHocVi], [MaLoaiGV]) VALUES (N'GV0007', N'Nguyễn Thị Thủy', 1, N'Thành Phố Hồ Chí Minh', N'0932734735', N'MH0007', N'HV0003', N'GV002')
INSERT [dbo].[GIANGVIEN] ([MaGIANGVIEN], [TenGIANGVIEN], [GioiTinh], [DiaChi], [DienThoai], [MaMonHoc], [MaHocVi], [MaLoaiGV]) VALUES (N'GV0008', N'Nguyễn Thị Thu', 1, N'Thành Phố Hồ Chí Minh', N'0938561234', N'MH0008', N'HV0003', N'GV001')
INSERT [dbo].[GIANGVIEN] ([MaGIANGVIEN], [TenGIANGVIEN], [GioiTinh], [DiaChi], [DienThoai], [MaMonHoc], [MaHocVi], [MaLoaiGV]) VALUES (N'GV0009', N'Nguyễn Thị Hoa', 1, N'Thành Phố Hồ Chí Minh', N'0967493053', N'MH0009', N'HV0003', N'GV001')
INSERT [dbo].[GIANGVIEN] ([MaGIANGVIEN], [TenGIANGVIEN], [GioiTinh], [DiaChi], [DienThoai], [MaMonHoc], [MaHocVi], [MaLoaiGV]) VALUES (N'GV0010', N'Nguyễn Thị Hương', 1, N'Thành Phố Hồ Chí Minh', N'0919648359', N'MH0010', N'HV0003', N'GV002')
INSERT [dbo].[HANHKIEM] ([MaHanhKiem], [TenHanhKiem]) VALUES (N'HK0001', N'Tốt')
INSERT [dbo].[HANHKIEM] ([MaHanhKiem], [TenHanhKiem]) VALUES (N'HK0002', N'Khá')
INSERT [dbo].[HANHKIEM] ([MaHanhKiem], [TenHanhKiem]) VALUES (N'HK0003', N'Trung Bình')
INSERT [dbo].[HANHKIEM] ([MaHanhKiem], [TenHanhKiem]) VALUES (N'HK0004', N'Yếu')
INSERT [dbo].[HOCKY] ([MaHocKy], [TenHocKy]) VALUES (N'HK01', N'Học kỳ 1')
INSERT [dbo].[HOCKY] ([MaHocKy], [TenHocKy]) VALUES (N'HK02', N'Học kỳ 2')
INSERT [dbo].[HOCKY] ([MaHocKy], [TenHocKy]) VALUES (N'HK03', N'Học kỳ 3')
INSERT [dbo].[HOCLUC] ([MaHocLuc], [TenHocLuc], [DiemCanDuoi], [DiemCanTren]) VALUES (N'HL0001', N'A', 8.5, 10)
INSERT [dbo].[HOCLUC] ([MaHocLuc], [TenHocLuc], [DiemCanDuoi], [DiemCanTren]) VALUES (N'HL0002', N'B', 7, 8.4)
INSERT [dbo].[HOCLUC] ([MaHocLuc], [TenHocLuc], [DiemCanDuoi], [DiemCanTren]) VALUES (N'HL0003', N'C', 5.5, 6.9)
INSERT [dbo].[HOCLUC] ([MaHocLuc], [TenHocLuc], [DiemCanDuoi], [DiemCanTren]) VALUES (N'HL0004', N'D', 4, 5.4)
INSERT [dbo].[HOCLUC] ([MaHocLuc], [TenHocLuc], [DiemCanDuoi], [DiemCanTren]) VALUES (N'HL0005', N'F', 0, 3.9)
INSERT [dbo].[HOCVI] ([MAHOCVI], [TENHOCVI]) VALUES (N'HV0001', N'Tiến Sĩ')
INSERT [dbo].[HOCVI] ([MAHOCVI], [TENHOCVI]) VALUES (N'HV0002', N'Tiến Sĩ Khoa Học')
INSERT [dbo].[HOCVI] ([MAHOCVI], [TENHOCVI]) VALUES (N'HV0003', N'Thạc Sĩ')
INSERT [dbo].[HOCVI] ([MAHOCVI], [TENHOCVI]) VALUES (N'HV0004', N'Cử Nhân')
INSERT [dbo].[KETQUA] ([MaKetQua], [TenKetQua], [DiemCanDuoi], [DiemCanTren]) VALUES (N'KQ0001', N'Đậu', 4, 10)
INSERT [dbo].[KETQUA] ([MaKetQua], [TenKetQua], [DiemCanDuoi], [DiemCanTren]) VALUES (N'KQ0002', N'Học lại', 0, 3.9)
INSERT [dbo].[KHOA] ([MaKhoa], [TenKhoa], [SDT]) VALUES (N'KCNTT', N'Khoa Công Nghệ Thông Tin', N'082345670')
INSERT [dbo].[KHOA] ([MaKhoa], [TenKhoa], [SDT]) VALUES (N'KDTVT', N'Khoa Điện Tử Viễn Thông', N'082345672')
INSERT [dbo].[KHOA] ([MaKhoa], [TenKhoa], [SDT]) VALUES (N'KQTKD', N'Khoa Quản Trị Kinh Doanh', N'082345673')
INSERT [dbo].[KHOA] ([MaKhoa], [TenKhoa], [SDT]) VALUES (N'KTCNH', N'Khoa Tài Chính Ngân Hàng', N'082345671')
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0001', N'CNPM0912', N'NH0910', N'HL0005', N'HK0001', 2)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0001', N'CNPM0912', N'NH1011', N'HL0003', N'HK0001', 5.8)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0001', N'CNPM0912', N'NH1112', N'HL0004', N'HK0001', 4.2)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0001', N'CNPM0912', N'NH1213', N'HL0002', N'HK0001', 7.9)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0001', N'CNPM0912', N'NH1415', N'HL0001', N'HK0001', 10)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0002', N'CNPM1013', N'NH0910', N'HL0004', N'HK0001', 4.1)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0002', N'CNPM1013', N'NH1011', N'HL0003', N'HK0001', 6.9)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0002', N'CNPM1013', N'NH1112', N'HL0003', N'HK0001', 6.4)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0002', N'CNPM1013', N'NH1213', N'HL0003', N'HK0001', 5.8)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0002', N'CNPM1013', N'NH1415', N'HL0001', N'HK0001', 10)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0003', N'DTVT0912', N'NH0910', N'HL0003', N'HK0001', 6.9)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0003', N'DTVT0912', N'NH1011', N'HL0004', N'HK0001', 4.6)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0003', N'DTVT0912', N'NH1112', N'HL0004', N'HK0001', 5.3)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0003', N'DTVT0912', N'NH1213', N'HL0004', N'HK0001', 5.1)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0004', N'DTVT1013', N'NH0910', N'HL0003', N'HK0001', 6.1)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0004', N'DTVT1013', N'NH1011', N'HL0004', N'HK0001', 4)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0004', N'DTVT1013', N'NH1112', N'HL0004', N'HK0001', 4.6)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0004', N'DTVT1013', N'NH1213', N'HL0003', N'HK0001', 5.6)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0005', N'HTTT1013', N'NH0910', N'HL0003', N'HK0001', 5.8)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0005', N'HTTT1013', N'NH1011', N'HL0003', N'HK0001', 5.9)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0005', N'HTTT1013', N'NH1112', N'HL0004', N'HK0001', 4)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0005', N'HTTT1013', N'NH1213', N'HL0005', N'HK0001', 2.4)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0006', N'MMT0912', N'NH0910', N'HL0002', N'HK0001', 8.2)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0006', N'MMT0912', N'NH1011', N'HL0003', N'HK0001', 6.3)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0006', N'MMT0912', N'NH1112', N'HL0003', N'HK0001', 5.6)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0006', N'MMT0912', N'NH1213', N'HL0003', N'HK0001', 5.8)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0007', N'QTKD0912', N'NH0910', N'HL0003', N'HK0001', 5.7)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0007', N'QTKD0912', N'NH1011', N'HL0005', N'HK0001', 3.6)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0007', N'QTKD0912', N'NH1112', N'HL0005', N'HK0001', 3.7)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0007', N'QTKD0912', N'NH1213', N'HL0003', N'HK0001', 5.5)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0008', N'QTKD1013', N'NH0910', N'HL0004', N'HK0001', 4.6)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0008', N'QTKD1013', N'NH1011', N'HL0004', N'HK0001', 4.8)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0008', N'QTKD1013', N'NH1112', N'HL0004', N'HK0001', 5.2)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0008', N'QTKD1013', N'NH1213', N'HL0003', N'HK0001', 6.4)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0009', N'TCNH0912', N'NH0910', N'HL0005', N'HK0001', 1.8)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0009', N'TCNH0912', N'NH1011', N'HL0004', N'HK0001', 5.4)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0009', N'TCNH0912', N'NH1112', N'HL0005', N'HK0001', 3.8)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0009', N'TCNH0912', N'NH1213', N'HL0003', N'HK0001', 6.5)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0010', N'TCNH1013', N'NH0910', N'HL0003', N'HK0001', 6)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0010', N'TCNH1013', N'NH1011', N'HL0002', N'HK0001', 7.3)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0010', N'TCNH1013', N'NH1112', N'HL0004', N'HK0001', 4)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0010', N'TCNH1013', N'NH1213', N'HL0004', N'HK0001', 4.4)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0011', N'CNPM0912', N'NH0910', N'HL0004', N'HK0001', 4.3)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0011', N'CNPM0912', N'NH1011', N'HL0004', N'HK0001', 4.8)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0011', N'CNPM0912', N'NH1112', N'HL0005', N'HK0001', 3.5)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0011', N'CNPM0912', N'NH1213', N'HL0005', N'HK0001', 3.4)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0012', N'CNPM1013', N'NH0910', N'HL0005', N'HK0001', 2.6)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0012', N'CNPM1013', N'NH1011', N'HL0005', N'HK0001', 3.4)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0012', N'CNPM1013', N'NH1112', N'HL0003', N'HK0001', 5.6)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0012', N'CNPM1013', N'NH1213', N'HL0004', N'HK0001', 5)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0013', N'DTVT0912', N'NH0910', N'HL0004', N'HK0001', 5.4)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0013', N'DTVT0912', N'NH1011', N'HL0003', N'HK0001', 6.3)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0013', N'DTVT0912', N'NH1112', N'HL0005', N'HK0001', 2)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0013', N'DTVT0912', N'NH1213', N'HL0005', N'HK0001', 3.9)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0014', N'DTVT1013', N'NH0910', N'HL0005', N'HK0001', 3.2)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0014', N'DTVT1013', N'NH1011', N'HL0003', N'HK0001', 5.9)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0014', N'DTVT1013', N'NH1112', N'HL0004', N'HK0001', 4.2)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0014', N'DTVT1013', N'NH1213', N'HL0004', N'HK0001', 4.7)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0015', N'HTTT1013', N'NH0910', N'HL0004', N'HK0001', 4)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0015', N'HTTT1013', N'NH1011', N'HL0002', N'HK0001', 7.5)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0015', N'HTTT1013', N'NH1112', N'HL0003', N'HK0001', 6.4)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0015', N'HTTT1013', N'NH1213', N'HL0004', N'HK0001', 4.7)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0016', N'MMT0912', N'NH0910', N'HL0002', N'HK0001', 7.7)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0016', N'MMT0912', N'NH1011', N'HL0004', N'HK0001', 4.3)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0016', N'MMT0912', N'NH1112', N'HL0004', N'HK0001', 5.2)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0016', N'MMT0912', N'NH1213', N'HL0003', N'HK0001', 6.8)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0017', N'QTKD0912', N'NH0910', N'HL0003', N'HK0001', 5.8)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0017', N'QTKD0912', N'NH1011', N'HL0004', N'HK0001', 4.8)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0017', N'QTKD0912', N'NH1112', N'HL0003', N'HK0001', 5.8)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0017', N'QTKD0912', N'NH1213', N'HL0003', N'HK0001', 6.4)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0018', N'QTKD1013', N'NH0910', N'HL0003', N'HK0001', 6.9)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0018', N'QTKD1013', N'NH1011', N'HL0002', N'HK0001', 7.8)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0018', N'QTKD1013', N'NH1112', N'HL0005', N'HK0001', 3.7)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0018', N'QTKD1013', N'NH1213', N'HL0005', N'HK0001', 2.8)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0019', N'TCNH0912', N'NH0910', N'HL0003', N'HK0001', 5.6)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0019', N'TCNH0912', N'NH1011', N'HL0004', N'HK0001', 4.6)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0019', N'TCNH0912', N'NH1112', N'HL0004', N'HK0001', 4.9)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0019', N'TCNH0912', N'NH1213', N'HL0005', N'HK0001', 3.5)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0020', N'TCNH1013', N'NH0910', N'HL0004', N'HK0001', 4)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0020', N'TCNH1013', N'NH1011', N'HL0004', N'HK0001', 4.6)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0020', N'TCNH1013', N'NH1112', N'HL0005', N'HK0001', 2.1)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0020', N'TCNH1013', N'NH1213', N'HL0004', N'HK0001', 4.9)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0022', N'TMDT1013', N'NH0910', NULL, N'HK0001', NULL)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0024', N'TMDT1013', N'NH0910', NULL, N'HK0001', NULL)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0025', N'TMDT1013', N'NH0910', NULL, N'HK0001', NULL)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0026', N'TMDT1013', N'NH0910', NULL, N'HK0001', NULL)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0036', N'TMDT1013', N'NH0910', NULL, N'HK0001', NULL)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0047', N'TMDT1013', N'NH1415', N'HL0002', N'HK0001', 7.5)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0048', N'TMDT0912', N'NH1415', N'HL0002', N'HK0001', 7.5)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0049', N'CNPM0912', N'NH1314', N'HL0005', N'HK0001', 2.9)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0049', N'CNPM0912', N'NH1415', N'HL0002', N'HK0001', 7.5)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0050', N'CNPM0912', N'NH1314', N'HL0005', N'HK0001', 1.9)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0050', N'CNPM0912', N'NH1415', N'HL0002', N'HK0001', 7.5)
INSERT [dbo].[KQ_CA_NAM_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBCaNam]) VALUES (N'SV0051', N'CNPM0912', N'NH1314', N'HL0005', N'HK0001', 0.9)
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0001', N'LTC0001', N'MH0001', N'HK01', N'NH0910', 1.4, N'KQ0002')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0001', N'LTC0001', N'MH0004', N'HK01', N'NH1415', NULL, NULL)
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0001', N'LTC0001', N'MH0004', N'HK02', N'NH1415', NULL, NULL)
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0001', N'LTC0001', N'MH0010', N'HK01', N'NH1314', NULL, NULL)
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0001', N'LTC0002', N'MH0002', N'HK02', N'NH0910', 2.6, N'KQ0002')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0001', N'LTC0003', N'MH0003', N'HK01', N'NH1011', 5.8, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0001', N'LTC0003', N'MH0003', N'HK02', N'NH1011', 5.7, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0001', N'LTC0004', N'MH0004', N'HK01', N'NH1112', 2.6, N'KQ0002')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0001', N'LTC0005', N'MH0005', N'HK02', N'NH1112', 5.8, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0001', N'LTC0006', N'MH0006', N'HK01', N'NH1213', 9.7, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0001', N'LTC0007', N'MH0007', N'HK02', N'NH1213', 6.2, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0002', N'LTC0001', N'MH0004', N'HK02', N'NH1415', NULL, NULL)
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0002', N'LTC0002', N'MH0002', N'HK01', N'NH0910', 4.9, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0002', N'LTC0003', N'MH0003', N'HK02', N'NH0910', 3.2, N'KQ0002')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0002', N'LTC0004', N'MH0004', N'HK01', N'NH1011', 6.5, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0002', N'LTC0004', N'MH0004', N'HK02', N'NH1011', 7.3, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0002', N'LTC0005', N'MH0005', N'HK01', N'NH1112', 3.6, N'KQ0002')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0002', N'LTC0006', N'MH0006', N'HK02', N'NH1112', 9.2, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0002', N'LTC0007', N'MH0007', N'HK01', N'NH1213', 5.2, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0002', N'LTC0008', N'MH0008', N'HK02', N'NH1213', 6.3, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0003', N'LTC0001', N'MH0004', N'HK02', N'NH1415', NULL, NULL)
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0003', N'LTC0003', N'MH0003', N'HK01', N'NH0910', 4.2, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0003', N'LTC0004', N'MH0004', N'HK02', N'NH0910', 9.6, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0003', N'LTC0005', N'MH0005', N'HK01', N'NH1011', 2.6, N'KQ0002')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0003', N'LTC0005', N'MH0005', N'HK02', N'NH1011', 6.6, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0003', N'LTC0006', N'MH0006', N'HK01', N'NH1112', 8, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0003', N'LTC0007', N'MH0007', N'HK02', N'NH1112', 2.7, N'KQ0002')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0003', N'LTC0008', N'MH0008', N'HK01', N'NH1213', 7, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0003', N'LTC0009', N'MH0009', N'HK02', N'NH1213', 3.2, N'KQ0002')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0004', N'LTC0004', N'MH0004', N'HK01', N'NH0910', 7.1, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0004', N'LTC0005', N'MH0005', N'HK02', N'NH0910', 5.1, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0004', N'LTC0006', N'MH0006', N'HK01', N'NH1011', 1.1, N'KQ0002')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0004', N'LTC0006', N'MH0006', N'HK02', N'NH1011', 6.8, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0004', N'LTC0007', N'MH0007', N'HK01', N'NH1112', 2.5, N'KQ0002')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0004', N'LTC0008', N'MH0008', N'HK02', N'NH1112', 6.7, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0004', N'LTC0009', N'MH0009', N'HK01', N'NH1213', 5, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0004', N'LTC0010', N'MH0010', N'HK02', N'NH1213', 6.2, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0005', N'LTC0001', N'MH0001', N'HK02', N'NH1213', 2.6, N'KQ0002')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0005', N'LTC0005', N'MH0005', N'HK01', N'NH0910', 5.8, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0005', N'LTC0006', N'MH0006', N'HK02', N'NH0910', 5.8, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0005', N'LTC0007', N'MH0007', N'HK01', N'NH1011', 9.3, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0005', N'LTC0007', N'MH0007', N'HK02', N'NH1011', 2.4, N'KQ0002')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0005', N'LTC0008', N'MH0008', N'HK01', N'NH1112', 3.1, N'KQ0002')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0005', N'LTC0009', N'MH0009', N'HK02', N'NH1112', 5, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0005', N'LTC0010', N'MH0010', N'HK01', N'NH1213', 2.1, N'KQ0002')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0006', N'LTC0001', N'MH0001', N'HK01', N'NH1213', 2.3, N'KQ0002')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0006', N'LTC0002', N'MH0002', N'HK02', N'NH1213', 9.4, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0006', N'LTC0006', N'MH0006', N'HK01', N'NH0910', 7.7, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0006', N'LTC0007', N'MH0007', N'HK02', N'NH0910', 8.6, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0006', N'LTC0008', N'MH0008', N'HK01', N'NH1011', 9.2, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0006', N'LTC0008', N'MH0008', N'HK02', N'NH1011', 3.4, N'KQ0002')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0006', N'LTC0009', N'MH0009', N'HK01', N'NH1112', 4, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0006', N'LTC0010', N'MH0010', N'HK02', N'NH1112', 7.2, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0007', N'LTC0001', N'MH0001', N'HK02', N'NH1112', 5.4, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0007', N'LTC0002', N'MH0002', N'HK01', N'NH1213', 3.8, N'KQ0002')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0007', N'LTC0003', N'MH0003', N'HK02', N'NH1213', 7.2, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0007', N'LTC0007', N'MH0007', N'HK01', N'NH0910', 8.3, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0007', N'LTC0008', N'MH0008', N'HK02', N'NH0910', 3.1, N'KQ0002')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0007', N'LTC0009', N'MH0009', N'HK01', N'NH1011', 1.3, N'KQ0002')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0007', N'LTC0009', N'MH0009', N'HK02', N'NH1011', 6, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0007', N'LTC0010', N'MH0010', N'HK01', N'NH1112', 2, N'KQ0002')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0008', N'LTC0001', N'MH0001', N'HK01', N'NH1112', 7.3, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0008', N'LTC0002', N'MH0002', N'HK02', N'NH1112', 3, N'KQ0002')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0008', N'LTC0003', N'MH0003', N'HK01', N'NH1213', 8.3, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0008', N'LTC0004', N'MH0004', N'HK02', N'NH1213', 4.5, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0008', N'LTC0008', N'MH0008', N'HK01', N'NH0910', 8.3, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0008', N'LTC0009', N'MH0009', N'HK02', N'NH0910', 0.8, N'KQ0002')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0008', N'LTC0010', N'MH0010', N'HK01', N'NH1011', 3.9, N'KQ0002')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0008', N'LTC0010', N'MH0010', N'HK02', N'NH1011', 5.6, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0009', N'LTC0001', N'MH0001', N'HK01', N'NH1011', 7.1, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0009', N'LTC0001', N'MH0001', N'HK02', N'NH1011', 3.7, N'KQ0002')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0009', N'LTC0002', N'MH0002', N'HK01', N'NH1112', 5.4, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0009', N'LTC0003', N'MH0003', N'HK02', N'NH1112', 2.1, N'KQ0002')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0009', N'LTC0004', N'MH0004', N'HK01', N'NH1213', 4, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0009', N'LTC0005', N'MH0005', N'HK02', N'NH1213', 9.1, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0009', N'LTC0009', N'MH0009', N'HK01', N'NH0910', 1.6, N'KQ0002')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0009', N'LTC0010', N'MH0010', N'HK02', N'NH0910', 1.9, N'KQ0002')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0010', N'LTC0001', N'MH0001', N'HK02', N'NH0910', 5.7, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0010', N'LTC0002', N'MH0002', N'HK01', N'NH1011', 6.2, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0010', N'LTC0002', N'MH0002', N'HK02', N'NH1011', 8.3, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0010', N'LTC0003', N'MH0003', N'HK01', N'NH1112', 6.1, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0010', N'LTC0004', N'MH0004', N'HK02', N'NH1112', 2, N'KQ0002')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0010', N'LTC0005', N'MH0005', N'HK01', N'NH1213', 2.3, N'KQ0002')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0010', N'LTC0006', N'MH0006', N'HK02', N'NH1213', 6.5, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0010', N'LTC0010', N'MH0010', N'HK01', N'NH0910', 6.3, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0011', N'LTC0001', N'MH0001', N'HK01', N'NH0910', 2.8, N'KQ0002')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0011', N'LTC0002', N'MH0002', N'HK02', N'NH0910', 5.8, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0011', N'LTC0003', N'MH0003', N'HK01', N'NH1011', 5.7, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0011', N'LTC0003', N'MH0003', N'HK02', N'NH1011', 4, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0011', N'LTC0004', N'MH0004', N'HK01', N'NH1112', 3.8, N'KQ0002')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0011', N'LTC0005', N'MH0005', N'HK02', N'NH1112', 3.3, N'KQ0002')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0011', N'LTC0006', N'MH0006', N'HK01', N'NH1213', 4.1, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0011', N'LTC0007', N'MH0007', N'HK02', N'NH1213', 2.8, N'KQ0002')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0012', N'LTC0002', N'MH0002', N'HK01', N'NH0910', 0.4, N'KQ0002')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0012', N'LTC0003', N'MH0003', N'HK02', N'NH0910', 4.8, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0012', N'LTC0004', N'MH0004', N'HK01', N'NH1011', 4.3, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0012', N'LTC0004', N'MH0004', N'HK02', N'NH1011', 2.5, N'KQ0002')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0012', N'LTC0005', N'MH0005', N'HK01', N'NH1112', 1.8, N'KQ0002')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0012', N'LTC0006', N'MH0006', N'HK02', N'NH1112', 9.4, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0012', N'LTC0007', N'MH0007', N'HK01', N'NH1213', 1.1, N'KQ0002')
GO
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0012', N'LTC0008', N'MH0008', N'HK02', N'NH1213', 8.8, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0013', N'LTC0003', N'MH0003', N'HK01', N'NH0910', 6.6, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0013', N'LTC0004', N'MH0004', N'HK02', N'NH0910', 4.3, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0013', N'LTC0005', N'MH0005', N'HK01', N'NH1011', 8.8, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0013', N'LTC0005', N'MH0005', N'HK02', N'NH1011', 3.8, N'KQ0002')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0013', N'LTC0006', N'MH0006', N'HK01', N'NH1112', 1.1, N'KQ0002')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0013', N'LTC0007', N'MH0007', N'HK02', N'NH1112', 2.8, N'KQ0002')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0013', N'LTC0008', N'MH0008', N'HK01', N'NH1213', 6.2, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0013', N'LTC0009', N'MH0009', N'HK02', N'NH1213', 1.5, N'KQ0002')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0014', N'LTC0004', N'MH0004', N'HK01', N'NH0910', 0.8, N'KQ0002')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0014', N'LTC0005', N'MH0005', N'HK02', N'NH0910', 5.6, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0014', N'LTC0006', N'MH0006', N'HK01', N'NH1011', 3.1, N'KQ0002')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0014', N'LTC0006', N'MH0006', N'HK02', N'NH1011', 8.7, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0014', N'LTC0007', N'MH0007', N'HK01', N'NH1112', 5.9, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0014', N'LTC0008', N'MH0008', N'HK02', N'NH1112', 2.4, N'KQ0002')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0014', N'LTC0009', N'MH0009', N'HK01', N'NH1213', 5.5, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0014', N'LTC0010', N'MH0010', N'HK02', N'NH1213', 3.9, N'KQ0002')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0015', N'LTC0001', N'MH0001', N'HK02', N'NH1213', 4.3, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0015', N'LTC0005', N'MH0005', N'HK01', N'NH0910', 6, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0015', N'LTC0006', N'MH0006', N'HK02', N'NH0910', 2, N'KQ0002')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0015', N'LTC0007', N'MH0007', N'HK01', N'NH1011', 6.3, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0015', N'LTC0007', N'MH0007', N'HK02', N'NH1011', 8.7, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0015', N'LTC0008', N'MH0008', N'HK01', N'NH1112', 8.3, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0015', N'LTC0009', N'MH0009', N'HK02', N'NH1112', 4.5, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0015', N'LTC0010', N'MH0010', N'HK01', N'NH1213', 5, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0016', N'LTC0001', N'MH0001', N'HK01', N'NH1213', 6.1, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0016', N'LTC0002', N'MH0002', N'HK02', N'NH1213', 7.5, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0016', N'LTC0006', N'MH0006', N'HK01', N'NH0910', 7.9, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0016', N'LTC0007', N'MH0007', N'HK02', N'NH0910', 7.5, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0016', N'LTC0008', N'MH0008', N'HK01', N'NH1011', 4.6, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0016', N'LTC0008', N'MH0008', N'HK02', N'NH1011', 4, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0016', N'LTC0009', N'MH0009', N'HK01', N'NH1112', 3.1, N'KQ0002')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0016', N'LTC0010', N'MH0010', N'HK02', N'NH1112', 7.3, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0017', N'LTC0001', N'MH0001', N'HK02', N'NH1112', 3.5, N'KQ0002')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0017', N'LTC0002', N'MH0002', N'HK01', N'NH1213', 4.5, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0017', N'LTC0003', N'MH0003', N'HK02', N'NH1213', 8.3, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0017', N'LTC0007', N'MH0007', N'HK01', N'NH0910', 6, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0017', N'LTC0008', N'MH0008', N'HK02', N'NH0910', 5.7, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0017', N'LTC0009', N'MH0009', N'HK01', N'NH1011', 3.3, N'KQ0002')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0017', N'LTC0009', N'MH0009', N'HK02', N'NH1011', 6.3, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0017', N'LTC0010', N'MH0010', N'HK01', N'NH1112', 8.2, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0018', N'LTC0001', N'MH0001', N'HK01', N'NH1112', 5.1, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0018', N'LTC0002', N'MH0002', N'HK02', N'NH1112', 2.3, N'KQ0002')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0018', N'LTC0003', N'MH0003', N'HK01', N'NH1213', 4.2, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0018', N'LTC0004', N'MH0004', N'HK02', N'NH1213', 1.4, N'KQ0002')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0018', N'LTC0008', N'MH0008', N'HK01', N'NH0910', 5.7, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0018', N'LTC0009', N'MH0009', N'HK02', N'NH0910', 8.1, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0018', N'LTC0010', N'MH0010', N'HK01', N'NH1011', 6.5, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0018', N'LTC0010', N'MH0010', N'HK02', N'NH1011', 9.2, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0019', N'LTC0001', N'MH0001', N'HK01', N'NH1011', 3.4, N'KQ0002')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0019', N'LTC0001', N'MH0001', N'HK02', N'NH1011', 5.8, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0019', N'LTC0002', N'MH0002', N'HK01', N'NH1112', 3.8, N'KQ0002')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0019', N'LTC0003', N'MH0003', N'HK02', N'NH1112', 6, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0019', N'LTC0004', N'MH0004', N'HK01', N'NH1213', 3.7, N'KQ0002')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0019', N'LTC0005', N'MH0005', N'HK02', N'NH1213', 3.4, N'KQ0002')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0019', N'LTC0009', N'MH0009', N'HK01', N'NH0910', 4, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0019', N'LTC0010', N'MH0010', N'HK02', N'NH0910', 7.2, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0020', N'LTC0001', N'MH0001', N'HK02', N'NH0910', 5.8, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0020', N'LTC0002', N'MH0002', N'HK01', N'NH1011', 4.7, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0020', N'LTC0002', N'MH0002', N'HK02', N'NH1011', 4.4, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0020', N'LTC0003', N'MH0003', N'HK01', N'NH1112', 2.3, N'KQ0002')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0020', N'LTC0004', N'MH0004', N'HK02', N'NH1112', 1.9, N'KQ0002')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0020', N'LTC0005', N'MH0005', N'HK01', N'NH1213', 3.2, N'KQ0002')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0020', N'LTC0006', N'MH0006', N'HK02', N'NH1213', 6.6, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0020', N'LTC0010', N'MH0010', N'HK01', N'NH0910', 2.3, N'KQ0002')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0049', N'LTC0001', N'MH0010', N'HK01', N'NH1314', 5.7, N'KQ0001')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0050', N'LTC0001', N'MH0010', N'HK01', N'NH1314', 3.7, N'KQ0002')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0050', N'LTC0001', N'MH0010', N'HK02', N'NH1314', NULL, NULL)
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0051', N'LTC0001', N'MH0010', N'HK01', N'NH1314', 1.7, N'KQ0002')
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0051', N'LTC0001', N'MH0010', N'HK02', N'NH1314', NULL, NULL)
INSERT [dbo].[KQ_HOC_KY_MON_HOC] ([MaSINHVIEN], [MaLopTC], [MaMonHoc], [MaHocKy], [MaNamHoc], [DTBMonHocKy], [MaKetQua]) VALUES (N'SV0055', N'LTC0001', N'MH0004', N'HK01', N'NH1415', NULL, NULL)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0001', N'CNPM0912', N'HK01', N'NH0910', N'HL0005', N'HK0001', 1.4)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0001', N'CNPM0912', N'HK01', N'NH1011', N'HL0003', N'HK0001', 5.8)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0001', N'CNPM0912', N'HK01', N'NH1112', N'HL0005', N'HK0001', 2.6)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0001', N'CNPM0912', N'HK01', N'NH1213', N'HL0001', N'HK0001', 9.7)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0001', N'CNPM0912', N'HK01', N'NH1415', N'HL0001', N'HK0001', 10)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0001', N'CNPM0912', N'HK02', N'NH0910', N'HL0005', N'HK0001', 2.6)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0001', N'CNPM0912', N'HK02', N'NH1011', N'HL0003', N'HK0001', 5.7)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0001', N'CNPM0912', N'HK02', N'NH1112', N'HL0003', N'HK0001', 5.8)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0001', N'CNPM0912', N'HK02', N'NH1213', N'HL0003', N'HK0001', 6.2)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0001', N'CNPM0912', N'HK02', N'NH1415', N'HL0001', N'HK0001', 10)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0002', N'CNPM1013', N'HK01', N'NH0910', N'HL0004', N'HK0001', 4.9)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0002', N'CNPM1013', N'HK01', N'NH1011', N'HL0003', N'HK0001', 6.5)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0002', N'CNPM1013', N'HK01', N'NH1112', N'HL0005', N'HK0001', 3.6)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0002', N'CNPM1013', N'HK01', N'NH1213', N'HL0004', N'HK0001', 5.2)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0002', N'CNPM1013', N'HK01', N'NH1415', N'HL0001', N'HK0001', 10)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0002', N'CNPM1013', N'HK02', N'NH0910', N'HL0005', N'HK0001', 3.2)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0002', N'CNPM1013', N'HK02', N'NH1011', N'HL0002', N'HK0001', 7.3)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0002', N'CNPM1013', N'HK02', N'NH1112', N'HL0001', N'HK0001', 9.2)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0002', N'CNPM1013', N'HK02', N'NH1213', N'HL0003', N'HK0001', 6.3)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0002', N'CNPM1013', N'HK02', N'NH1415', N'HL0001', N'HK0001', 10)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0003', N'DTVT0912', N'HK01', N'NH0910', N'HL0004', N'HK0001', 4.2)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0003', N'DTVT0912', N'HK01', N'NH1011', N'HL0005', N'HK0001', 2.6)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0003', N'DTVT0912', N'HK01', N'NH1112', N'HL0002', N'HK0001', 8)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0003', N'DTVT0912', N'HK01', N'NH1213', N'HL0002', N'HK0001', 7)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0003', N'DTVT0912', N'HK02', N'NH0910', N'HL0001', N'HK0001', 9.6)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0003', N'DTVT0912', N'HK02', N'NH1011', N'HL0003', N'HK0001', 6.6)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0003', N'DTVT0912', N'HK02', N'NH1112', N'HL0005', N'HK0001', 2.7)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0003', N'DTVT0912', N'HK02', N'NH1213', N'HL0005', N'HK0001', 3.2)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0004', N'DTVT1013', N'HK01', N'NH0910', N'HL0002', N'HK0001', 7.1)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0004', N'DTVT1013', N'HK01', N'NH1011', N'HL0005', N'HK0001', 1.1)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0004', N'DTVT1013', N'HK01', N'NH1112', N'HL0005', N'HK0001', 2.5)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0004', N'DTVT1013', N'HK01', N'NH1213', N'HL0004', N'HK0001', 5)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0004', N'DTVT1013', N'HK02', N'NH0910', N'HL0004', N'HK0001', 5.1)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0004', N'DTVT1013', N'HK02', N'NH1011', N'HL0003', N'HK0001', 6.8)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0004', N'DTVT1013', N'HK02', N'NH1112', N'HL0003', N'HK0001', 6.7)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0004', N'DTVT1013', N'HK02', N'NH1213', N'HL0003', N'HK0001', 6.2)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0005', N'HTTT1013', N'HK01', N'NH0910', N'HL0003', N'HK0001', 5.8)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0005', N'HTTT1013', N'HK01', N'NH1011', N'HL0001', N'HK0001', 9.3)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0005', N'HTTT1013', N'HK01', N'NH1112', N'HL0005', N'HK0001', 3.1)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0005', N'HTTT1013', N'HK01', N'NH1213', N'HL0005', N'HK0001', 2.1)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0005', N'HTTT1013', N'HK02', N'NH0910', N'HL0003', N'HK0001', 5.8)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0005', N'HTTT1013', N'HK02', N'NH1011', N'HL0005', N'HK0001', 2.4)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0005', N'HTTT1013', N'HK02', N'NH1112', N'HL0004', N'HK0001', 5)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0005', N'HTTT1013', N'HK02', N'NH1213', N'HL0005', N'HK0001', 2.6)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0006', N'MMT0912', N'HK01', N'NH0910', N'HL0002', N'HK0001', 7.7)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0006', N'MMT0912', N'HK01', N'NH1011', N'HL0001', N'HK0001', 9.2)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0006', N'MMT0912', N'HK01', N'NH1112', N'HL0004', N'HK0001', 4)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0006', N'MMT0912', N'HK01', N'NH1213', N'HL0005', N'HK0001', 2.3)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0006', N'MMT0912', N'HK02', N'NH0910', N'HL0001', N'HK0001', 8.6)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0006', N'MMT0912', N'HK02', N'NH1011', N'HL0005', N'HK0001', 3.4)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0006', N'MMT0912', N'HK02', N'NH1112', N'HL0002', N'HK0001', 7.2)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0006', N'MMT0912', N'HK02', N'NH1213', N'HL0001', N'HK0001', 9.4)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0007', N'QTKD0912', N'HK01', N'NH0910', N'HL0002', N'HK0001', 8.3)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0007', N'QTKD0912', N'HK01', N'NH1011', N'HL0005', N'HK0001', 1.3)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0007', N'QTKD0912', N'HK01', N'NH1112', N'HL0005', N'HK0001', 2)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0007', N'QTKD0912', N'HK01', N'NH1213', N'HL0005', N'HK0001', 3.8)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0007', N'QTKD0912', N'HK02', N'NH0910', N'HL0005', N'HK0001', 3.1)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0007', N'QTKD0912', N'HK02', N'NH1011', N'HL0003', N'HK0001', 6)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0007', N'QTKD0912', N'HK02', N'NH1112', N'HL0004', N'HK0001', 5.4)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0007', N'QTKD0912', N'HK02', N'NH1213', N'HL0002', N'HK0001', 7.2)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0008', N'QTKD1013', N'HK01', N'NH0910', N'HL0002', N'HK0001', 8.3)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0008', N'QTKD1013', N'HK01', N'NH1011', N'HL0005', N'HK0001', 3.9)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0008', N'QTKD1013', N'HK01', N'NH1112', N'HL0002', N'HK0001', 7.3)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0008', N'QTKD1013', N'HK01', N'NH1213', N'HL0002', N'HK0001', 8.3)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0008', N'QTKD1013', N'HK02', N'NH0910', N'HL0005', N'HK0001', 0.8)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0008', N'QTKD1013', N'HK02', N'NH1011', N'HL0003', N'HK0001', 5.6)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0008', N'QTKD1013', N'HK02', N'NH1112', N'HL0005', N'HK0001', 3)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0008', N'QTKD1013', N'HK02', N'NH1213', N'HL0004', N'HK0001', 4.5)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0009', N'TCNH0912', N'HK01', N'NH0910', N'HL0005', N'HK0001', 1.6)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0009', N'TCNH0912', N'HK01', N'NH1011', N'HL0002', N'HK0001', 7.1)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0009', N'TCNH0912', N'HK01', N'NH1112', N'HL0004', N'HK0001', 5.4)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0009', N'TCNH0912', N'HK01', N'NH1213', N'HL0004', N'HK0001', 4)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0009', N'TCNH0912', N'HK02', N'NH0910', N'HL0005', N'HK0001', 1.9)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0009', N'TCNH0912', N'HK02', N'NH1011', N'HL0005', N'HK0001', 3.7)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0009', N'TCNH0912', N'HK02', N'NH1112', N'HL0005', N'HK0001', 2.1)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0009', N'TCNH0912', N'HK02', N'NH1213', N'HL0001', N'HK0001', 9.1)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0010', N'TCNH1013', N'HK01', N'NH0910', N'HL0003', N'HK0001', 6.3)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0010', N'TCNH1013', N'HK01', N'NH1011', N'HL0003', N'HK0001', 6.2)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0010', N'TCNH1013', N'HK01', N'NH1112', N'HL0003', N'HK0001', 6.1)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0010', N'TCNH1013', N'HK01', N'NH1213', N'HL0005', N'HK0001', 2.3)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0010', N'TCNH1013', N'HK02', N'NH0910', N'HL0003', N'HK0001', 5.7)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0010', N'TCNH1013', N'HK02', N'NH1011', N'HL0002', N'HK0001', 8.3)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0010', N'TCNH1013', N'HK02', N'NH1112', N'HL0005', N'HK0001', 2)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0010', N'TCNH1013', N'HK02', N'NH1213', N'HL0003', N'HK0001', 6.5)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0011', N'CNPM0912', N'HK01', N'NH0910', N'HL0005', N'HK0001', 2.8)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0011', N'CNPM0912', N'HK01', N'NH1011', N'HL0003', N'HK0001', 5.7)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0011', N'CNPM0912', N'HK01', N'NH1112', N'HL0005', N'HK0001', 3.8)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0011', N'CNPM0912', N'HK01', N'NH1213', N'HL0004', N'HK0001', 4.1)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0011', N'CNPM0912', N'HK02', N'NH0910', N'HL0003', N'HK0001', 5.8)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0011', N'CNPM0912', N'HK02', N'NH1011', N'HL0004', N'HK0001', 4)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0011', N'CNPM0912', N'HK02', N'NH1112', N'HL0005', N'HK0001', 3.3)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0011', N'CNPM0912', N'HK02', N'NH1213', N'HL0005', N'HK0001', 2.8)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0012', N'CNPM1013', N'HK01', N'NH0910', N'HL0005', N'HK0001', 0.4)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0012', N'CNPM1013', N'HK01', N'NH1011', N'HL0004', N'HK0001', 4.3)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0012', N'CNPM1013', N'HK01', N'NH1112', N'HL0005', N'HK0001', 1.8)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0012', N'CNPM1013', N'HK01', N'NH1213', N'HL0005', N'HK0001', 1.1)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0012', N'CNPM1013', N'HK02', N'NH0910', N'HL0004', N'HK0001', 4.8)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0012', N'CNPM1013', N'HK02', N'NH1011', N'HL0005', N'HK0001', 2.5)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0012', N'CNPM1013', N'HK02', N'NH1112', N'HL0001', N'HK0001', 9.4)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0012', N'CNPM1013', N'HK02', N'NH1213', N'HL0001', N'HK0001', 8.8)
GO
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0013', N'DTVT0912', N'HK01', N'NH0910', N'HL0003', N'HK0001', 6.6)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0013', N'DTVT0912', N'HK01', N'NH1011', N'HL0001', N'HK0001', 8.8)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0013', N'DTVT0912', N'HK01', N'NH1112', N'HL0005', N'HK0001', 1.1)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0013', N'DTVT0912', N'HK01', N'NH1213', N'HL0003', N'HK0001', 6.2)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0013', N'DTVT0912', N'HK02', N'NH0910', N'HL0004', N'HK0001', 4.3)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0013', N'DTVT0912', N'HK02', N'NH1011', N'HL0005', N'HK0001', 3.8)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0013', N'DTVT0912', N'HK02', N'NH1112', N'HL0005', N'HK0001', 2.8)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0013', N'DTVT0912', N'HK02', N'NH1213', N'HL0005', N'HK0001', 1.5)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0014', N'DTVT1013', N'HK01', N'NH0910', N'HL0005', N'HK0001', 0.8)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0014', N'DTVT1013', N'HK01', N'NH1011', N'HL0005', N'HK0001', 3.1)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0014', N'DTVT1013', N'HK01', N'NH1112', N'HL0003', N'HK0001', 5.9)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0014', N'DTVT1013', N'HK01', N'NH1213', N'HL0003', N'HK0001', 5.5)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0014', N'DTVT1013', N'HK02', N'NH0910', N'HL0003', N'HK0001', 5.6)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0014', N'DTVT1013', N'HK02', N'NH1011', N'HL0001', N'HK0001', 8.7)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0014', N'DTVT1013', N'HK02', N'NH1112', N'HL0005', N'HK0001', 2.4)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0014', N'DTVT1013', N'HK02', N'NH1213', N'HL0005', N'HK0001', 3.9)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0015', N'HTTT1013', N'HK01', N'NH0910', N'HL0003', N'HK0001', 6)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0015', N'HTTT1013', N'HK01', N'NH1011', N'HL0003', N'HK0001', 6.3)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0015', N'HTTT1013', N'HK01', N'NH1112', N'HL0002', N'HK0001', 8.3)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0015', N'HTTT1013', N'HK01', N'NH1213', N'HL0004', N'HK0001', 5)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0015', N'HTTT1013', N'HK02', N'NH0910', N'HL0005', N'HK0001', 2)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0015', N'HTTT1013', N'HK02', N'NH1011', N'HL0001', N'HK0001', 8.7)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0015', N'HTTT1013', N'HK02', N'NH1112', N'HL0004', N'HK0001', 4.5)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0015', N'HTTT1013', N'HK02', N'NH1213', N'HL0004', N'HK0001', 4.3)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0016', N'MMT0912', N'HK01', N'NH0910', N'HL0002', N'HK0001', 7.9)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0016', N'MMT0912', N'HK01', N'NH1011', N'HL0004', N'HK0001', 4.6)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0016', N'MMT0912', N'HK01', N'NH1112', N'HL0005', N'HK0001', 3.1)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0016', N'MMT0912', N'HK01', N'NH1213', N'HL0003', N'HK0001', 6.1)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0016', N'MMT0912', N'HK02', N'NH0910', N'HL0002', N'HK0001', 7.5)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0016', N'MMT0912', N'HK02', N'NH1011', N'HL0004', N'HK0001', 4)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0016', N'MMT0912', N'HK02', N'NH1112', N'HL0002', N'HK0001', 7.3)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0016', N'MMT0912', N'HK02', N'NH1213', N'HL0002', N'HK0001', 7.5)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0017', N'QTKD0912', N'HK01', N'NH0910', N'HL0003', N'HK0001', 6)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0017', N'QTKD0912', N'HK01', N'NH1011', N'HL0005', N'HK0001', 3.3)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0017', N'QTKD0912', N'HK01', N'NH1112', N'HL0002', N'HK0001', 8.2)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0017', N'QTKD0912', N'HK01', N'NH1213', N'HL0004', N'HK0001', 4.5)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0017', N'QTKD0912', N'HK02', N'NH0910', N'HL0003', N'HK0001', 5.7)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0017', N'QTKD0912', N'HK02', N'NH1011', N'HL0003', N'HK0001', 6.3)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0017', N'QTKD0912', N'HK02', N'NH1112', N'HL0005', N'HK0001', 3.5)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0017', N'QTKD0912', N'HK02', N'NH1213', N'HL0002', N'HK0001', 8.3)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0018', N'QTKD1013', N'HK01', N'NH0910', N'HL0003', N'HK0001', 5.7)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0018', N'QTKD1013', N'HK01', N'NH1011', N'HL0003', N'HK0001', 6.5)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0018', N'QTKD1013', N'HK01', N'NH1112', N'HL0004', N'HK0001', 5.1)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0018', N'QTKD1013', N'HK01', N'NH1213', N'HL0004', N'HK0001', 4.2)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0018', N'QTKD1013', N'HK02', N'NH0910', N'HL0002', N'HK0001', 8.1)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0018', N'QTKD1013', N'HK02', N'NH1011', N'HL0001', N'HK0001', 9.2)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0018', N'QTKD1013', N'HK02', N'NH1112', N'HL0005', N'HK0001', 2.3)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0018', N'QTKD1013', N'HK02', N'NH1213', N'HL0005', N'HK0001', 1.4)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0019', N'TCNH0912', N'HK01', N'NH0910', N'HL0004', N'HK0001', 4)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0019', N'TCNH0912', N'HK01', N'NH1011', N'HL0005', N'HK0001', 3.4)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0019', N'TCNH0912', N'HK01', N'NH1112', N'HL0005', N'HK0001', 3.8)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0019', N'TCNH0912', N'HK01', N'NH1213', N'HL0005', N'HK0001', 3.7)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0019', N'TCNH0912', N'HK02', N'NH0910', N'HL0002', N'HK0001', 7.2)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0019', N'TCNH0912', N'HK02', N'NH1011', N'HL0003', N'HK0001', 5.8)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0019', N'TCNH0912', N'HK02', N'NH1112', N'HL0003', N'HK0001', 6)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0019', N'TCNH0912', N'HK02', N'NH1213', N'HL0005', N'HK0001', 3.4)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0020', N'TCNH1013', N'HK01', N'NH0910', N'HL0005', N'HK0001', 2.3)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0020', N'TCNH1013', N'HK01', N'NH1011', N'HL0004', N'HK0001', 4.7)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0020', N'TCNH1013', N'HK01', N'NH1112', N'HL0005', N'HK0001', 2.3)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0020', N'TCNH1013', N'HK01', N'NH1213', N'HL0005', N'HK0001', 3.2)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0020', N'TCNH1013', N'HK02', N'NH0910', N'HL0003', N'HK0001', 5.8)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0020', N'TCNH1013', N'HK02', N'NH1011', N'HL0004', N'HK0001', 4.4)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0020', N'TCNH1013', N'HK02', N'NH1112', N'HL0005', N'HK0001', 1.9)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0020', N'TCNH1013', N'HK02', N'NH1213', N'HL0003', N'HK0001', 6.6)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0022', N'TMDT1013', N'HK01', N'NH0910', NULL, N'HK0001', NULL)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0024', N'TMDT1013', N'HK01', N'NH0910', NULL, N'HK0001', NULL)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0025', N'TMDT1013', N'HK01', N'NH0910', NULL, N'HK0001', NULL)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0026', N'TMDT1013', N'HK01', N'NH0910', NULL, N'HK0001', NULL)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0036', N'TMDT1013', N'HK01', N'NH0910', NULL, N'HK0001', NULL)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0047', N'TMDT1013', N'HK01', N'NH1415', N'HL0003', N'HK0001', 5.7)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0047', N'TMDT1013', N'HK02', N'NH1415', N'HL0001', N'HK0001', 9.3)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0048', N'TMDT0912', N'HK01', N'NH1415', N'HL0003', N'HK0001', 5.7)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0048', N'TMDT0912', N'HK02', N'NH1415', N'HL0001', N'HK0001', 9.3)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0049', N'CNPM0912', N'HK01', N'NH1314', N'HL0003', N'HK0001', 5.7)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0049', N'CNPM0912', N'HK01', N'NH1415', N'HL0003', N'HK0001', 5.7)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0049', N'CNPM0912', N'HK02', N'NH1415', N'HL0001', N'HK0001', 9.3)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0050', N'CNPM0912', N'HK01', N'NH1314', N'HL0005', N'HK0001', 3.7)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0050', N'CNPM0912', N'HK01', N'NH1415', N'HL0003', N'HK0001', 5.7)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0050', N'CNPM0912', N'HK02', N'NH1415', N'HL0001', N'HK0001', 9.3)
INSERT [dbo].[KQ_HOC_KY_TONG_HOP] ([MaSINHVIEN], [MaLop], [MaHocKy], [MaNamHoc], [MaHocLuc], [MaHanhKiem], [DTBMon]) VALUES (N'SV0051', N'CNPM0912', N'HK01', N'NH1314', N'HL0005', N'HK0001', 1.7)
INSERT [dbo].[LOAIDIEM] ([MaLoai], [TenLoai], [HeSo]) VALUES (N'LD0001', N'Kiểm Tra Giữa Kỳ', 3)
INSERT [dbo].[LOAIDIEM] ([MaLoai], [TenLoai], [HeSo]) VALUES (N'LD0002', N'Kiểm Tra Cuối Kỳ', 7)
INSERT [dbo].[LOAIGIANGVIEN] ([MALOAIGV], [TENLOAIGV]) VALUES (N'GV001', N'Cơ hữu')
INSERT [dbo].[LOAIGIANGVIEN] ([MALOAIGV], [TENLOAIGV]) VALUES (N'GV002', N'Thỉnh giảng')
INSERT [dbo].[LOAINGUOIDUNG] ([MaLoai], [TenLoaiND]) VALUES (N'LND001', N'Admin')
INSERT [dbo].[LOAINGUOIDUNG] ([MaLoai], [TenLoaiND]) VALUES (N'LND002', N'Giảng Viên')
INSERT [dbo].[LOAINGUOIDUNG] ([MaLoai], [TenLoaiND]) VALUES (N'LND003', N'Sinh Viên')
INSERT [dbo].[LOP] ([MaLop], [TenLop], [MaKhoa], [SiSo]) VALUES (N'CNPM0912', N'C9CNMP', N'KCNTT', 35)
INSERT [dbo].[LOP] ([MaLop], [TenLop], [MaKhoa], [SiSo]) VALUES (N'CNPM1013', N'C10CNPM', N'KCNTT', 39)
INSERT [dbo].[LOP] ([MaLop], [TenLop], [MaKhoa], [SiSo]) VALUES (N'DTVT0912', N'C9ĐTVT', N'KDTVT', 37)
INSERT [dbo].[LOP] ([MaLop], [TenLop], [MaKhoa], [SiSo]) VALUES (N'DTVT1013', N'C10ĐTVT', N'KDTVT', 35)
INSERT [dbo].[LOP] ([MaLop], [TenLop], [MaKhoa], [SiSo]) VALUES (N'HTTT1013', N'C10HTTT', N'KCNTT', 38)
INSERT [dbo].[LOP] ([MaLop], [TenLop], [MaKhoa], [SiSo]) VALUES (N'MMT0912', N'C9MMT', N'KCNTT', 34)
INSERT [dbo].[LOP] ([MaLop], [TenLop], [MaKhoa], [SiSo]) VALUES (N'QTKD0912', N'C9QTKD', N'KQTKD', 36)
INSERT [dbo].[LOP] ([MaLop], [TenLop], [MaKhoa], [SiSo]) VALUES (N'QTKD1013', N'C10QTKD', N'KQTKD', 38)
INSERT [dbo].[LOP] ([MaLop], [TenLop], [MaKhoa], [SiSo]) VALUES (N'TCNH0912', N'C9TCNH', N'KTCNH', 39)
INSERT [dbo].[LOP] ([MaLop], [TenLop], [MaKhoa], [SiSo]) VALUES (N'TCNH1013', N'C10TCNH', N'KTCNH', 40)
INSERT [dbo].[LOP] ([MaLop], [TenLop], [MaKhoa], [SiSo]) VALUES (N'TMDT0912', N'C9TMĐT', N'KCNTT', 38)
INSERT [dbo].[LOP] ([MaLop], [TenLop], [MaKhoa], [SiSo]) VALUES (N'TMDT1013', N'C10TMĐT', N'KCNTT', 38)
INSERT [dbo].[LOPTINCHI] ([MaLopTC], [SiSo]) VALUES (N'LTC0001', 30)
INSERT [dbo].[LOPTINCHI] ([MaLopTC], [SiSo]) VALUES (N'LTC0002', 30)
INSERT [dbo].[LOPTINCHI] ([MaLopTC], [SiSo]) VALUES (N'LTC0003', 30)
INSERT [dbo].[LOPTINCHI] ([MaLopTC], [SiSo]) VALUES (N'LTC0004', 30)
INSERT [dbo].[LOPTINCHI] ([MaLopTC], [SiSo]) VALUES (N'LTC0005', 30)
INSERT [dbo].[LOPTINCHI] ([MaLopTC], [SiSo]) VALUES (N'LTC0006', 30)
INSERT [dbo].[LOPTINCHI] ([MaLopTC], [SiSo]) VALUES (N'LTC0007', 30)
INSERT [dbo].[LOPTINCHI] ([MaLopTC], [SiSo]) VALUES (N'LTC0008', 30)
INSERT [dbo].[LOPTINCHI] ([MaLopTC], [SiSo]) VALUES (N'LTC0009', 30)
INSERT [dbo].[LOPTINCHI] ([MaLopTC], [SiSo]) VALUES (N'LTC0010', 30)
INSERT [dbo].[MONHOC] ([MaMonHoc], [TenMonHoc], [SoTiet], [MaKhoa], [MaTinChi], [SoTinChi]) VALUES (N'MH0001', N'Công Nghệ Phần Mềm', 90, N'KCNTT', N'TC0002', 4)
INSERT [dbo].[MONHOC] ([MaMonHoc], [TenMonHoc], [SoTiet], [MaKhoa], [MaTinChi], [SoTinChi]) VALUES (N'MH0002', N'Thương Mại Điện Tử', 60, N'KCNTT', N'TC0001', 3)
INSERT [dbo].[MONHOC] ([MaMonHoc], [TenMonHoc], [SoTiet], [MaKhoa], [MaTinChi], [SoTinChi]) VALUES (N'MH0003', N'Mạng Máy Tính', 60, N'KCNTT', N'TC0002', 4)
INSERT [dbo].[MONHOC] ([MaMonHoc], [TenMonHoc], [SoTiet], [MaKhoa], [MaTinChi], [SoTinChi]) VALUES (N'MH0004', N'Hệ Thống Thông Tin', 60, N'KCNTT', N'TC0003', 3)
INSERT [dbo].[MONHOC] ([MaMonHoc], [TenMonHoc], [SoTiet], [MaKhoa], [MaTinChi], [SoTinChi]) VALUES (N'MH0005', N'Kỹ Thuật Máy Tính', 90, N'KCNTT', N'TC0003', 3)
INSERT [dbo].[MONHOC] ([MaMonHoc], [TenMonHoc], [SoTiet], [MaKhoa], [MaTinChi], [SoTinChi]) VALUES (N'MH0006', N'Quản Trị Kinh Doanh', 45, N'KQTKD', N'TC0001', 3)
INSERT [dbo].[MONHOC] ([MaMonHoc], [TenMonHoc], [SoTiet], [MaKhoa], [MaTinChi], [SoTinChi]) VALUES (N'MH0007', N'Tài Chính Ngân Hàng', 45, N'KTCNH', N'TC0001', 4)
INSERT [dbo].[MONHOC] ([MaMonHoc], [TenMonHoc], [SoTiet], [MaKhoa], [MaTinChi], [SoTinChi]) VALUES (N'MH0008', N'Kế Toán', 45, N'KTCNH', N'TC0001', 3)
INSERT [dbo].[MONHOC] ([MaMonHoc], [TenMonHoc], [SoTiet], [MaKhoa], [MaTinChi], [SoTinChi]) VALUES (N'MH0009', N'Điện Tử Viễn Thông', 45, N'KDTVT', N'TC0001', 4)
INSERT [dbo].[MONHOC] ([MaMonHoc], [TenMonHoc], [SoTiet], [MaKhoa], [MaTinChi], [SoTinChi]) VALUES (N'MH0010', N'Toán Rời Rạc', 90, N'KCNTT', N'TC0001', 4)
INSERT [dbo].[MucDoCanhCaoHocTap] ([MucCanhCao], [SoTinChiNo]) VALUES (N'Mức Cảnh Cáo 1', 4)
INSERT [dbo].[MucDoCanhCaoHocTap] ([MucCanhCao], [SoTinChiNo]) VALUES (N'Mức Cảnh Cáo 2', 8)
INSERT [dbo].[MucDoCanhCaoHocTap] ([MucCanhCao], [SoTinChiNo]) VALUES (N'Mức Cảnh Cáo 3', 12)
INSERT [dbo].[NAMHOC] ([MaNamHoc], [TenNamHoc]) VALUES (N'NH0910', N'2009 - 2010')
INSERT [dbo].[NAMHOC] ([MaNamHoc], [TenNamHoc]) VALUES (N'NH1011', N'2010 - 2011')
INSERT [dbo].[NAMHOC] ([MaNamHoc], [TenNamHoc]) VALUES (N'NH1112', N'2011 - 2012')
INSERT [dbo].[NAMHOC] ([MaNamHoc], [TenNamHoc]) VALUES (N'NH1213', N'2012 - 2013')
INSERT [dbo].[NAMHOC] ([MaNamHoc], [TenNamHoc]) VALUES (N'NH1314', N'2013 - 2014')
INSERT [dbo].[NAMHOC] ([MaNamHoc], [TenNamHoc]) VALUES (N'NH1415', N'2014 - 2015')
INSERT [dbo].[NGHENGHIEP] ([MaNghe], [TenNghe]) VALUES (N'NN0001', N'Nội Trợ')
INSERT [dbo].[NGHENGHIEP] ([MaNghe], [TenNghe]) VALUES (N'NN0002', N'Giáo Viên')
INSERT [dbo].[NGHENGHIEP] ([MaNghe], [TenNghe]) VALUES (N'NN0003', N'Công Nhân')
INSERT [dbo].[NGHENGHIEP] ([MaNghe], [TenNghe]) VALUES (N'NN0004', N'Làm Nông')
INSERT [dbo].[NGHENGHIEP] ([MaNghe], [TenNghe]) VALUES (N'NN0005', N'Buôn Bán')
INSERT [dbo].[NGUOIDUNG] ([MaND], [MaLoai], [TenND], [TenDNhap], [matkhau]) VALUES (N'ND0001', N'LND001', N'Trần Thị Oanh', N'Admin', N'123456')
INSERT [dbo].[NGUOIDUNG] ([MaND], [MaLoai], [TenND], [TenDNhap], [matkhau]) VALUES (N'ND0003', N'LND002', N'Đỗ Văn Tình', N'vantinh', NULL)
INSERT [dbo].[NGUOIDUNG] ([MaND], [MaLoai], [TenND], [TenDNhap], [matkhau]) VALUES (N'ND0004', N'LND003', N'sv', N'sv', N'sv')
INSERT [dbo].[NGUOIDUNG] ([MaND], [MaLoai], [TenND], [TenDNhap], [matkhau]) VALUES (N'ND0005', N'LND002', N'gv', N'gv', N'gv')
INSERT [dbo].[NGUOIDUNG] ([MaND], [MaLoai], [TenND], [TenDNhap], [matkhau]) VALUES (N'ND0006', N'LND003', N'SV0008', N'SV0008', N'1')
INSERT [dbo].[NGUOIDUNG] ([MaND], [MaLoai], [TenND], [TenDNhap], [matkhau]) VALUES (N'ND0007', N'LND003', N'sv0006', N'a', N'd')
SET IDENTITY_INSERT [dbo].[PHANCONG] ON 

INSERT [dbo].[PHANCONG] ([STT], [MaNamHoc], [MaLopTC], [MaMonHoc], [MaGIANGVIEN]) VALUES (333, N'NH0910', N'LTC0001', N'MH0001', N'GV0001')
INSERT [dbo].[PHANCONG] ([STT], [MaNamHoc], [MaLopTC], [MaMonHoc], [MaGIANGVIEN]) VALUES (334, N'NH1011', N'LTC0001', N'MH0001', N'GV0001')
INSERT [dbo].[PHANCONG] ([STT], [MaNamHoc], [MaLopTC], [MaMonHoc], [MaGIANGVIEN]) VALUES (335, N'NH1112', N'LTC0001', N'MH0001', N'GV0001')
INSERT [dbo].[PHANCONG] ([STT], [MaNamHoc], [MaLopTC], [MaMonHoc], [MaGIANGVIEN]) VALUES (336, N'NH1213', N'LTC0001', N'MH0001', N'GV0001')
INSERT [dbo].[PHANCONG] ([STT], [MaNamHoc], [MaLopTC], [MaMonHoc], [MaGIANGVIEN]) VALUES (337, N'NH0910', N'LTC0002', N'MH0002', N'GV0002')
INSERT [dbo].[PHANCONG] ([STT], [MaNamHoc], [MaLopTC], [MaMonHoc], [MaGIANGVIEN]) VALUES (338, N'NH1011', N'LTC0002', N'MH0002', N'GV0002')
INSERT [dbo].[PHANCONG] ([STT], [MaNamHoc], [MaLopTC], [MaMonHoc], [MaGIANGVIEN]) VALUES (339, N'NH1112', N'LTC0002', N'MH0002', N'GV0002')
INSERT [dbo].[PHANCONG] ([STT], [MaNamHoc], [MaLopTC], [MaMonHoc], [MaGIANGVIEN]) VALUES (340, N'NH1213', N'LTC0002', N'MH0002', N'GV0002')
INSERT [dbo].[PHANCONG] ([STT], [MaNamHoc], [MaLopTC], [MaMonHoc], [MaGIANGVIEN]) VALUES (341, N'NH0910', N'LTC0003', N'MH0003', N'GV0003')
INSERT [dbo].[PHANCONG] ([STT], [MaNamHoc], [MaLopTC], [MaMonHoc], [MaGIANGVIEN]) VALUES (342, N'NH1011', N'LTC0003', N'MH0003', N'GV0003')
INSERT [dbo].[PHANCONG] ([STT], [MaNamHoc], [MaLopTC], [MaMonHoc], [MaGIANGVIEN]) VALUES (343, N'NH1112', N'LTC0003', N'MH0003', N'GV0003')
INSERT [dbo].[PHANCONG] ([STT], [MaNamHoc], [MaLopTC], [MaMonHoc], [MaGIANGVIEN]) VALUES (344, N'NH1213', N'LTC0003', N'MH0003', N'GV0003')
INSERT [dbo].[PHANCONG] ([STT], [MaNamHoc], [MaLopTC], [MaMonHoc], [MaGIANGVIEN]) VALUES (345, N'NH0910', N'LTC0004', N'MH0004', N'GV0004')
INSERT [dbo].[PHANCONG] ([STT], [MaNamHoc], [MaLopTC], [MaMonHoc], [MaGIANGVIEN]) VALUES (346, N'NH1011', N'LTC0004', N'MH0004', N'GV0004')
INSERT [dbo].[PHANCONG] ([STT], [MaNamHoc], [MaLopTC], [MaMonHoc], [MaGIANGVIEN]) VALUES (347, N'NH1112', N'LTC0004', N'MH0004', N'GV0004')
INSERT [dbo].[PHANCONG] ([STT], [MaNamHoc], [MaLopTC], [MaMonHoc], [MaGIANGVIEN]) VALUES (348, N'NH1213', N'LTC0004', N'MH0004', N'GV0004')
INSERT [dbo].[PHANCONG] ([STT], [MaNamHoc], [MaLopTC], [MaMonHoc], [MaGIANGVIEN]) VALUES (349, N'NH0910', N'LTC0005', N'MH0005', N'GV0005')
INSERT [dbo].[PHANCONG] ([STT], [MaNamHoc], [MaLopTC], [MaMonHoc], [MaGIANGVIEN]) VALUES (350, N'NH1011', N'LTC0005', N'MH0005', N'GV0005')
INSERT [dbo].[PHANCONG] ([STT], [MaNamHoc], [MaLopTC], [MaMonHoc], [MaGIANGVIEN]) VALUES (351, N'NH1112', N'LTC0005', N'MH0005', N'GV0005')
INSERT [dbo].[PHANCONG] ([STT], [MaNamHoc], [MaLopTC], [MaMonHoc], [MaGIANGVIEN]) VALUES (352, N'NH1213', N'LTC0005', N'MH0005', N'GV0005')
INSERT [dbo].[PHANCONG] ([STT], [MaNamHoc], [MaLopTC], [MaMonHoc], [MaGIANGVIEN]) VALUES (353, N'NH0910', N'LTC0006', N'MH0006', N'GV0006')
INSERT [dbo].[PHANCONG] ([STT], [MaNamHoc], [MaLopTC], [MaMonHoc], [MaGIANGVIEN]) VALUES (354, N'NH1011', N'LTC0006', N'MH0006', N'GV0006')
INSERT [dbo].[PHANCONG] ([STT], [MaNamHoc], [MaLopTC], [MaMonHoc], [MaGIANGVIEN]) VALUES (355, N'NH1112', N'LTC0006', N'MH0006', N'GV0006')
INSERT [dbo].[PHANCONG] ([STT], [MaNamHoc], [MaLopTC], [MaMonHoc], [MaGIANGVIEN]) VALUES (356, N'NH1213', N'LTC0006', N'MH0006', N'GV0006')
INSERT [dbo].[PHANCONG] ([STT], [MaNamHoc], [MaLopTC], [MaMonHoc], [MaGIANGVIEN]) VALUES (357, N'NH0910', N'LTC0007', N'MH0007', N'GV0007')
INSERT [dbo].[PHANCONG] ([STT], [MaNamHoc], [MaLopTC], [MaMonHoc], [MaGIANGVIEN]) VALUES (358, N'NH1011', N'LTC0007', N'MH0007', N'GV0007')
INSERT [dbo].[PHANCONG] ([STT], [MaNamHoc], [MaLopTC], [MaMonHoc], [MaGIANGVIEN]) VALUES (359, N'NH1112', N'LTC0007', N'MH0007', N'GV0007')
INSERT [dbo].[PHANCONG] ([STT], [MaNamHoc], [MaLopTC], [MaMonHoc], [MaGIANGVIEN]) VALUES (360, N'NH1213', N'LTC0007', N'MH0007', N'GV0007')
INSERT [dbo].[PHANCONG] ([STT], [MaNamHoc], [MaLopTC], [MaMonHoc], [MaGIANGVIEN]) VALUES (361, N'NH0910', N'LTC0008', N'MH0008', N'GV0008')
INSERT [dbo].[PHANCONG] ([STT], [MaNamHoc], [MaLopTC], [MaMonHoc], [MaGIANGVIEN]) VALUES (362, N'NH1011', N'LTC0008', N'MH0008', N'GV0008')
INSERT [dbo].[PHANCONG] ([STT], [MaNamHoc], [MaLopTC], [MaMonHoc], [MaGIANGVIEN]) VALUES (363, N'NH1112', N'LTC0008', N'MH0008', N'GV0008')
INSERT [dbo].[PHANCONG] ([STT], [MaNamHoc], [MaLopTC], [MaMonHoc], [MaGIANGVIEN]) VALUES (364, N'NH1213', N'LTC0008', N'MH0008', N'GV0008')
INSERT [dbo].[PHANCONG] ([STT], [MaNamHoc], [MaLopTC], [MaMonHoc], [MaGIANGVIEN]) VALUES (365, N'NH0910', N'LTC0009', N'MH0009', N'GV0009')
INSERT [dbo].[PHANCONG] ([STT], [MaNamHoc], [MaLopTC], [MaMonHoc], [MaGIANGVIEN]) VALUES (366, N'NH1011', N'LTC0009', N'MH0009', N'GV0009')
INSERT [dbo].[PHANCONG] ([STT], [MaNamHoc], [MaLopTC], [MaMonHoc], [MaGIANGVIEN]) VALUES (367, N'NH1112', N'LTC0009', N'MH0009', N'GV0009')
INSERT [dbo].[PHANCONG] ([STT], [MaNamHoc], [MaLopTC], [MaMonHoc], [MaGIANGVIEN]) VALUES (368, N'NH1213', N'LTC0009', N'MH0009', N'GV0009')
INSERT [dbo].[PHANCONG] ([STT], [MaNamHoc], [MaLopTC], [MaMonHoc], [MaGIANGVIEN]) VALUES (369, N'NH0910', N'LTC0010', N'MH0010', N'GV0010')
INSERT [dbo].[PHANCONG] ([STT], [MaNamHoc], [MaLopTC], [MaMonHoc], [MaGIANGVIEN]) VALUES (370, N'NH1011', N'LTC0010', N'MH0010', N'GV0010')
INSERT [dbo].[PHANCONG] ([STT], [MaNamHoc], [MaLopTC], [MaMonHoc], [MaGIANGVIEN]) VALUES (371, N'NH1112', N'LTC0010', N'MH0010', N'GV0010')
INSERT [dbo].[PHANCONG] ([STT], [MaNamHoc], [MaLopTC], [MaMonHoc], [MaGIANGVIEN]) VALUES (372, N'NH1213', N'LTC0010', N'MH0010', N'GV0010')
INSERT [dbo].[PHANCONG] ([STT], [MaNamHoc], [MaLopTC], [MaMonHoc], [MaGIANGVIEN]) VALUES (374, N'NH1314', N'LTC0001', N'MH0010', N'GV0007')
INSERT [dbo].[PHANCONG] ([STT], [MaNamHoc], [MaLopTC], [MaMonHoc], [MaGIANGVIEN]) VALUES (375, N'NH1415', N'LTC0001', N'MH0004', N'GV0008')
SET IDENTITY_INSERT [dbo].[PHANCONG] OFF
INSERT [dbo].[QUYDINH] ([TuoiCanDuoi], [TuoiCanTren], [SiSoCanDuoi], [SiSoCanTren], [ThangDiem], [TenTruong], [DiaChiTruong]) VALUES (15, 20, 30, 40, 10, N'Ðại Học Bách Khoa TPCHM', N'268 Lý Thuờng Kiệt - TPLX')
INSERT [dbo].[SINHVIEN] ([MaSINHVIEN], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe], [DienThoai], [MaLop]) VALUES (N'SV0001', N'Nguyễn Văn Tú', 0, CAST(N'1992-01-02T00:00:00.000' AS DateTime), N'Long Xuyên', N'DT0001', N'TG0003', N'Nguyễn Văn An', N'NN0005', N'Nguyễn Thị Diệp', N'NN0002', N'', N'CNPM0912')
INSERT [dbo].[SINHVIEN] ([MaSINHVIEN], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe], [DienThoai], [MaLop]) VALUES (N'SV0002', N'Nguyễn Ngọc An', 0, CAST(N'1992-01-02T00:00:00.000' AS DateTime), N'Bến Tre', N'DT0002', N'TG0002', N'Nguyễn Thiện Chí', N'NN0003', N'Trần Ngọc Anh', N'NN0001', N'', N'CNPM1013')
INSERT [dbo].[SINHVIEN] ([MaSINHVIEN], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe], [DienThoai], [MaLop]) VALUES (N'SV0003', N'Lê Hoàng Anh', 0, CAST(N'1992-04-15T00:00:00.000' AS DateTime), N'Chợ Mới', N'DT0001', N'TG0004', N'Lê Quốc Việt', N'NN0005', N'Nguyễn Thị Nga', N'NN0005', N'', N'DTVT0912')
INSERT [dbo].[SINHVIEN] ([MaSINHVIEN], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe], [DienThoai], [MaLop]) VALUES (N'SV0004', N'Huỳnh Thiện Chí', 0, CAST(N'1991-01-02T00:00:00.000' AS DateTime), N'Đồng Tháp', N'DT0001', N'TG0003', N'Huỳnh Quốc Bảo', N'NN0002', N'Nguyễn Thị Hồng', N'NN0004', N'', N'DTVT1013')
INSERT [dbo].[SINHVIEN] ([MaSINHVIEN], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe], [DienThoai], [MaLop]) VALUES (N'SV0005', N'Lý Ngọc Duy', 0, CAST(N'1992-01-02T00:00:00.000' AS DateTime), N'Long Xuyên', N'DT0003', N'TG0003', N'Lý Tử Long', N'NN0005', N'Nguyễn Thị Lan', N'NN0002', N'', N'HTTT1013')
INSERT [dbo].[SINHVIEN] ([MaSINHVIEN], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe], [DienThoai], [MaLop]) VALUES (N'SV0006', N'Huỳnh Ngọc Diệp', 1, CAST(N'1992-01-02T00:00:00.000' AS DateTime), N'Bến Tre', N'DT0001', N'TG0002', N'Huỳnh Quốc Bảo', N'NN0003', N'Nguyễn Thị Hồng', N'NN0001', N'', N'MMT0912')
INSERT [dbo].[SINHVIEN] ([MaSINHVIEN], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe], [DienThoai], [MaLop]) VALUES (N'SV0007', N'Trần Thị Huệ', 1, CAST(N'1992-04-15T00:00:00.000' AS DateTime), N'Chợ Mới', N'DT0001', N'TG0004', N'Trần Thanh Tú', N'NN0005', N'Đỗ Mỹ Linh', N'NN0005', N'', N'QTKD0912')
INSERT [dbo].[SINHVIEN] ([MaSINHVIEN], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe], [DienThoai], [MaLop]) VALUES (N'SV0008', N'Nguyễn Thanh Duy', 0, CAST(N'1991-01-02T00:00:00.000' AS DateTime), N'Đồng Tháp', N'DT0004', N'TG0003', N'Nguyễn Thanh Nam', N'NN0002', N'Vũ Cao Kì Duyên', N'NN0004', N'', N'QTKD1013')
INSERT [dbo].[SINHVIEN] ([MaSINHVIEN], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe], [DienThoai], [MaLop]) VALUES (N'SV0009', N'Trần Phước Lập', 0, CAST(N'1992-01-02T00:00:00.000' AS DateTime), N'Long Xuyên', N'DT0001', N'TG0003', N'Trần Phước Công', N'NN0005', N'Nguyễn Thị Hoa', N'NN0002', N'', N'TCNH0912')
INSERT [dbo].[SINHVIEN] ([MaSINHVIEN], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe], [DienThoai], [MaLop]) VALUES (N'SV0010', N'Trương Thị Nga', 1, CAST(N'1992-01-02T00:00:00.000' AS DateTime), N'Bến Tre', N'DT0001', N'TG0002', N'Trương Văn Công', N'NN0003', N'Đỗ Mỹ Dung', N'NN0001', N'', N'TCNH1013')
INSERT [dbo].[SINHVIEN] ([MaSINHVIEN], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe], [DienThoai], [MaLop]) VALUES (N'SV0011', N'Nguyễn Thị Nga', 1, CAST(N'1992-04-15T00:00:00.000' AS DateTime), N'Chợ Mới', N'DT0005', N'TG0004', N'Nguyễn Thanh Duy', N'NN0005', N'Trần Thị Huệ', N'NN0005', N'', N'CNPM0912')
INSERT [dbo].[SINHVIEN] ([MaSINHVIEN], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe], [DienThoai], [MaLop]) VALUES (N'SV0012', N'Trần Thị Hồng', 1, CAST(N'1991-01-02T00:00:00.000' AS DateTime), N'Đồng Tháp', N'DT0001', N'TG0003', N'Trần Văn Minh', N'NN0002', N'Nguyễn Thị Nhi', N'NN0004', N'', N'CNPM1013')
INSERT [dbo].[SINHVIEN] ([MaSINHVIEN], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe], [DienThoai], [MaLop]) VALUES (N'SV0013', N'Huỳnh Thị Mỹ Ngọc', 1, CAST(N'1992-01-02T00:00:00.000' AS DateTime), N'Long Xuyên', N'DT0001', N'TG0003', N'Huỳnh Quốc Minh', N'NN0005', N'Nguyễn Thị Hương', N'NN0002', N'', N'DTVT0912')
INSERT [dbo].[SINHVIEN] ([MaSINHVIEN], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe], [DienThoai], [MaLop]) VALUES (N'SV0014', N'Trần Thị Mỹ Nhân', 1, CAST(N'1992-01-02T00:00:00.000' AS DateTime), N'Bến Tre', N'DT0001', N'TG0002', N'Trần Văn Lập', N'NN0003', N'Trương Thị Ngọc', N'NN0001', N'', N'DTVT1013')
INSERT [dbo].[SINHVIEN] ([MaSINHVIEN], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe], [DienThoai], [MaLop]) VALUES (N'SV0015', N'Trương Thị Ngọc Dung', 1, CAST(N'1992-04-15T00:00:00.000' AS DateTime), N'Chợ Mới', N'DT0001', N'TG0004', N'Trương Văn Bảo', N'NN0005', N'Trần Thị Hân', N'NN0005', N'', N'HTTT1013')
INSERT [dbo].[SINHVIEN] ([MaSINHVIEN], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe], [DienThoai], [MaLop]) VALUES (N'SV0016', N'Huỳnh Quốc Phong', 0, CAST(N'1991-01-02T00:00:00.000' AS DateTime), N'Đồng Tháp', N'DT0001', N'TG0003', N'Huỳnh Quốc Vũ', N'NN0002', N'Nguyễn Ngọc Hân', N'NN0004', N'', N'MMT0912')
INSERT [dbo].[SINHVIEN] ([MaSINHVIEN], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe], [DienThoai], [MaLop]) VALUES (N'SV0017', N'Lý Ngọc Phương', 1, CAST(N'1992-01-02T00:00:00.000' AS DateTime), N'Long Xuyên', N'DT0001', N'TG0003', N'Lý Văn Lập', N'NN0005', N'Nguyễn Thị Ngọc ', N'NN0002', N'', N'QTKD0912')
INSERT [dbo].[SINHVIEN] ([MaSINHVIEN], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe], [DienThoai], [MaLop]) VALUES (N'SV0018', N'Nguyễn Thị Phương', 1, CAST(N'1992-01-02T00:00:00.000' AS DateTime), N'Bến Tre', N'DT0002', N'TG0002', N'Nguyễn Văn An', N'NN0003', N'Trần Thị Thắm', N'NN0001', N'', N'QTKD1013')
INSERT [dbo].[SINHVIEN] ([MaSINHVIEN], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe], [DienThoai], [MaLop]) VALUES (N'SV0019', N'Nguyễn Phú Quốc', 0, CAST(N'1992-04-15T00:00:00.000' AS DateTime), N'Chợ Mới', N'DT0001', N'TG0004', N'Nguyễn Phú Bảo', N'NN0005', N'Đỗ Ngọc Anh', N'NN0005', N'', N'TCNH0912')
INSERT [dbo].[SINHVIEN] ([MaSINHVIEN], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe], [DienThoai], [MaLop]) VALUES (N'SV0020', N'Võ Thiên Quốc', 0, CAST(N'1991-01-02T00:00:00.000' AS DateTime), N'Đồng Tháp', N'DT0001', N'TG0003', N'Võ Quốc Thiên', N'NN0002', N'Trần Mĩ Nữ', N'NN0004', N'', N'TCNH1013')
INSERT [dbo].[SINHVIEN] ([MaSINHVIEN], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe], [DienThoai], [MaLop]) VALUES (N'SV0021', N'Trần Văn Thân', 0, CAST(N'1992-01-02T00:00:00.000' AS DateTime), N'Long Xuyên', N'DT0001', N'TG0003', N'Trần Văn Thìn', N'NN0005', N'Đỗ Thị Ngọc', N'NN0002', N'', N'TMDT1013')
INSERT [dbo].[SINHVIEN] ([MaSINHVIEN], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe], [DienThoai], [MaLop]) VALUES (N'SV0022', N'Võ Hữu Tánh', 0, CAST(N'1992-01-02T00:00:00.000' AS DateTime), N'Bến Tre', N'DT0001', N'TG0002', N'Võ Quốc Chánh', N'NN0003', N'Nguyễn Bảo Hoa', N'NN0001', N'', N'TMDT1013')
INSERT [dbo].[SINHVIEN] ([MaSINHVIEN], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe], [DienThoai], [MaLop]) VALUES (N'SV0023', N'Lê Minh Tâm', 0, CAST(N'1992-04-15T00:00:00.000' AS DateTime), N'Chợ Mới', N'DT0004', N'TG0004', N'Lê Văn Mùi', N'NN0005', N'Trương Thị Hoa', N'NN0005', N'', N'TMDT1013')
INSERT [dbo].[SINHVIEN] ([MaSINHVIEN], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe], [DienThoai], [MaLop]) VALUES (N'SV0024', N'Nguyễn Đức Tâm', 0, CAST(N'1991-01-02T00:00:00.000' AS DateTime), N'Đồng Tháp', N'DT0001', N'TG0003', N'Nguyễn Văn Phúc', N'NN0002', N'Nguyễn Thị Hường', N'NN0004', N'', N'TMDT1013')
INSERT [dbo].[SINHVIEN] ([MaSINHVIEN], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe], [DienThoai], [MaLop]) VALUES (N'SV0025', N'Nguyễn Thành Tâm', 0, CAST(N'1992-01-02T00:00:00.000' AS DateTime), N'Long Xuyên', N'DT0001', N'TG0003', N'Nguyễn Thành Nam', N'NN0005', N'Nguyễn Thị Tố Nữ', N'NN0002', N'', N'TMDT1013')
INSERT [dbo].[SINHVIEN] ([MaSINHVIEN], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe], [DienThoai], [MaLop]) VALUES (N'SV0026', N'Trần Ngọc Minh Tân', 0, CAST(N'1992-01-02T00:00:00.000' AS DateTime), N'Bến Tre', N'DT0001', N'TG0002', N'Trần Văn Nhân', N'NN0003', N'Nguyễn Thị Tí', N'NN0001', N'', N'TMDT1013')
INSERT [dbo].[SINHVIEN] ([MaSINHVIEN], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe], [DienThoai], [MaLop]) VALUES (N'SV0027', N'Dương Kim Thanh', 1, CAST(N'1992-04-15T00:00:00.000' AS DateTime), N'Chợ Mới', N'DT0001', N'TG0004', N'Dương Kim Bảo', N'NN0005', N'Trần Thị Châu', N'NN0005', N'', N'TMDT1013')
INSERT [dbo].[SINHVIEN] ([MaSINHVIEN], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe], [DienThoai], [MaLop]) VALUES (N'SV0028', N'Vang Sĩ Thái', 0, CAST(N'1991-01-02T00:00:00.000' AS DateTime), N'Đồng Tháp', N'DT0001', N'TG0003', N'Vang Chi Lê', N'NN0002', N'Nguyễn Thị Đoan', N'NN0004', N'', N'TMDT1013')
INSERT [dbo].[SINHVIEN] ([MaSINHVIEN], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe], [DienThoai], [MaLop]) VALUES (N'SV0029', N'Đỗ Thị Bích Thảo', 1, CAST(N'1992-01-02T00:00:00.000' AS DateTime), N'Long Xuyên', N'DT0001', N'TG0003', N'Đỗ Văn Quang', N'NN0005', N'Nguyễn Thị Giang', N'NN0002', N'', N'TMDT1013')
INSERT [dbo].[SINHVIEN] ([MaSINHVIEN], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe], [DienThoai], [MaLop]) VALUES (N'SV0030', N'Hồ Minh Thiên', 0, CAST(N'1992-01-02T00:00:00.000' AS DateTime), N'Bến Tre', N'DT0001', N'TG0002', N'Hồ Chí Quân', N'NN0003', N'Võ Ngọc Ngoan', N'NN0001', N'', N'TMDT1013')
INSERT [dbo].[SINHVIEN] ([MaSINHVIEN], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe], [DienThoai], [MaLop]) VALUES (N'SV0031', N'Nguyễn Thị Anh Thư', 1, CAST(N'1992-04-15T00:00:00.000' AS DateTime), N'Chợ Mới', N'DT0003', N'TG0004', N'Nguyễn Văn Long', N'NN0005', N'Đỗ Bảo Khánh', N'NN0005', N'', N'TMDT1013')
INSERT [dbo].[SINHVIEN] ([MaSINHVIEN], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe], [DienThoai], [MaLop]) VALUES (N'SV0032', N'Phạm Nguyễn Bảo Trinh', 1, CAST(N'1991-01-02T00:00:00.000' AS DateTime), N'Đồng Tháp', N'DT0001', N'TG0003', N'Phạm Bá Thái', N'NN0002', N'Nguyễn Kim Hương', N'NN0004', N'', N'TMDT1013')
INSERT [dbo].[SINHVIEN] ([MaSINHVIEN], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe], [DienThoai], [MaLop]) VALUES (N'SV0033', N'Võ Ngọc Trinh', 1, CAST(N'1992-01-02T00:00:00.000' AS DateTime), N'Long Xuyên', N'DT0001', N'TG0003', N'Võ Quốc Bá Cẩn', N'NN0005', N'Nguyễn Thục Khuê', N'NN0002', N'', N'TMDT1013')
INSERT [dbo].[SINHVIEN] ([MaSINHVIEN], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe], [DienThoai], [MaLop]) VALUES (N'SV0034', N'Nguyễn Huỳnh Minh Trí', 0, CAST(N'1992-01-02T00:00:00.000' AS DateTime), N'Bến Tre', N'DT0001', N'TG0002', N'Nguyễn Huỳnh Minh', N'NN0003', N'Đỗ Phong Linh', N'NN0001', N'', N'TMDT1013')
INSERT [dbo].[SINHVIEN] ([MaSINHVIEN], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe], [DienThoai], [MaLop]) VALUES (N'SV0035', N'Đỗ Xuân Trinh', 0, CAST(N'1992-04-15T00:00:00.000' AS DateTime), N'Chợ Mới', N'DT0001', N'TG0004', N'Đỗ Bá Lộc', N'NN0005', N'Trần Cẩm Loan', N'NN0005', N'', N'TMDT1013')
INSERT [dbo].[SINHVIEN] ([MaSINHVIEN], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe], [DienThoai], [MaLop]) VALUES (N'SV0036', N'Nguyễn Hiêu Trung', 0, CAST(N'1991-01-02T00:00:00.000' AS DateTime), N'Đồng Tháp', N'DT0001', N'TG0003', N'Nguyễn Đình Nguyên', N'NN0002', N'Nguyễn Thu Minh', N'NN0004', N'', N'TMDT1013')
INSERT [dbo].[SINHVIEN] ([MaSINHVIEN], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe], [DienThoai], [MaLop]) VALUES (N'SV0037', N'Nguyễn Trành Trung', 0, CAST(N'1992-01-02T00:00:00.000' AS DateTime), N'Long Xuyên', N'DT0001', N'TG0003', N'Nguyễn Đức Phi', N'NN0005', N'Trương Giáng Mi', N'NN0002', N'', N'TMDT1013')
INSERT [dbo].[SINHVIEN] ([MaSINHVIEN], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe], [DienThoai], [MaLop]) VALUES (N'SV0038', N'Trần Thị Thanh Trúc', 1, CAST(N'1992-01-02T00:00:00.000' AS DateTime), N'Bến Tre', N'DT0001', N'TG0002', N'Trần Đức Tâm', N'NN0003', N'Võ Cẩm Nhung', N'NN0001', N'', N'TMDT1013')
INSERT [dbo].[SINHVIEN] ([MaSINHVIEN], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe], [DienThoai], [MaLop]) VALUES (N'SV0039', N'Cao Minh Tuấn', 0, CAST(N'1992-04-15T00:00:00.000' AS DateTime), N'Chợ Mới', N'DT0001', N'TG0004', N'Cao Minh Lí', N'NN0005', N'Nguyễn An Nhiên', N'NN0005', N'', N'TMDT1013')
INSERT [dbo].[SINHVIEN] ([MaSINHVIEN], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe], [DienThoai], [MaLop]) VALUES (N'SV0040', N'Nguyễn Hoàng Tuấn', 0, CAST(N'1991-01-02T00:00:00.000' AS DateTime), N'Đồng Tháp', N'DT0001', N'TG0003', N'Nguyễn Bảo Quốc', N'NN0002', N'Trần Tố Như', N'NN0004', N'', N'TMDT1013')
INSERT [dbo].[SINHVIEN] ([MaSINHVIEN], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe], [DienThoai], [MaLop]) VALUES (N'SV0041', N'Trương Minh Tuyền', 0, CAST(N'1992-01-02T00:00:00.000' AS DateTime), N'Long Xuyên', N'DT0001', N'TG0003', N'Trương Lí Thịnh', N'NN0005', N'Nguyễn Thùy Chi', N'NN0002', N'', N'TMDT1013')
INSERT [dbo].[SINHVIEN] ([MaSINHVIEN], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe], [DienThoai], [MaLop]) VALUES (N'SV0042', N'Lê Thanh Tùng', 0, CAST(N'1992-01-02T00:00:00.000' AS DateTime), N'Bến Tre', N'DT0001', N'TG0002', N'Lê Anh Tuấn', N'NN0003', N'Cao Mỹ Linh', N'NN0001', N'', N'TMDT1013')
INSERT [dbo].[SINHVIEN] ([MaSINHVIEN], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe], [DienThoai], [MaLop]) VALUES (N'SV0043', N'Phạm Thị Bích Vy', 1, CAST(N'1992-04-15T00:00:00.000' AS DateTime), N'Chợ Mới', N'DT0004', N'TG0004', N'Phạm Thành Đạt', N'NN0005', N'Đỗ Thanh Vân', N'NN0005', N'', N'TMDT1013')
INSERT [dbo].[SINHVIEN] ([MaSINHVIEN], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe], [DienThoai], [MaLop]) VALUES (N'SV0044', N'Đặng QUang Vinh', 0, CAST(N'1991-01-02T00:00:00.000' AS DateTime), N'Đồng Tháp', N'DT0001', N'TG0003', N'Đặng Chí Dũng', N'NN0002', N'Nguyễn Hồng Như', N'NN0004', N'', N'TMDT1013')
INSERT [dbo].[SINHVIEN] ([MaSINHVIEN], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe], [DienThoai], [MaLop]) VALUES (N'SV0045', N'Âu Ngọc Vũ', 0, CAST(N'1992-01-02T00:00:00.000' AS DateTime), N'Long Xuyên', N'DT0001', N'TG0003', N'Âu Bảo Hoàng', N'NN0005', N'Trần Bảo Quyên', N'NN0002', N'', N'TMDT1013')
INSERT [dbo].[SINHVIEN] ([MaSINHVIEN], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe], [DienThoai], [MaLop]) VALUES (N'SV0046', N'Hồ Thanh Vũ', 0, CAST(N'1992-01-02T00:00:00.000' AS DateTime), N'Bến Tre', N'DT0001', N'TG0002', N'Hồ Khương Gia', N'NN0003', N'Vũ Gia Quỳnh', N'NN0001', N'', N'TMDT1013')
INSERT [dbo].[SINHVIEN] ([MaSINHVIEN], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe], [DienThoai], [MaLop]) VALUES (N'SV0047', N'Phan Quốc Vương', 0, CAST(N'1992-04-15T00:00:00.000' AS DateTime), N'Chợ Mới', N'DT0001', N'TG0004', N'Phan Minh Tuấn', N'NN0005', N'Nguyễn Thị Châu', N'NN0005', N'', N'TMDT1013')
INSERT [dbo].[SINHVIEN] ([MaSINHVIEN], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe], [DienThoai], [MaLop]) VALUES (N'SV0048', N'Vũ Minh Đức DDD', 1, CAST(N'2017-06-01T00:00:00.000' AS DateTime), N'Hà Nội 2', N'DT0003', N'TG0003', N'Vũ Văn Hòa', N'NN0002', N'Nguyễn Thị Thu Hằng', N'NN0002', N'01652359188', N'TMDT0912')
INSERT [dbo].[SINHVIEN] ([MaSINHVIEN], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe], [DienThoai], [MaLop]) VALUES (N'SV0049', N'Đinh Tuấn Cường', 0, CAST(N'2017-06-09T00:00:00.000' AS DateTime), N'Hà Tây', N'DT0003', N'TG0004', N'Đô', N'NN0005', N'La', N'NN0002', N'56451321', N'CNPM0912')
INSERT [dbo].[SINHVIEN] ([MaSINHVIEN], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe], [DienThoai], [MaLop]) VALUES (N'SV0050', N'Bạch Quốc Khánh', 0, CAST(N'2017-06-24T00:00:00.000' AS DateTime), N'Hà Đông', N'DT0001', N'TG0003', N'Bạch', N'NN0005', N'Tạng', N'NN0002', N'45616231', N'CNPM0912')
INSERT [dbo].[SINHVIEN] ([MaSINHVIEN], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe], [DienThoai], [MaLop]) VALUES (N'SV0051', N'Lê Chí Ngọc', 1, CAST(N'2017-06-02T00:00:00.000' AS DateTime), N'Hà Nam', N'DT0002', N'TG0004', N'Lê Văn Hưu', N'NN0001', N'Le Văn Lương', N'NN0001', N'000004444', N'CNPM0912')
INSERT [dbo].[SINHVIEN] ([MaSINHVIEN], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe], [DienThoai], [MaLop]) VALUES (N'SV0052', N'Lê Hoàng Anh', 0, CAST(N'1992-04-15T00:00:00.000' AS DateTime), N'Chợ Mới', N'DT0001', N'TG0004', N'Lê Quốc Việt', N'NN0005', N'Nguyễn Thị Nga', N'NN0005', N'', N'DTVT0912')
INSERT [dbo].[SINHVIEN] ([MaSINHVIEN], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe], [DienThoai], [MaLop]) VALUES (N'SV0053', N'Huỳnh Thiện Chí', 0, CAST(N'1991-01-02T00:00:00.000' AS DateTime), N'Đồng Tháp', N'DT0001', N'TG0003', N'Huỳnh Quốc Bảo', N'NN0002', N'Nguyễn Thị Hồng', N'NN0004', N'', N'DTVT1013')
INSERT [dbo].[SINHVIEN] ([MaSINHVIEN], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe], [DienThoai], [MaLop]) VALUES (N'SV0054', N'Huỳnh Thị Mỹ Ngọc', 1, CAST(N'1992-01-02T00:00:00.000' AS DateTime), N'Long Xuyên', N'DT0001', N'TG0003', N'Huỳnh Quốc Minh', N'NN0005', N'Nguyễn Thị Hương', N'NN0002', N'', N'DTVT0912')
INSERT [dbo].[SINHVIEN] ([MaSINHVIEN], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe], [DienThoai], [MaLop]) VALUES (N'SV0055', N'Trần Thị Mỹ Nhân', 1, CAST(N'1992-01-02T00:00:00.000' AS DateTime), N'Bến Tre', N'DT0001', N'TG0002', N'Trần Văn Lập', N'NN0003', N'Trương Thị Ngọc', N'NN0001', N'', N'DTVT1013')
INSERT [dbo].[TINCHI] ([MaTinChi], [TienHoc]) VALUES (N'TC0001', 120000.0000)
INSERT [dbo].[TINCHI] ([MaTinChi], [TienHoc]) VALUES (N'TC0002', 150000.0000)
INSERT [dbo].[TINCHI] ([MaTinChi], [TienHoc]) VALUES (N'TC0003', 200000.0000)
INSERT [dbo].[TONGIAO] ([MaTonGiao], [TenTonGiao]) VALUES (N'TG0001', N'Không')
INSERT [dbo].[TONGIAO] ([MaTonGiao], [TenTonGiao]) VALUES (N'TG0002', N'Phật')
INSERT [dbo].[TONGIAO] ([MaTonGiao], [TenTonGiao]) VALUES (N'TG0003', N'Thiên Chúa')
INSERT [dbo].[TONGIAO] ([MaTonGiao], [TenTonGiao]) VALUES (N'TG0004', N'Tin Lành')
INSERT [dbo].[TONGIAO] ([MaTonGiao], [TenTonGiao]) VALUES (N'TG0005', N'Khác')
ALTER TABLE [dbo].[SINHVIEN] ADD  DEFAULT ('') FOR [MaLop]
GO
ALTER TABLE [dbo].[DIEM]  WITH CHECK ADD  CONSTRAINT [FK_DIEM_HK] FOREIGN KEY([MaHocKy])
REFERENCES [dbo].[HOCKY] ([MaHocKy])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[DIEM] CHECK CONSTRAINT [FK_DIEM_HK]
GO
ALTER TABLE [dbo].[DIEM]  WITH CHECK ADD  CONSTRAINT [FK_DIEM_LD] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[LOAIDIEM] ([MaLoai])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[DIEM] CHECK CONSTRAINT [FK_DIEM_LD]
GO
ALTER TABLE [dbo].[DIEM]  WITH CHECK ADD  CONSTRAINT [FK_DIEM_LTC] FOREIGN KEY([MaLopTC])
REFERENCES [dbo].[LOPTINCHI] ([MaLopTC])
GO
ALTER TABLE [dbo].[DIEM] CHECK CONSTRAINT [FK_DIEM_LTC]
GO
ALTER TABLE [dbo].[DIEM]  WITH CHECK ADD  CONSTRAINT [FK_DIEM_MH] FOREIGN KEY([MaMonHoc])
REFERENCES [dbo].[MONHOC] ([MaMonHoc])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[DIEM] CHECK CONSTRAINT [FK_DIEM_MH]
GO
ALTER TABLE [dbo].[DIEM]  WITH CHECK ADD  CONSTRAINT [FK_DIEM_NH] FOREIGN KEY([MaNamHoc])
REFERENCES [dbo].[NAMHOC] ([MaNamHoc])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[DIEM] CHECK CONSTRAINT [FK_DIEM_NH]
GO
ALTER TABLE [dbo].[DIEM]  WITH CHECK ADD  CONSTRAINT [FK_DIEM_SV] FOREIGN KEY([MaSINHVIEN])
REFERENCES [dbo].[SINHVIEN] ([MaSINHVIEN])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[DIEM] CHECK CONSTRAINT [FK_DIEM_SV]
GO
ALTER TABLE [dbo].[GIANGVIEN]  WITH CHECK ADD  CONSTRAINT [FK_GV_HV] FOREIGN KEY([MaHocVi])
REFERENCES [dbo].[HOCVI] ([MAHOCVI])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[GIANGVIEN] CHECK CONSTRAINT [FK_GV_HV]
GO
ALTER TABLE [dbo].[GIANGVIEN]  WITH CHECK ADD  CONSTRAINT [FK_GV_LGV] FOREIGN KEY([MaLoaiGV])
REFERENCES [dbo].[LOAIGIANGVIEN] ([MALOAIGV])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[GIANGVIEN] CHECK CONSTRAINT [FK_GV_LGV]
GO
ALTER TABLE [dbo].[GIANGVIEN]  WITH CHECK ADD  CONSTRAINT [FK_GV_MH] FOREIGN KEY([MaMonHoc])
REFERENCES [dbo].[MONHOC] ([MaMonHoc])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[GIANGVIEN] CHECK CONSTRAINT [FK_GV_MH]
GO
ALTER TABLE [dbo].[KQ_CA_NAM_TONG_HOP]  WITH CHECK ADD  CONSTRAINT [F_KQCN_HKIEM] FOREIGN KEY([MaHanhKiem])
REFERENCES [dbo].[HANHKIEM] ([MaHanhKiem])
GO
ALTER TABLE [dbo].[KQ_CA_NAM_TONG_HOP] CHECK CONSTRAINT [F_KQCN_HKIEM]
GO
ALTER TABLE [dbo].[KQ_CA_NAM_TONG_HOP]  WITH CHECK ADD  CONSTRAINT [F_KQCN_HL] FOREIGN KEY([MaHocLuc])
REFERENCES [dbo].[HOCLUC] ([MaHocLuc])
GO
ALTER TABLE [dbo].[KQ_CA_NAM_TONG_HOP] CHECK CONSTRAINT [F_KQCN_HL]
GO
ALTER TABLE [dbo].[KQ_CA_NAM_TONG_HOP]  WITH CHECK ADD  CONSTRAINT [F_KQCN_HS] FOREIGN KEY([MaSINHVIEN])
REFERENCES [dbo].[SINHVIEN] ([MaSINHVIEN])
GO
ALTER TABLE [dbo].[KQ_CA_NAM_TONG_HOP] CHECK CONSTRAINT [F_KQCN_HS]
GO
ALTER TABLE [dbo].[KQ_CA_NAM_TONG_HOP]  WITH CHECK ADD  CONSTRAINT [F_KQCN_LOP] FOREIGN KEY([MaLop])
REFERENCES [dbo].[LOP] ([MaLop])
GO
ALTER TABLE [dbo].[KQ_CA_NAM_TONG_HOP] CHECK CONSTRAINT [F_KQCN_LOP]
GO
ALTER TABLE [dbo].[KQ_CA_NAM_TONG_HOP]  WITH CHECK ADD  CONSTRAINT [F_KQCN_NH] FOREIGN KEY([MaNamHoc])
REFERENCES [dbo].[NAMHOC] ([MaNamHoc])
GO
ALTER TABLE [dbo].[KQ_CA_NAM_TONG_HOP] CHECK CONSTRAINT [F_KQCN_NH]
GO
ALTER TABLE [dbo].[KQ_HOC_KY_MON_HOC]  WITH CHECK ADD  CONSTRAINT [F_KQHKMH_HK] FOREIGN KEY([MaHocKy])
REFERENCES [dbo].[HOCKY] ([MaHocKy])
GO
ALTER TABLE [dbo].[KQ_HOC_KY_MON_HOC] CHECK CONSTRAINT [F_KQHKMH_HK]
GO
ALTER TABLE [dbo].[KQ_HOC_KY_MON_HOC]  WITH CHECK ADD  CONSTRAINT [F_KQHKMH_HS] FOREIGN KEY([MaSINHVIEN])
REFERENCES [dbo].[SINHVIEN] ([MaSINHVIEN])
GO
ALTER TABLE [dbo].[KQ_HOC_KY_MON_HOC] CHECK CONSTRAINT [F_KQHKMH_HS]
GO
ALTER TABLE [dbo].[KQ_HOC_KY_MON_HOC]  WITH CHECK ADD  CONSTRAINT [F_KQHKMH_KQ] FOREIGN KEY([MaKetQua])
REFERENCES [dbo].[KETQUA] ([MaKetQua])
GO
ALTER TABLE [dbo].[KQ_HOC_KY_MON_HOC] CHECK CONSTRAINT [F_KQHKMH_KQ]
GO
ALTER TABLE [dbo].[KQ_HOC_KY_MON_HOC]  WITH CHECK ADD  CONSTRAINT [F_KQHKMH_MH] FOREIGN KEY([MaMonHoc])
REFERENCES [dbo].[MONHOC] ([MaMonHoc])
GO
ALTER TABLE [dbo].[KQ_HOC_KY_MON_HOC] CHECK CONSTRAINT [F_KQHKMH_MH]
GO
ALTER TABLE [dbo].[KQ_HOC_KY_MON_HOC]  WITH CHECK ADD  CONSTRAINT [F_KQHKMH_NH] FOREIGN KEY([MaNamHoc])
REFERENCES [dbo].[NAMHOC] ([MaNamHoc])
GO
ALTER TABLE [dbo].[KQ_HOC_KY_MON_HOC] CHECK CONSTRAINT [F_KQHKMH_NH]
GO
ALTER TABLE [dbo].[KQ_HOC_KY_MON_HOC]  WITH CHECK ADD  CONSTRAINT [F_KQHKMH_TC] FOREIGN KEY([MaLopTC])
REFERENCES [dbo].[LOPTINCHI] ([MaLopTC])
GO
ALTER TABLE [dbo].[KQ_HOC_KY_MON_HOC] CHECK CONSTRAINT [F_KQHKMH_TC]
GO
ALTER TABLE [dbo].[KQ_HOC_KY_TONG_HOP]  WITH CHECK ADD  CONSTRAINT [F_KQHK_HK] FOREIGN KEY([MaHocKy])
REFERENCES [dbo].[HOCKY] ([MaHocKy])
GO
ALTER TABLE [dbo].[KQ_HOC_KY_TONG_HOP] CHECK CONSTRAINT [F_KQHK_HK]
GO
ALTER TABLE [dbo].[KQ_HOC_KY_TONG_HOP]  WITH CHECK ADD  CONSTRAINT [F_KQHK_HKIEM] FOREIGN KEY([MaHanhKiem])
REFERENCES [dbo].[HANHKIEM] ([MaHanhKiem])
GO
ALTER TABLE [dbo].[KQ_HOC_KY_TONG_HOP] CHECK CONSTRAINT [F_KQHK_HKIEM]
GO
ALTER TABLE [dbo].[KQ_HOC_KY_TONG_HOP]  WITH CHECK ADD  CONSTRAINT [F_KQHK_HL] FOREIGN KEY([MaHocLuc])
REFERENCES [dbo].[HOCLUC] ([MaHocLuc])
GO
ALTER TABLE [dbo].[KQ_HOC_KY_TONG_HOP] CHECK CONSTRAINT [F_KQHK_HL]
GO
ALTER TABLE [dbo].[KQ_HOC_KY_TONG_HOP]  WITH CHECK ADD  CONSTRAINT [F_KQHK_HS] FOREIGN KEY([MaSINHVIEN])
REFERENCES [dbo].[SINHVIEN] ([MaSINHVIEN])
GO
ALTER TABLE [dbo].[KQ_HOC_KY_TONG_HOP] CHECK CONSTRAINT [F_KQHK_HS]
GO
ALTER TABLE [dbo].[KQ_HOC_KY_TONG_HOP]  WITH CHECK ADD  CONSTRAINT [F_KQHK_LOP] FOREIGN KEY([MaLop])
REFERENCES [dbo].[LOP] ([MaLop])
GO
ALTER TABLE [dbo].[KQ_HOC_KY_TONG_HOP] CHECK CONSTRAINT [F_KQHK_LOP]
GO
ALTER TABLE [dbo].[KQ_HOC_KY_TONG_HOP]  WITH CHECK ADD  CONSTRAINT [F_KQHK_NH] FOREIGN KEY([MaNamHoc])
REFERENCES [dbo].[NAMHOC] ([MaNamHoc])
GO
ALTER TABLE [dbo].[KQ_HOC_KY_TONG_HOP] CHECK CONSTRAINT [F_KQHK_NH]
GO
ALTER TABLE [dbo].[LOP]  WITH CHECK ADD  CONSTRAINT [FK_LOP_Khoa] FOREIGN KEY([MaKhoa])
REFERENCES [dbo].[KHOA] ([MaKhoa])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[LOP] CHECK CONSTRAINT [FK_LOP_Khoa]
GO
ALTER TABLE [dbo].[MONHOC]  WITH CHECK ADD  CONSTRAINT [FK_MONHOC_KHOA] FOREIGN KEY([MaKhoa])
REFERENCES [dbo].[KHOA] ([MaKhoa])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[MONHOC] CHECK CONSTRAINT [FK_MONHOC_KHOA]
GO
ALTER TABLE [dbo].[MONHOC]  WITH CHECK ADD  CONSTRAINT [FK_MONHOC_TINCHI] FOREIGN KEY([MaTinChi])
REFERENCES [dbo].[TINCHI] ([MaTinChi])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[MONHOC] CHECK CONSTRAINT [FK_MONHOC_TINCHI]
GO
ALTER TABLE [dbo].[NGUOIDUNG]  WITH CHECK ADD  CONSTRAINT [FK_ND_LND] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[LOAINGUOIDUNG] ([MaLoai])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NGUOIDUNG] CHECK CONSTRAINT [FK_ND_LND]
GO
ALTER TABLE [dbo].[PHANCONG]  WITH CHECK ADD  CONSTRAINT [F_PC_LTC] FOREIGN KEY([MaLopTC])
REFERENCES [dbo].[LOPTINCHI] ([MaLopTC])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PHANCONG] CHECK CONSTRAINT [F_PC_LTC]
GO
ALTER TABLE [dbo].[PHANCONG]  WITH CHECK ADD  CONSTRAINT [F_PC_NH] FOREIGN KEY([MaNamHoc])
REFERENCES [dbo].[NAMHOC] ([MaNamHoc])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[PHANCONG] CHECK CONSTRAINT [F_PC_NH]
GO
ALTER TABLE [dbo].[PHANCONG]  WITH CHECK ADD  CONSTRAINT [P_PC_GV] FOREIGN KEY([MaGIANGVIEN])
REFERENCES [dbo].[GIANGVIEN] ([MaGIANGVIEN])
GO
ALTER TABLE [dbo].[PHANCONG] CHECK CONSTRAINT [P_PC_GV]
GO
ALTER TABLE [dbo].[PHANCONG]  WITH CHECK ADD  CONSTRAINT [P_PC_MH] FOREIGN KEY([MaMonHoc])
REFERENCES [dbo].[MONHOC] ([MaMonHoc])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[PHANCONG] CHECK CONSTRAINT [P_PC_MH]
GO
ALTER TABLE [dbo].[SINHVIEN]  WITH CHECK ADD  CONSTRAINT [FK_SV_DT] FOREIGN KEY([MaDanToc])
REFERENCES [dbo].[DANTOC] ([MaDanToc])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[SINHVIEN] CHECK CONSTRAINT [FK_SV_DT]
GO
ALTER TABLE [dbo].[SINHVIEN]  WITH CHECK ADD  CONSTRAINT [FK_SV_NNC] FOREIGN KEY([MaNNghiepCha])
REFERENCES [dbo].[NGHENGHIEP] ([MaNghe])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[SINHVIEN] CHECK CONSTRAINT [FK_SV_NNC]
GO
ALTER TABLE [dbo].[SINHVIEN]  WITH CHECK ADD  CONSTRAINT [FK_SV_NNM] FOREIGN KEY([MaNNghiepMe])
REFERENCES [dbo].[NGHENGHIEP] ([MaNghe])
GO
ALTER TABLE [dbo].[SINHVIEN] CHECK CONSTRAINT [FK_SV_NNM]
GO
ALTER TABLE [dbo].[SINHVIEN]  WITH CHECK ADD  CONSTRAINT [FK_SV_TG] FOREIGN KEY([MaTonGiao])
REFERENCES [dbo].[TONGIAO] ([MaTonGiao])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[SINHVIEN] CHECK CONSTRAINT [FK_SV_TG]
GO
/****** Object:  StoredProcedure [dbo].[sp_DIEM_SVXSTheoLop]    Script Date: 6/14/2017 11:38:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_DIEM_SVXSTheoLop]
@TenNamHoc VARCHAR(30)
AS
BEGIN
DECLARE @MaNamHoc VARCHAR(6)
SELECT @MaNamHoc = MaNamHoc FROM NAMHOC WHERE TenNamHoc = @TenNamHoc
SELECT E.MaSINHVIEN AS N'Mã Sinh Viên', E.HoTen AS N'Họ Tên', F.TenLop AS N'Tên Lớp', E.DTBCaNam AS N'Điểm Trung Bình',T.TenKhoa as[Tên Khoa] FROM
(SELECT C.MaSINHVIEN, D.HoTen, C.MaLop, C.DTBCaNam FROM
(SELECT B.MaSINHVIEN, A.DTBCaNam, A.MaLop FROM
(SELECT  MaLop, MAX(DTBCaNam) AS DTBCaNam
FROM KQ_CA_NAM_TONG_HOP
WHERE MaNamHoc = @MaNamHoc
GROUP BY MaLop) A
INNER JOIN (SELECT * FROM KQ_CA_NAM_TONG_HOP WHERE MaNamHoc = @MaNamHoc) B
ON A.MaLop = B.MaLop AND A.DTBCaNam = B.DTBCaNam) C
INNER JOIN SINHVIEN D
ON C.MaSINHVIEN = D.MaSINHVIEN ) E
INNER JOIN LOP F
ON E.MaLop = F.MaLop
INNER JOIN KHOA T
ON F.MaKhoa=T.MaKhoa
END





GO
/****** Object:  StoredProcedure [dbo].[sp_DIEM_ThemVaoDiemMotSinhVien]    Script Date: 6/14/2017 11:38:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_DIEM_ThemVaoDiemMotSinhVien]
@MaSINHVIEN VARCHAR(6), @TenHocKy NVARCHAR(30), @TenNamHoc NVARCHAR(30), @MaLopTC NVARCHAR(30), @TenLoaiDiem NVARCHAR(30), @Diem FLOAT
AS
BEGIN
DECLARE @MaHocKy VARCHAR(4), @MaNamHoc VARCHAR(6), @MaLoai VARCHAR(6), @MaMonHoc VARCHAR(6), @DTBMonHocKy FLOAT, @MaKetQua VARCHAR(6)
SELECT @MaHocKy = MaHocKy FROM HOCKY WHERE TenHocKy = @TenHocKy
SELECT @MaNamHoc = MaNamHoc FROM NAMHOC WHERE TenNamHoc = @TenNamHoc
SELECT @MaLoai = MaLoai FROM LOAIDIEM WHERE TenLoai = @TenLoaiDiem
SELECT @MaMonHoc = MaMonHoc FROM PHANCONG WHERE MaLopTC = @MaLopTC AND MaNamHoc = @MaNamHoc
IF EXISTS (SELECT * FROM DIEM WHERE MaSINHVIEN = @MaSINHVIEN AND MaMonHoc = @MaMonHoc AND MaHocKy = @MaHocKy AND MaNamHoc = @MaNamHoc
AND MaLopTC = @MaLopTC AND MaLoai = @MaLoai)
BEGIN
	UPDATE DIEM
	SET Diem = @Diem WHERE MaSINHVIEN = @MaSINHVIEN AND MaMonHoc = @MaMonHoc AND MaHocKy = @MaHocKy AND MaNamHoc = @MaNamHoc
	AND MaLopTC = @MaLopTC AND MaLoai = @MaLoai
	SELECT @DTBMonHocKy = ROUND(SUM(Diem*HeSo)/SUM(HeSo),1)
	FROM DIEM D INNER JOIN LOAIDIEM LD
	ON D.MaLoai = LD.MaLoai
	WHERE MaSINHVIEN = @MaSINHVIEN AND MaMonHoc = @MaMonHoc AND MaHocKy = @MaHocKy AND MaNamHoc = @MaNamHoc
	AND MaLopTC = @MaLopTC
	GROUP BY MaSINHVIEN, MaMonHoc, MaHocKy, MaNamHoc, MaLopTC
	SELECT @MaKetQua = (SELECT MaKetQua FROM KETQUA WHERE DiemCanDuoi <= @DTBMonHocKy AND DiemCanTren >= @DTBMonHocKy)
	UPDATE KQ_HOC_KY_MON_HOC
	SET DTBMonHocKy = @DTBMonHocKy, MaKetQua = (SELECT MaKetQua FROM KETQUA WHERE DiemCanDuoi <= @DTBMonHocKy AND DiemCanTren >= @DTBMonHocKy)
	WHERE MaSINHVIEN = @MaSINHVIEN AND MaMonHoc = @MaMonHoc AND MaHocKy = @MaHocKy AND MaNamHoc = @MaNamHoc
	AND MaLopTC = @MaLopTC 
	EXEC sp_KQHKTH_UpdateMotSinhVien @MaSINHVIEN, @MaHocKy, @MaNamHoc
	EXEC sp_KQCNTH_UpdateMotSinhVien @MaSINHVIEN, @MaNamHoc
END
ELSE
RAISERROR(N'Không tồn tại bản ghi trong cơ sở dữ liệu.',16,1)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DIEM_ThemVaoLopTinChi]    Script Date: 6/14/2017 11:38:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_DIEM_ThemVaoLopTinChi]
@MaSINHVIEN VARCHAR(6), @TenHocKy NVARCHAR(30), @TenNamHoc NVARCHAR(30), @MaLopTC NVARCHAR(30), @TenMonHoc NVARCHAR(30)
AS
BEGIN
DECLARE @MaHocKy VARCHAR(4), @MaNamHoc VARCHAR(6), @MaMonHoc VARCHAR(6)
SELECT @MaHocKy = MaHocKy FROM HOCKY WHERE TenHocKy = @TenHocKy
SELECT @MaNamHoc = MaNamHoc FROM NAMHOC WHERE TenNamHoc = @TenNamHoc
SELECT @MaMonHoc = MaMonHoc FROM MONHOC WHERE TenMonHoc = @TenMonHoc
INSERT INTO DIEM VALUES (@MaSINHVIEN, @MaMonHoc, @MaHocKy, @MaNamHoc, @MaLopTC, 'LD0001', NULL)
INSERT INTO DIEM VALUES (@MaSINHVIEN, @MaMonHoc, @MaHocKy, @MaNamHoc, @MaLopTC, 'LD0002', NULL)
INSERT INTO KQ_HOC_KY_MON_HOC VALUES (@MaSINHVIEN, @MaLopTC, @MaMonHoc, @MaHocKy, @MaNamHoc, NULL, NULL)
END


GO
/****** Object:  StoredProcedure [dbo].[sp_DIEM_XemDiem]    Script Date: 6/14/2017 11:38:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_DIEM_XemDiem]
@maLopTC varchar(10),@NamHoc varchar(30),@HocKi nvarchar(30)
as
begin
(select a.*,b.[Điểm Cuối Kì] from (select Diem.MaSINHVIEN as[Mã Sinh Viên],HoTen as[Họ Tên],MaLop as [Lớp],Diem as[Điểm Giữa Kì] from DIEM left join SINHVIEN on DIEM.MaSINHVIEN=SINHVIEN.MaSINHVIEN left join NAMHOC on DIEM.MaNamHoc=NAMHOC.MaNamHoc where MaLopTC=@maLopTC and MaHocKy=(select MaHocKy from HOCKY where TenHocKy like @HocKi) and TenNamHoc=@NamHoc and MaLoai='LD0001') a left join
(select HoTen as[Họ Tên],Diem.MaSINHVIEN as[Mã Sinh Viên],MaLop as [Lớp],Diem as[Điểm Cuối Kì] from DIEM left join SINHVIEN on DIEM.MaSINHVIEN=SINHVIEN.MaSINHVIEN left join NAMHOC on DIEM.MaNamHoc=NAMHOC.MaNamHoc where MaLopTC=@maLopTC and MaHocKy=(select MaHocKy from HOCKY where TenHocKy like @HocKi) and TenNamHoc=@NamHoc and MaLoai='LD0002') b
on a.[Mã Sinh Viên]=b.[Mã Sinh Viên])
end




GO
/****** Object:  StoredProcedure [dbo].[sp_DIEM_XemDiemSinhVien]    Script Date: 6/14/2017 11:38:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_DIEM_XemDiemSinhVien]
@MaSinhVien varchar(6)
as
select B.TenNamHoc,A.MaHocKy,A.MaMonHoc,A.TenMonHoc,A.SoTinChi,A.DTBMonHocKy,A.DiemChu from (select MaNamHoc,MaHocKy,KQ_HOC_KY_MON_HOC.MaMonHoc,TenMonHoc,SoTinChi,DTBMonHocKy,
                                    case
	                                    when DTBMonHocKy<4 then 'F'
	                                    when DTBMonHocKy<5.5 then 'D'
	                                    when DTBMonHocKy<7 then 'C'
	                                    when DTBMonHocKy<8.5 then 'B'
	                                    when DTBMonHocKy<=10 then 'A'
                                    end as DiemChu
                                    from KQ_HOC_KY_MON_HOC
                                    left join MONHOC
                                    on KQ_HOC_KY_MON_HOC.MaMonHoc=MONHOC.MaMonHoc
                                    where MaSINHVIEN like @MaSinhVien)A
left join NAMHOC B on A.MaNamHoc=B.MaNamHoc




GO
/****** Object:  StoredProcedure [dbo].[sp_DIEM_XemHocPhi]    Script Date: 6/14/2017 11:38:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_DIEM_XemHocPhi]
@TenNamHoc VARCHAR(30), @TenHocKy NVARCHAR(30)
AS
BEGIN
DECLARE @MaNamHoc VARCHAR(6), @MaHocKy VARCHAR(4)
SELECT @MaNamHoc = MaNamHoc FROM NAMHOC WHERE TenNamHoc LIKE '%' + RTRIM(LTRIM(@TenNamHoc)) + '%'
SELECT @MaHocKy = MaHocKy FROM HOCKY WHERE TenHocKy LIKE '%' + RTRIM(LTRIM(@TenHocKy)) + '%'
SELECT B.TenKhoa as[Tên Khoa],B.MaSINHVIEN as[Mã Sinh Viên],B.TenLop as[Lớp],B.HoTen as[Họ Tên],A.HocPhi as[Học Phí] FROM (SELECT MaSINHVIEN,HocPhi = SUM(TienHoc*SoTinChi)/2 FROM DIEM, MONHOC, TINCHI
WHERE DIEM.MaNamHoc = @MaNamHoc AND DIEM.MaHocKy = @MaHocKy
AND DIEM.MaMonHoc = MONHOC.MaMonHoc AND MONHOC.MaTinChi = TINCHI.MaTinChi
GROUP BY MaSINHVIEN, MaNamHoc, MaHocKy) A
LEFT JOIN (select SINHVIEN.HoTen,SINHVIEN.MaSINHVIEN,A.TenLop,A.TenKhoa from SINHVIEN left join
(select Lop.*,KHOA.TenKhoa from LOP left join KHOA on LOP.MaKhoa=KHOA.MaKhoa) A
on SINHVIEN.MaLop=A.MaLop) B
ON A.MaSINHVIEN=B.MaSINHVIEN
END






GO
/****** Object:  StoredProcedure [dbo].[sp_DIEM_XemHocPhi_MotSinhVien]    Script Date: 6/14/2017 11:38:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_DIEM_XemHocPhi_MotSinhVien]
@TenNamHoc VARCHAR(30), @TenHocKy NVARCHAR(30),@MaSinhVien varchar(6)
AS
BEGIN
DECLARE @MaNamHoc VARCHAR(6), @MaHocKy VARCHAR(4)
SELECT @MaNamHoc = MaNamHoc FROM NAMHOC WHERE TenNamHoc LIKE '%' + RTRIM(LTRIM(@TenNamHoc)) + '%'
SELECT @MaHocKy = MaHocKy FROM HOCKY WHERE TenHocKy LIKE '%' + RTRIM(LTRIM(@TenHocKy)) + '%'
select * from (SELECT B.TenKhoa as[Tên Khoa],B.MaSINHVIEN as[Mã Sinh Viên],B.TenLop as[Lớp],B.HoTen as[Họ Tên],A.HocPhi as[Học Phí] FROM (SELECT MaSINHVIEN,HocPhi = SUM(TienHoc*SoTinChi)/2 FROM DIEM, MONHOC, TINCHI
WHERE DIEM.MaNamHoc = @MaNamHoc AND DIEM.MaHocKy = @MaHocKy
AND DIEM.MaMonHoc = MONHOC.MaMonHoc AND MONHOC.MaTinChi = TINCHI.MaTinChi
GROUP BY MaSINHVIEN, MaNamHoc, MaHocKy) A
LEFT JOIN (select SINHVIEN.HoTen,SINHVIEN.MaSINHVIEN,A.TenLop,A.TenKhoa from SINHVIEN left join
(select Lop.*,KHOA.TenKhoa from LOP left join KHOA on LOP.MaKhoa=KHOA.MaKhoa) A
on SINHVIEN.MaLop=A.MaLop) B
ON A.MaSINHVIEN=B.MaSINHVIEN) A where A.[Mã Sinh Viên] like @MaSinhVien
END


GO
/****** Object:  StoredProcedure [dbo].[sp_DIEM_XetCanhCaoHocTap]    Script Date: 6/14/2017 11:38:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[sp_DIEM_XetCanhCaoHocTap]
@Muc1 int,@Muc2 int,@Muc3 int,@Chon1 int,@Chon2 int,@Chon3 int
as
SELECT MaSINHVIEN AS [Mã Sinh Viên],HoTen as [Họ Tên],TenKhoa as[Khoa],TenLop as[Lớp],SoTinChiNo as[Số Tín Chỉ Nợ],MUCCANHCAO as [Mức Cảnh Cáo] 
FROM (
SELECT D.TenKhoa,A.MaSINHVIEN,B.HoTen,C.TenLop,B.DienThoai,A.SoTinChiNo,
CASE
WHEN A.SoTinChiNo<@Muc1 THEN '0'
WHEN @Muc1<=A.SoTinChiNo AND A.SoTinChiNo<@Muc2 THEN '1'
WHEN A.SoTinChiNo>=@Muc2 AND A.SoTinChiNo<@Muc3 THEN '2'
WHEN A.SoTinChiNo>=@Muc3 THEN '3'
END AS MUCCANHCAO FROM 
(SELECT * FROM vw_DIEM_XetCanhCaoHocTap) A
INNER JOIN SINHVIEN B
ON A.MaSINHVIEN=B.MaSINHVIEN
INNER JOIN LOP C
ON B.MaLop=C.MaLop
INNER JOIN KHOA D
ON C.MaKhoa=D.MaKhoa) A
WHERE A.MUCCANHCAO=@Chon1 OR A.MUCCANHCAO=@Chon2 OR A.MUCCANHCAO=@Chon3
ORDER BY SoTinChiNo






GO
/****** Object:  StoredProcedure [dbo].[sp_GIANGVIEN_LayThongTinGiangVienTheoHoTen]    Script Date: 6/14/2017 11:38:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_GIANGVIEN_LayThongTinGiangVienTheoHoTen]
@HoTen NVARCHAR(30)
AS
BEGIN
SELECT MaGIANGVIEN AS N'Mã Giảng Viên', TenGIANGVIEN AS N'Tên Giảng Viên', 
CASE
	WHEN (GioiTinh = 1) THEN N'Nữ'
	WHEN (GioiTinh = 0) THEN N'Nam'
END
AS N'Giới Tính', 
DiaChi AS N'Địa Chỉ', DienThoai AS N'Điện Thoại', TenMonHoc AS N'Tên Môn Học', TENHOCVI AS N'Học Vị', TENLOAIGV AS N'Loại Giảng Viên'
FROM GIANGVIEN, MONHOC, HOCVI, LOAIGIANGVIEN
WHERE GIANGVIEN.TenGIANGVIEN LIKE '%' + RTRIM(LTRIM(@HoTen)) +'%' AND GIANGVIEN.MaMonHoc = MONHOC.MaMonHoc AND GIANGVIEN.MaHocVi = HOCVI.MAHOCVI AND GIANGVIEN.MaLoaiGV = LOAIGIANGVIEN.MALOAIGV 
END




GO
/****** Object:  StoredProcedure [dbo].[sp_GIANGVIEN_LayThongTinGiangVienTheoMaGV]    Script Date: 6/14/2017 11:38:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_GIANGVIEN_LayThongTinGiangVienTheoMaGV]
@MaGV NVARCHAR(6)
AS
BEGIN
SELECT MaGIANGVIEN AS N'Mã Giảng Viên', TenGIANGVIEN AS N'Tên Giảng Viên', 
CASE
	WHEN (GioiTinh = 1) THEN N'Nữ'
	WHEN (GioiTinh = 0) THEN N'Nam'
END
AS N'Giới Tính', 
DiaChi AS N'Địa Chỉ', DienThoai AS N'Điện Thoại', TenMonHoc AS N'Tên Môn Học', TENHOCVI AS N'Học Vị', TENLOAIGV AS N'Loại Giảng Viên'
FROM GIANGVIEN, MONHOC, HOCVI, LOAIGIANGVIEN
WHERE GIANGVIEN.MaGIANGVIEN  LIKE '%'+RTRIM(LTRIM(@MaGV))+'%' AND GIANGVIEN.MaMonHoc = MONHOC.MaMonHoc AND GIANGVIEN.MaHocVi = HOCVI.MAHOCVI AND GIANGVIEN.MaLoaiGV = LOAIGIANGVIEN.MALOAIGV 
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GIANGVIEN_LayThongTinGiangVienTheoTenKhoa]    Script Date: 6/14/2017 11:38:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_GIANGVIEN_LayThongTinGiangVienTheoTenKhoa]
@TenKhoa NVARCHAR(50)
AS
BEGIN
SELECT GIANGVIEN.MaGIANGVIEN AS N'Mã Giảng Viên', TenGIANGVIEN AS N'Tên Giảng Viên', 
CASE
	WHEN (GioiTinh = 1) THEN N'Nữ'
	WHEN (GioiTinh = 0) THEN N'Nam'
END
AS N'Giới Tính', 
DiaChi AS N'Địa Chỉ', DienThoai AS N'Điện Thoại', TenMonHoc AS N'Tên Môn Học', TENHOCVI AS N'Học Vị', TENLOAIGV AS N'Loại Giảng Viên'
FROM GIANGVIEN, MONHOC, HOCVI, LOAIGIANGVIEN, KHOA
WHERE GIANGVIEN.MaMonHoc = MONHOC.MaMonHoc AND GIANGVIEN.MaHocVi = HOCVI.MAHOCVI AND GIANGVIEN.MaLoaiGV = LOAIGIANGVIEN.MALOAIGV AND MONHOC.MaKhoa=KHOA.MaKhoa AND KHOA.TenKhoa LIKE '%'+RTRIM(LTRIM(@TenKhoa))+'%'
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GIANGVIEN_LayThongTinGiangVienTheoTenMon]    Script Date: 6/14/2017 11:38:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_GIANGVIEN_LayThongTinGiangVienTheoTenMon]
@TenMon NVARCHAR(30)
AS
BEGIN
SELECT MaGIANGVIEN AS N'Mã Giảng Viên', TenGIANGVIEN AS N'Tên Giảng Viên', 
CASE
	WHEN (GioiTinh = 1) THEN N'Nữ'
	WHEN (GioiTinh = 0) THEN N'Nam'
END
AS N'Giới Tính', 
DiaChi AS N'Địa Chỉ', DienThoai AS N'Điện Thoại', TenMonHoc AS N'Tên Môn Học', TENHOCVI AS N'Học Vị', TENLOAIGV AS N'Loại Giảng Viên'
FROM GIANGVIEN, MONHOC, HOCVI, LOAIGIANGVIEN
WHERE MONHOC.TenMonHoc  LIKE '%'+RTRIM(LTRIM(@TenMon))+'%' AND GIANGVIEN.MaMonHoc = MONHOC.MaMonHoc AND GIANGVIEN.MaHocVi = HOCVI.MAHOCVI AND GIANGVIEN.MaLoaiGV = LOAIGIANGVIEN.MALOAIGV 
END

GO
/****** Object:  StoredProcedure [dbo].[sp_KHOA_LayThongTinKhoaTheoMaKhoa]    Script Date: 6/14/2017 11:38:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_KHOA_LayThongTinKhoaTheoMaKhoa]
@MaKhoa VARCHAR (5)
AS
BEGIN
SELECT MaKhoa AS N'Mã Khoa', TenKhoa AS N'Tên Khoa', SDT AS N'Số Điện Thoại' 
FROM KHOA
WHERE MaKhoa LIKE '%'+RTRIM(LTRIM(@MaKhoa))+'%'
END

GO
/****** Object:  StoredProcedure [dbo].[sp_KHOA_LayThongTinKhoaTheoTenKhoa]    Script Date: 6/14/2017 11:38:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_KHOA_LayThongTinKhoaTheoTenKhoa]
@TenKhoa NVARCHAR (50)
AS
BEGIN
SELECT MaKhoa AS N'Mã Khoa', TenKhoa AS N'Tên Khoa', SDT AS N'Số Điện Thoại' 
FROM KHOA
WHERE Tenkhoa LIKE '%'+RTRIM(LTRIM(@TenKhoa))+'%'
END








GO
/****** Object:  StoredProcedure [dbo].[sp_KQCNTH_LenDSHocBong]    Script Date: 6/14/2017 11:38:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_KQCNTH_LenDSHocBong] 
@TenNamHoc VARCHAR(30)
AS
BEGIN
DECLARE @MaNamHoc VARCHAR(6)
SELECT @MaNamHoc = MaNamHoc FROM NAMHOC WHERE TenNamHoc = @TenNamHoc
SELECT SINHVIEN.MaSINHVIEN, HoTen  FROM KQ_CA_NAM_TONG_HOP, SINHVIEN
WHERE MaHocLuc = 'HL0001' AND MaNamHoc = @MaNamHoc
END





GO
/****** Object:  StoredProcedure [dbo].[sp_KQCNTH_UpdateMotSinhVien]    Script Date: 6/14/2017 11:38:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_KQCNTH_UpdateMotSinhVien]
@MaSINHVIEN VARCHAR(6), @MaNamHoc VARCHAR(6)
AS
BEGIN
DECLARE @DTBCaNam FLOAT, @MaLop VARCHAR(10), @MaHocLuc VARCHAR(6)
SELECT @MaLop = MaLop FROM SINHVIEN WHERE MaSINHVIEN = @MaSINHVIEN
SELECT @DTBCaNam = ROUND(SUM(DTBMon)/2,1) 
FROM KQ_HOC_KY_TONG_HOP
WHERE MaSINHVIEN = @MaSINHVIEN AND MaNamHoc = @MaNamHoc
GROUP BY MaSINHVIEN, MaNamHoc, MaLop
SELECT @MaHocLuc = (SELECT MaHocLuc FROM HOCLUC WHERE DiemCanDuoi <= @DTBCaNam AND DiemCanTren >= @DTBCaNam)
IF EXISTS (SELECT * FROM KQ_CA_NAM_TONG_HOP WHERE MaSINHVIEN = @MaSINHVIEN AND MaNamHoc = @MaNamHoc)
BEGIN
UPDATE KQ_CA_NAM_TONG_HOP
SET DTBCaNam = @DTBCaNam, MaHocLuc = @MaHocLuc WHERE MaSINHVIEN = @MaSINHVIEN AND MaNamHoc = @MaNamHoc
END
ELSE
INSERT INTO KQ_CA_NAM_TONG_HOP VALUES (@MaSINHVIEN, @MaLop, @MaNamHoc, @MaHocLuc, 'HK0001', @DTBCaNam)
END





GO
/****** Object:  StoredProcedure [dbo].[sp_KQHKTH_LenDSHocBong]    Script Date: 6/14/2017 11:38:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_KQHKTH_LenDSHocBong] 
@TenNamHoc VARCHAR(30), @TenHocKy NVARCHAR(30),@TOP int
AS
BEGIN
DECLARE @MaNamHoc VARCHAR(6), @MaHocKy VARCHAR(6)
SELECT @MaHocKy = MaHocKy FROM HOCKY WHERE TenHocKy = @TenHocKy
SELECT @MaNamHoc = MaNamHoc FROM NAMHOC WHERE TenNamHoc = @TenNamHoc
SELECT B.TenKhoa as[Khoa],A.MaSINHVIEN as[Mã Sinh Viên],A.HoTen as[Họ và Tên],B.TenLop as[Lớp],A.DTBMon as[GPA] FROM (
SELECT A.MaSINHVIEN,A.HoTen,A.MaLop,B.DTBMon FROM(SELECT top(@TOP) with ties MaSINHVIEN,DTBMon FROM KQ_HOC_KY_TONG_HOP
WHERE MaNamHoc = @MaNamHoc AND MaHocKy = @MaHocKy order by DTBMon desc) B 
LEFT JOIN 
SINHVIEN A
ON 
A.MaSINHVIEN=B.MaSINHVIEN) A
LEFT JOIN (
SELECT MaLop,TenLop,TenKhoa FROM LOP
LEFT JOIN KHOA
ON LOP.MaKhoa=KHOA.MaKhoa) B
ON A.MaLop=B.MaLop
END








GO
/****** Object:  StoredProcedure [dbo].[sp_KQHKTH_LenDSHocBong_PhanTram]    Script Date: 6/14/2017 11:38:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_KQHKTH_LenDSHocBong_PhanTram] 
@TenNamHoc VARCHAR(30), @TenHocKy NVARCHAR(30),@TOP int
AS
BEGIN
DECLARE @MaNamHoc VARCHAR(6), @MaHocKy VARCHAR(6)
SELECT @MaHocKy = MaHocKy FROM HOCKY WHERE TenHocKy = @TenHocKy
SELECT @MaNamHoc = MaNamHoc FROM NAMHOC WHERE TenNamHoc = @TenNamHoc
SELECT B.TenKhoa as[Khoa],A.MaSINHVIEN as[Mã Sinh Viên],A.HoTen as[Họ và Tên],B.TenLop as[Lớp],A.DTBMon as[GPA] FROM (
SELECT A.MaSINHVIEN,A.HoTen,A.MaLop,B.DTBMon FROM(SELECT top(@TOP) PERCENT with ties MaSINHVIEN,DTBMon FROM KQ_HOC_KY_TONG_HOP
WHERE MaNamHoc = @MaNamHoc AND MaHocKy = @MaHocKy order by DTBMon desc) B 
LEFT JOIN 
SINHVIEN A
ON 
A.MaSINHVIEN=B.MaSINHVIEN) A
LEFT JOIN (
SELECT MaLop,TenLop,TenKhoa FROM LOP
LEFT JOIN KHOA
ON LOP.MaKhoa=KHOA.MaKhoa) B
ON A.MaLop=B.MaLop
END






GO
/****** Object:  StoredProcedure [dbo].[sp_KQHKTH_UpdateMotSinhVien]    Script Date: 6/14/2017 11:38:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_KQHKTH_UpdateMotSinhVien]
@MaSINHVIEN VARCHAR(6), @MaHocKy VARCHAR(4), @MaNamHoc VARCHAR(6)
AS
BEGIN
DECLARE @DTBMon FLOAT, @MaLop VARCHAR(10), @MaHocLuc VARCHAR(6)
SELECT @MaLop = MaLop FROM SINHVIEN WHERE MaSINHVIEN = @MaSINHVIEN
SELECT @DTBMon = ROUND(SUM(KQ.DTBMonHocKy*MH.SoTinChi)/SUM(MH.SoTinChi),1)
FROM KQ_HOC_KY_MON_HOC KQ, MONHOC MH
WHERE KQ.MaMonHoc = MH.MaMonHoc AND MaSINHVIEN = @MaSINHVIEN AND MaHocKy = @MaHocKy AND MaNamHoc = @MaNamHoc
GROUP BY MaSINHVIEN, MaHocKy, MaNamHoc
SELECT @MaHocLuc = (SELECT MaHocLuc FROM HOCLUC WHERE DiemCanDuoi <= @DTBMon AND DiemCanTren >= @DTBMon)
IF EXISTS (SELECT * FROM KQ_HOC_KY_TONG_HOP WHERE MaSINHVIEN = @MaSINHVIEN AND MaHocKy = @MaHocKy AND MaNamHoc = @MaNamHoc)
BEGIN
UPDATE KQ_HOC_KY_TONG_HOP
SET DTBMon = @DTBMon, MaHocLuc = @MaHocLuc
WHERE MaSINHVIEN = @MaSINHVIEN AND MaHocKy = @MaHocKy AND MaNamHoc = @MaNamHoc
END
ELSE
INSERT INTO KQ_HOC_KY_TONG_HOP VALUES (@MaSINHVIEN, @MaLop, @MaHocKy, @MaNamHoc, @MaHocLuc, 'HK0001', @DTBMon) 
END





GO
/****** Object:  StoredProcedure [dbo].[sp_LOPHOC_LayThongTinLopHocTheoTenKhoa]    Script Date: 6/14/2017 11:38:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_LOPHOC_LayThongTinLopHocTheoTenKhoa]
@TenKhoa nvarchar(50)
AS
BEGIN
	SELECT l.MaLop 'Mã Lớp', l.TenLop 'Tên Lớp', k.TenKhoa 'Tên Khoa',l.SiSo 'Sĩ Số'
	FROM dbo.LOP l,dbo.KHOA k
	WHERE l.MaKhoa=k.MaKhoa AND k.TenKhoa LIKE '%'+LTRIM(RTRIM(@TenKhoa))+'%'
END

GO
/****** Object:  StoredProcedure [dbo].[sp_LOPTINCHI_LayThongTinTheoKhoa]    Script Date: 6/14/2017 11:38:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_LOPTINCHI_LayThongTinTheoKhoa]
@TenKhoa NVARCHAR(50)
AS
SELECT l.MaLopTC N'Mã Lớp Tín Chỉ',m.TenMonHoc N'Tên Môn Học',n.TenNamHoc N'Tên Năm Học',l.SiSo N'Sĩ Số',g.TenGIANGVIEN N'Tên Giảng Viên'
FROM dbo.LOPTINCHI l,dbo.PHANCONG p,dbo.MONHOC m,dbo.NAMHOC n,dbo.GIANGVIEN g,KHOA k
WHERE m.MaKhoa = k.MaKhoa AND p.MaMonHoc=m.MaMonHoc AND p.MaLopTC=l.MaLopTC AND p.MaNamHoc=n.MaNamHoc AND g.MaGIANGVIEN=p.MaGIANGVIEN AND TenKhoa LIKE '%'+RTRIM(LTRIM(@TenKhoa))+'%'

GO
/****** Object:  StoredProcedure [dbo].[sp_LOPTINCHI_LayThongTinTheoMaGV]    Script Date: 6/14/2017 11:38:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_LOPTINCHI_LayThongTinTheoMaGV]
@MaGV VARCHAR(6)
AS
SELECT l.MaLopTC N'Mã Lớp Tín Chỉ',m.TenMonHoc N'Tên Môn Học',n.TenNamHoc N'Tên Năm Học',l.SiSo N'Sĩ Số',g.TenGIANGVIEN N'Tên Giảng Viên'
FROM dbo.LOPTINCHI l,dbo.PHANCONG p,dbo.MONHOC m,dbo.NAMHOC n,dbo.GIANGVIEN g
WHERE p.MaGIANGVIEN  LIKE '%'+RTRIM(LTRIM(@MaGV))+'%' AND p.MaMonHoc=m.MaMonHoc AND p.MaLopTC=l.MaLopTC AND p.MaNamHoc=n.MaNamHoc AND g.MaGIANGVIEN=p.MaGIANGVIEN

GO
/****** Object:  StoredProcedure [dbo].[sp_LOPTINCHI_LayThongTinTheoTenGV]    Script Date: 6/14/2017 11:38:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_LOPTINCHI_LayThongTinTheoTenGV]
@TenGV NVARCHAR(30)
AS
SELECT l.MaLopTC N'Mã Lớp Tín Chỉ',m.TenMonHoc N'Tên Môn Học',n.TenNamHoc N'Tên Năm Học',l.SiSo N'Sĩ Số',g.TenGIANGVIEN N'Tên Giảng Viên'
FROM dbo.LOPTINCHI l,dbo.PHANCONG p,dbo.MONHOC m,dbo.NAMHOC n,dbo.GIANGVIEN g
WHERE g.TenGIANGVIEN LIKE '%'+RTRIM(LTRIM(@TenGV))+'%' AND p.MaMonHoc=m.MaMonHoc AND p.MaLopTC=l.MaLopTC AND p.MaNamHoc=n.MaNamHoc AND g.MaGIANGVIEN=p.MaGIANGVIEN





GO
/****** Object:  StoredProcedure [dbo].[sp_LOPTINCHI_LayThongTinTheoTenNH]    Script Date: 6/14/2017 11:38:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_LOPTINCHI_LayThongTinTheoTenNH]
@TenNH VARCHAR(30)
AS
SELECT l.MaLopTC N'Mã Lớp Tín Chỉ',m.TenMonHoc N'Tên Môn Học',n.TenNamHoc N'Tên Năm Học',l.SiSo N'Sĩ Số',g.TenGIANGVIEN N'Tên Giảng Viên'
FROM dbo.LOPTINCHI l,dbo.PHANCONG p,dbo.MONHOC m,dbo.NAMHOC n,dbo.GIANGVIEN g
WHERE n.TenNamHoc LIKE '%'+RTRIM(LTRIM(@TenNH))+'%' AND p.MaMonHoc=m.MaMonHoc AND p.MaLopTC=l.MaLopTC AND p.MaNamHoc=n.MaNamHoc AND g.MaGIANGVIEN=p.MaGIANGVIEN

GO
/****** Object:  StoredProcedure [dbo].[sp_MDCCHT_SuaMucCanhCao]    Script Date: 6/14/2017 11:38:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_MDCCHT_SuaMucCanhCao]
@MUC1 INT,@MUC2 INT,@MUC3 INT
AS
BEGIN
UPDATE MucDoCanhCaoHocTap
SET SoTinChiNo= @MUC1 WHERE MucCanhCao = N'Mức Cảnh Cáo 1'
UPDATE MucDoCanhCaoHocTap
SET SoTinChiNo= @MUC2 WHERE MucCanhCao = N'Mức Cảnh Cáo 2'
UPDATE MucDoCanhCaoHocTap
SET SoTinChiNo= @MUC3 WHERE MucCanhCao = N'Mức Cảnh Cáo 3'
END





GO
/****** Object:  StoredProcedure [dbo].[sp_MONHOC_LayThongTinKhoaTheoTenMon]    Script Date: 6/14/2017 11:38:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_MONHOC_LayThongTinKhoaTheoTenMon]
@TenMonHoc NVARCHAR (30)
AS
BEGIN
SELECT MONHOC.MaKhoa AS N'Mã Khoa', TenKhoa AS N'Tên Khoa', SDT AS N'Số Điện Thoại' FROM MONHOC, KHOA
WHERE TenMonHoc LIKE '%' + RTRIM(LTRIM(@TenMonHoc)) + '%' AND MONHOC.MaKhoa = KHOA.MaKhoa
END




GO
/****** Object:  StoredProcedure [dbo].[sp_MONHOC_LayThongTinMonHocTheoMaMon]    Script Date: 6/14/2017 11:38:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_MONHOC_LayThongTinMonHocTheoMaMon]
@MaMonHoc NVARCHAR (6)
AS
BEGIN
SELECT MaMonHoc AS N'Mã Môn Học', TenMonHoc AS N'Tên Môn Học', SoTiet AS N'Số Tiết', 
TenKhoa AS N'Tên Khoa', MaTinChi AS N'Loại Tín Chỉ', SoTinChi AS N'Số Tín Chỉ' FROM MONHOC, KHOA
WHERE MaMonHoc  LIKE '%'+RTRIM(LTRIM(@MaMonHoc))+'%' AND MONHOC.MaKhoa = KHOA.MaKhoa
END

GO
/****** Object:  StoredProcedure [dbo].[sp_MONHOC_LayThongTinMonHocTheoMaSinhVien]    Script Date: 6/14/2017 11:38:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_MONHOC_LayThongTinMonHocTheoMaSinhVien]
@MaSinhVien VARCHAR(6)
AS
BEGIN
SELECT DISTINCT MONHOC.MaMonHoc AS N'Mã Môn Học', TenMonHoc AS N'Tên Môn Học', SoTiet AS N'Số Tiết', 
TenKhoa AS N'Tên Khoa', MaTinChi AS N'Loại Tín Chỉ', SoTinChi AS N'Số Tín Chỉ' 
FROM MONHOC, DIEM, KHOA
WHERE MONHOC.MaKhoa = KHOA.MaKhoa AND DIEM.MaSINHVIEN LIKE '%'+RTRIM(LTRIM(@MaSinhVien))+'%' AND DIEM.MaMonHoc=MONHOC.MaMonHoc
END

GO
/****** Object:  StoredProcedure [dbo].[sp_MONHOC_LayThongTinMonHocTheoTenKhoa]    Script Date: 6/14/2017 11:38:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_MONHOC_LayThongTinMonHocTheoTenKhoa]
@TenKhoa NVARCHAR (30)
AS
BEGIN
SELECT DISTINCT MaMonHoc AS N'Mã Môn Học', TenMonHoc AS N'Tên Môn Học', SoTiet AS N'Số Tiết', 
TenKhoa AS N'Tên Khoa', MaTinChi AS N'Loại Tín Chỉ', SoTinChi AS N'Số Tín Chỉ' 
FROM MONHOC, KHOA
WHERE MONHOC.MaKhoa = KHOA.MaKhoa AND TenKhoa LIKE '%'+RTRIM(LTRIM(@TenKhoa))+'%'
END

GO
/****** Object:  StoredProcedure [dbo].[sp_MONHOC_LayThongTinMonHocTheoTenLop]    Script Date: 6/14/2017 11:38:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_MONHOC_LayThongTinMonHocTheoTenLop]
@TenLop NVARCHAR (30)
AS
BEGIN
SELECT DISTINCT MONHOC.MaMonHoc AS N'Mã Môn Học', TenMonHoc AS N'Tên Môn Học', SoTiet AS N'Số Tiết', 
TenKhoa AS N'Tên Khoa', MaTinChi AS N'Loại Tín Chỉ', SoTinChi AS N'Số Tín Chỉ' 
FROM MONHOC, KHOA, LOP, SINHVIEN, DIEM
WHERE MONHOC.MaKhoa = KHOA.MaKhoa AND LOP.TenLop LIKE '%'+RTRIM(LTRIM(@TenLop))+'%' AND LOP.MaLop=SINHVIEN.MaLop AND SINHVIEN.MaSINHVIEN=DIEM.MaSINHVIEN AND DIEM.MaMonHoc=MONHOC.MaMonHoc
END


GO
/****** Object:  StoredProcedure [dbo].[sp_MONHOC_LayThongTinMonHocTheoTenMon]    Script Date: 6/14/2017 11:38:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_MONHOC_LayThongTinMonHocTheoTenMon]
@TenMonHoc NVARCHAR (30)
AS
BEGIN
SELECT MaMonHoc AS N'Mã Môn Học', TenMonHoc AS N'Tên Môn Học', SoTiet AS N'Số Tiết', 
TenKhoa AS N'Tên Khoa', MaTinChi AS N'Loại Tín Chỉ', SoTinChi AS N'Số Tín Chỉ' FROM MONHOC, KHOA
WHERE TenMonHoc  LIKE '%'+RTRIM(LTRIM(@TenMonHoc))+'%' AND MONHOC.MaKhoa = KHOA.MaKhoa
END


GO
/****** Object:  StoredProcedure [dbo].[sp_MONHOC_LayThongTinMonHocTheoTenSinhVien]    Script Date: 6/14/2017 11:38:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_MONHOC_LayThongTinMonHocTheoTenSinhVien]
@TenSinhVien NVARCHAR (30)
AS
BEGIN
SELECT DISTINCT MONHOC.MaMonHoc AS N'Mã Môn Học', TenMonHoc AS N'Tên Môn Học', SoTiet AS N'Số Tiết', 
TenKhoa AS N'Tên Khoa', MaTinChi AS N'Loại Tín Chỉ', SoTinChi AS N'Số Tín Chỉ' 
FROM MONHOC, KHOA, SINHVIEN, DIEM
WHERE MONHOC.MaKhoa = KHOA.MaKhoa AND SINHVIEN.HoTen LIKE '%'+RTRIM(LTRIM(@TenSinhVien))+'%' AND SINHVIEN.MaSINHVIEN=DIEM.MaSINHVIEN AND DIEM.MaMonHoc=MONHOC.MaMonHoc
END







GO
/****** Object:  StoredProcedure [dbo].[sp_NGUOIDUNG_ThayDoiMatKhau]    Script Date: 6/14/2017 11:38:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_NGUOIDUNG_ThayDoiMatKhau]
@TenDNhap VARCHAR(30), @MatKhauMoi VARCHAR(30)
AS
BEGIN
UPDATE NGUOIDUNG
SET MatKhau = @MatKhauMoi WHERE TenDNhap = @TenDNhap
END





GO
/****** Object:  StoredProcedure [dbo].[sp_NGUOIDUNG_ThemNguoiDung]    Script Date: 6/14/2017 11:38:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_NGUOIDUNG_ThemNguoiDung]
@MaND VARCHAR(6), @QuyenHan NVARCHAR(30), @TenND NVARCHAR (30), @TenDNhap VARCHAR (30), @MatKhau VARCHAR (30)
AS
BEGIN
DECLARE @MaLoai VARCHAR(6)
SELECT @MaLoai = MaLoai FROM LOAINGUOIDUNG WHERE @QuyenHan = TenLoaiND
INSERT INTO NGUOIDUNG VALUES (@MaND, @MaLoai, @TenND, @TenDNhap, @MatKhau)
END




GO
/****** Object:  StoredProcedure [dbo].[sp_NGUOIDUNG_XoaNguoiDung]    Script Date: 6/14/2017 11:38:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_NGUOIDUNG_XoaNguoiDung]
@TenDNhap VARCHAR(30) = NULL
AS
BEGIN
DELETE FROM NGUOIDUNG WHERE TenDNhap = @TenDNhap
END





GO
/****** Object:  StoredProcedure [dbo].[sp_PHANCONG_SuaThongTin]    Script Date: 6/14/2017 11:38:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_PHANCONG_SuaThongTin]
@MaLopTCTruoc VARCHAR(10), @MaLopTCSau VARCHAR(10), @TenNamHocTruoc VARCHAR(30),@TenNamHocSau VARCHAR(30), @TenMonHoc NVARCHAR(30), @TenGV NVARCHAR(30), @SiSo INT
AS
BEGIN
DECLARE @MaNamHocTruoc VARCHAR(6), @MaNamHocSau VARCHAR(6), @MaMonHoc VARCHAR(6), @MaGIANGVIEN VARCHAR(6)
SELECT @MaNamHocTruoc = MaNamHoc FROM NAMHOC WHERE @TenNamHocTruoc = TenNamHoc
SELECT @MaNamHocSau = MaNamHoc FROM NAMHOC WHERE @TenNamHocSau = TenNamHoc
SELECT @MaGIANGVIEN = MaGIANGVIEN FROM GIANGVIEN WHERE @TenGV = TenGIANGVIEN
SELECT @MaMonHoc = MaMonHoc FROM MONHOC WHERE @TenMonHoc = TenMonHoc
IF NOT EXISTS (SELECT * FROM LOPTINCHI WHERE MaLopTC = @MaLopTCSau)
BEGIN
INSERT INTO LOPTINCHI VALUES (@MaLopTCSau, @SiSo)
END
ELSE
BEGIN
UPDATE LOPTINCHI
SET SiSo = @SiSo WHERE MaLopTC = @MaLopTCSau
END
UPDATE PHANCONG
SET MaLopTC = @MaLopTCSau, MaNamHoc = @MaNamHocSau, MaMonHoc = @MaMonHoc, MaGIANGVIEN = @MaGIANGVIEN
WHERE MaLopTC = @MaLopTCTruoc AND MaNamHoc = @MaNamHocTruoc
END




GO
/****** Object:  StoredProcedure [dbo].[sp_PHANCONG_ThemVaoBang]    Script Date: 6/14/2017 11:38:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_PHANCONG_ThemVaoBang]
@TenNH VARCHAR(30), @TenGV NVARCHAR(30), @TenMonHoc NVARCHAR(30), @MaLopTC VARCHAR(10), @SiSo INT
AS
DECLARE @MaNamHoc VARCHAR(6), @MaMonHoc VARCHAR(6), @MaGIANGVIEN VARCHAR(6)
SELECT @MaNamHoc = MaNamHoc FROM NAMHOC WHERE @TenNH = TenNamHoc
SELECT @MaGIANGVIEN = MaGIANGVIEN FROM GIANGVIEN WHERE @TenGV = TenGIANGVIEN
SELECT @MaMonHoc = MaMonHoc FROM MONHOC WHERE @TenMonHoc = TenMonHoc
IF NOT EXISTS(SELECT MaLopTC FROM LOPTINCHI WHERE MaLopTC = @MaLopTC)
BEGIN
INSERT INTO LOPTINCHI VALUES (@MaLopTC, @SiSo)
END
INSERT INTO PHANCONG VALUES (@MaNamHoc, @MaLopTC, @MaMonHoc, @MaGIANGVIEN)





GO
/****** Object:  StoredProcedure [dbo].[sp_PHANCONG_XoaLopTinChi]    Script Date: 6/14/2017 11:38:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_PHANCONG_XoaLopTinChi]
@MaLopTC VARCHAR(10), @TenNH VARCHAR(30)
AS
BEGIN
	DELETE FROM KQ_HOC_KY_MON_HOC WHERE MaLopTC=@MaLopTC AND MaNamHoc=(SELECT MaNamHoc FROM NAMHOC WHERE TenNamHoc=@TenNH)
	DELETE FROM DIEM WHERE MaLopTC=@MaLopTC AND MaNamHoc=(SELECT MaNamHoc FROM NAMHOC WHERE TenNamHoc=@TenNH)
	DELETE FROM PHANCONG WHERE MaLopTC=@MaLopTC AND MaNamHoc=(SELECT MaNamHoc FROM NAMHOC WHERE TenNamHoc=@TenNH) 
	DECLARE @count int;
	SELECT @count=count(MaLopTC)
	FROM PHANCONG
	WHERE MaLopTC=@MaLopTC
	IF(@count = 0)
		BEGIN
			DELETE FROM LOPTINCHI WHERE MaLopTC=@MaLopTC
		END
END

GO
/****** Object:  StoredProcedure [dbo].[sp_SINHVIEN_LayThongTinSinhVienTheoHoTen]    Script Date: 6/14/2017 11:38:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_SINHVIEN_LayThongTinSinhVienTheoHoTen]
@HoTen NVARCHAR(30)
AS
BEGIN
SELECT MaSINHVIEN AS N'Mã Sinh Viên', HoTen AS N'Họ Tên', 
CASE
	WHEN (GioiTinh = 1) THEN N'Nữ'
	WHEN (GioiTinh = 0) THEN N'Nam'
END
AS N'Giới Tính',
NgaySinh AS N'Ngày Sinh', NoiSinh AS N'Nơi Sinh', TenDanToc AS N'Dân Tộc', TenTonGiao AS N'Tôn Giáo', HoTenCha AS N'Họ Tên Cha',
NNA.TenNghe AS N'Nghề Nghiệp Cha', HoTenMe AS N'Họ Tên Mẹ', NNB.TenNghe AS N'Nghề Nghiệp Mẹ', DienThoai AS N'Điện Thoại', TenLop AS N'Tên Lớp'
FROM SINHVIEN, DANTOC, TONGIAO, NGHENGHIEP NNA, NGHENGHIEP NNB, LOP
WHERE SINHVIEN.HoTen LIKE '%'+RTRIM(LTRIM(@HoTen))+'%'  AND SINHVIEN.MaDanToc = DANTOC.MaDanToc AND SINHVIEN.MaTonGiao = TONGIAO.MaTonGiao
AND SINHVIEN.MaNNghiepCha = NNA.MaNghe AND SINHVIEN.MaNNghiepMe = NNB.MaNghe AND SINHVIEN.MaLop = LOP.MaLop
END







GO
/****** Object:  StoredProcedure [dbo].[sp_SINHVIEN_LayThongTinSinhVienTheoMaSV]    Script Date: 6/14/2017 11:38:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_SINHVIEN_LayThongTinSinhVienTheoMaSV]
@MaSV NVARCHAR(6)
AS
BEGIN
SELECT MaSINHVIEN AS N'Mã Sinh Viên', HoTen AS N'Họ Tên', 
CASE
	WHEN (GioiTinh = 1) THEN N'Nữ'
	WHEN (GioiTinh = 0) THEN N'Nam'
END
AS N'Giới Tính',
NgaySinh AS N'Ngày Sinh', NoiSinh AS N'Nơi Sinh', TenDanToc AS N'Dân Tộc', TenTonGiao AS N'Tôn Giáo', HoTenCha AS N'Họ Tên Cha',
NNA.TenNghe AS N'Nghề Nghiệp Cha', HoTenMe AS N'Họ Tên Mẹ', NNB.TenNghe AS N'Nghề Nghiệp Mẹ', DienThoai AS N'Điện Thoại', TenLop AS N'Tên Lớp'
FROM SINHVIEN, DANTOC, TONGIAO, NGHENGHIEP NNA, NGHENGHIEP NNB, LOP
WHERE SINHVIEN.MaSINHVIEN  LIKE '%'+RTRIM(LTRIM(@MaSV))+'%' AND SINHVIEN.MaDanToc = DANTOC.MaDanToc AND SINHVIEN.MaTonGiao = TONGIAO.MaTonGiao
AND SINHVIEN.MaNNghiepCha = NNA.MaNghe AND SINHVIEN.MaNNghiepMe = NNB.MaNghe AND SINHVIEN.MaLop = LOP.MaLop
END

GO
/****** Object:  StoredProcedure [dbo].[sp_SINHVIEN_LayThongTinSinhVienTheoTenKhoa]    Script Date: 6/14/2017 11:38:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_SINHVIEN_LayThongTinSinhVienTheoTenKhoa]
@TenKhoa nvarchar(50)
AS
BEGIN
SELECT SINHVIEN.MaSINHVIEN AS N'Mã Sinh Viên', HoTen AS N'Họ Tên', 
CASE
	WHEN (GioiTinh = 1) THEN N'Nữ'
	WHEN (GioiTinh = 0) THEN N'Nam'
END
AS N'Giới Tính',
NgaySinh AS N'Ngày Sinh', NoiSinh AS N'Nơi Sinh', TenDanToc AS N'Dân Tộc', TenTonGiao AS N'Tôn Giáo', HoTenCha AS N'Họ Tên Cha',
NNA.TenNghe AS N'Nghề Nghiệp Cha', HoTenMe AS N'Họ Tên Mẹ', NNB.TenNghe AS N'Nghề Nghiệp Mẹ', DienThoai AS N'Điện Thoại', l.TenLop N'Tên Lớp'
FROM SINHVIEN, DANTOC, TONGIAO, NGHENGHIEP NNA, NGHENGHIEP NNB ,LOP l,KHOA kh
WHERE SINHVIEN.MaDanToc = DANTOC.MaDanToc AND SINHVIEN.MaTonGiao = TONGIAO.MaTonGiao
AND SINHVIEN.MaNNghiepCha = NNA.MaNghe AND SINHVIEN.MaNNghiepMe = NNB.MaNghe AND l.MaLop=SINHVIEN.MaLop AND kh.MaKhoa=l.MaKhoa AND kh.TenKhoa like '%'+LTRIM(RTRIM(@TenKhoa))+'%'
END

GO
/****** Object:  StoredProcedure [dbo].[sp_SINHVIEN_LayThongTinSinhVienTheoTenLop]    Script Date: 6/14/2017 11:38:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_SINHVIEN_LayThongTinSinhVienTheoTenLop]
@TenLop nvarchar(30)
AS
BEGIN
SELECT SINHVIEN.MaSINHVIEN AS N'Mã Sinh Viên', HoTen AS N'Họ Tên', 
CASE
	WHEN (GioiTinh = 1) THEN N'Nữ'
	WHEN (GioiTinh = 0) THEN N'Nam'
END
AS N'Giới Tính',
NgaySinh AS N'Ngày Sinh', NoiSinh AS N'Nơi Sinh', TenDanToc AS N'Dân Tộc', TenTonGiao AS N'Tôn Giáo', HoTenCha AS N'Họ Tên Cha',
NNA.TenNghe AS N'Nghề Nghiệp Cha', HoTenMe AS N'Họ Tên Mẹ', NNB.TenNghe AS N'Nghề Nghiệp Mẹ', DienThoai AS N'Điện Thoại',TenLop N'Tên Lớp'
FROM SINHVIEN, DANTOC, TONGIAO, NGHENGHIEP NNA, NGHENGHIEP NNB ,LOP L
WHERE SINHVIEN.MaDanToc = DANTOC.MaDanToc AND SINHVIEN.MaTonGiao = TONGIAO.MaTonGiao
AND SINHVIEN.MaNNghiepCha = NNA.MaNghe AND SINHVIEN.MaNNghiepMe = NNB.MaNghe AND L.MaLop=SINHVIEN.MaLop AND L.TenLop like '%'+LTRIM(RTRIM(@TenLop))+'%'
END

GO
/****** Object:  StoredProcedure [dbo].[sp_SINHVIEN_SuaThongTinSinhVien]    Script Date: 6/14/2017 11:38:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_SINHVIEN_SuaThongTinSinhVien]
@MaSVTruoc VARCHAR (6),
@MaSV VARCHAR (6),
@HoTen NVARCHAR (30),
@GioiTinhNamNu NVARCHAR(4),
@NgaySinh DATETIME,
@NoiSinh NVARCHAR (50),
@TenDanToc NVARCHAR(30),
@TenTonGiao NVARCHAR(30),
@HoTenCha NVARCHAR (30),
@TenNgheCha NVARCHAR(30),
@HoTenMe NVARCHAR (30),
@TenNgheMe NVARCHAR(30),
@DienThoai VARCHAR(15),
@TenLop NVARCHAR(30)
AS 
BEGIN
	UPDATE [dbo].[SINHVIEN]
    SET
    MaSINHVIEN=@MaSV,
    HoTen=@HoTen,
    GioiTinh=CASE
				WHEN (@GioiTinhNamNu = N'Nữ') THEN 1
				WHEN (@GioiTinhNamNu = N'Nam') THEN 0
			 END,
    NgaySinh=@NgaySinh,
    NoiSinh=@NoiSinh,
    MaDanToc=d.MaDanToc,
    MaTonGiao=t.MaTonGiao,
    HoTenCha=@HoTenCha,
    MaNNghiepCha=n.MaNghe,
    HoTenMe=@HoTenMe,
    MaNNghiepMe=n2.MaNghe,
    DienThoai=@DienThoai,
	MaLop=l.MaLop
	FROM dbo.TONGIAO t,dbo.DANTOC d,dbo.NGHENGHIEP n,dbo.NGHENGHIEP n2,Lop l
    WHERE MaSINHVIEN=@MaSVTruoc AND t.TenTonGiao=@TenTonGiao AND d.TenDanToc=@TenDanToc 
		  AND n.TenNghe=@TenNgheCha AND n2.TenNghe=@TenNgheMe AND l.TenLop=@TenLop
END






GO
/****** Object:  StoredProcedure [dbo].[sp_SINHVIEN_ThemThongTinSinhVien]    Script Date: 6/14/2017 11:38:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_SINHVIEN_ThemThongTinSinhVien]
@MaSV VARCHAR (6),
@HoTen NVARCHAR (30),
@GioiTinhNamNu NVARCHAR(4),
@NgaySinh DATETIME,
@NoiSinh NVARCHAR (50),
@TenDanToc NVARCHAR(30),
@TenTonGiao NVARCHAR(30),
@HoTenCha NVARCHAR (30),
@TenNgheCha NVARCHAR(30),
@HoTenMe NVARCHAR (30),
@TenNgheMe NVARCHAR(30),
@DienThoai VARCHAR(15),
@TenLop NVARCHAR(30)
AS 
BEGIN
DECLARE @MaDanToc VARCHAR (6), @MaTonGiao VARCHAR (6), @MaNNghiepCha VARCHAR (6), @MaNNghiepMe VARCHAR (6), @GioiTinh BIT, @MaLop VARCHAR(10)
SELECT @MaDanToc = MaDanToc FROM DANTOC WHERE @TenDanToc = TenDanToc
SELECT @MaTonGiao = MaTonGiao FROM TONGIAO WHERE @TenTonGiao = TenTonGiao
SELECT @MaNNghiepCha = MaNghe FROM NGHENGHIEP WHERE @TenNgheCha = TenNghe
SELECT @MaNNghiepMe = MaNghe FROM NGHENGHIEP WHERE @TenNgheMe = TenNghe
SELECT @GioiTinh =
CASE
	WHEN (@GioiTinhNamNu = N'Nữ') THEN 1
	WHEN (@GioiTinhNamNu = N'Nam') THEN 0
END
SELECT @MaLop = MaLop FROM LOP WHERE @TenLop = TenLop
INSERT INTO SINHVIEN VALUES (@MaSV, @HoTen, @GioiTinh, @NgaySinh, @NoiSinh, @MaDanToc, @MaTonGiao, @HoTenCha, @MaNNghiepCha, @HoTenMe, @MaNNghiepMe, @DienThoai, @MaLop)
END





GO
/****** Object:  StoredProcedure [dbo].[sp_SINHVIEN_ThongKeSinhVienDanToc]    Script Date: 6/14/2017 11:38:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_SINHVIEN_ThongKeSinhVienDanToc]
as
select * from dbo.func_ThongKeSinhVienTheoDanToc() order by [Dân Tộc]








GO
/****** Object:  StoredProcedure [dbo].[sp_SINHVIEN_ThongKeTonGiao]    Script Date: 6/14/2017 11:38:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_SINHVIEN_ThongKeTonGiao]
@TenTonGiao nvarchar(30)
as
select * from dbo.func_ThongKeSinhVienTheoTonGiao() where [Tôn Giáo] like @TenTonGiao










GO
/****** Object:  StoredProcedure [dbo].[sp_SINHVIEN_XoaThongTinSinhVien]    Script Date: 6/14/2017 11:38:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_SINHVIEN_XoaThongTinSinhVien]
@MaSV VARCHAR(6)
AS
BEGIN
	DELETE FROM DIEM WHERE MaSINHVIEN=@MaSV
	DELETE FROM dbo.KQ_CA_NAM_TONG_HOP WHERE  MaSINHVIEN=@MaSV
	DELETE FROM KQ_HOC_KY_MON_HOC WHERE  MaSINHVIEN=@MaSV
	DELETE FROM KQ_HOC_KY_TONG_HOP WHERE  MaSINHVIEN=@MaSV
	DELETE FROM SINHVIEN WHERE MaSINHVIEN = @MaSV
END
GO
USE [master]
GO
ALTER DATABASE [QLSINHVIEN] SET  READ_WRITE 
GO
