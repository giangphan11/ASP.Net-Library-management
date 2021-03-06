USE [QuanLyTV4]
GO
/****** Object:  Table [dbo].[ChucVu5]    Script Date: 12/12/2020 10:20:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChucVu5](
	[MaCVu] [nvarchar](50) NOT NULL,
	[TenCVu] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaCVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocGia5]    Script Date: 12/12/2020 10:20:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocGia5](
	[MaDGia] [nvarchar](50) NOT NULL,
	[Hten] [nvarchar](100) NOT NULL,
	[GTinh] [nvarchar](50) NOT NULL,
	[NSinh] [date] NOT NULL,
	[MaDTuong] [nvarchar](50) NOT NULL,
	[NgayCap] [date] NOT NULL,
	[NgayGHan] [date] NOT NULL,
 CONSTRAINT [PK__DocGia5__38728430182C9B23] PRIMARY KEY CLUSTERED 
(
	[MaDGia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DoiTuong5]    Script Date: 12/12/2020 10:20:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoiTuong5](
	[MaDTuong] [nvarchar](50) NOT NULL,
	[TenDTuong] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDTuong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien5]    Script Date: 12/12/2020 10:20:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien5](
	[MaNVien] [nvarchar](50) NOT NULL,
	[Hten] [nvarchar](100) NOT NULL,
	[MaCVu] [nvarchar](50) NOT NULL,
	[TKhoan] [nvarchar](50) NOT NULL,
	[Mkhau] [nvarchar](50) NOT NULL,
	[Anh] [nvarchar](max) NULL,
 CONSTRAINT [PK__NhanVien__D1EAF88BB00F2AD0] PRIMARY KEY CLUSTERED 
(
	[MaNVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuMuon5]    Script Date: 12/12/2020 10:20:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuMuon5](
	[MaPMuon] [nvarchar](50) NOT NULL,
	[MaDGia] [nvarchar](50) NOT NULL,
	[NgayMuon] [date] NOT NULL,
	[MaNVien] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPMuon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuMuonChiTiet5]    Script Date: 12/12/2020 10:20:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuMuonChiTiet5](
	[MaPMuon] [nvarchar](50) NOT NULL,
	[MaS] [nvarchar](50) NOT NULL,
	[SLMuon] [int] NOT NULL,
	[NgayTra] [date] NOT NULL,
	[TrangThai] [nvarchar](50) NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[MaPMuon] ASC,
	[MaS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TacGia6]    Script Date: 12/12/2020 10:20:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TacGia6](
	[MaTG] [nvarchar](10) NOT NULL,
	[TenTG] [nvarchar](50) NULL,
	[Anh] [nvarchar](50) NULL,
 CONSTRAINT [PK_TacGia6] PRIMARY KEY CLUSTERED 
(
	[MaTG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiLieu5]    Script Date: 12/12/2020 10:20:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiLieu5](
	[MaTLieu] [nvarchar](50) NOT NULL,
	[TenTLieu] [nvarchar](100) NOT NULL,
	[MaTLoai] [nvarchar](50) NOT NULL,
	[SLuong] [int] NOT NULL,
	[NXB] [nvarchar](50) NOT NULL,
	[NamXB] [int] NOT NULL,
	[Anh] [nvarchar](100) NULL,
	[MaTG] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK__TaiLieu5__9D70F854CB882A9C] PRIMARY KEY CLUSTERED 
(
	[MaTLieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TheLoai5]    Script Date: 12/12/2020 10:20:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TheLoai5](
	[MaTLoai] [nvarchar](50) NOT NULL,
	[TenTLoai] [nvarchar](50) NOT NULL,
	[GhiChu] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DocGia5]  WITH CHECK ADD  CONSTRAINT [FK_DocGia5_DoiTuong5] FOREIGN KEY([MaDTuong])
REFERENCES [dbo].[DoiTuong5] ([MaDTuong])
GO
ALTER TABLE [dbo].[DocGia5] CHECK CONSTRAINT [FK_DocGia5_DoiTuong5]
GO
ALTER TABLE [dbo].[NhanVien5]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien5_ChucVu5] FOREIGN KEY([MaCVu])
REFERENCES [dbo].[ChucVu5] ([MaCVu])
GO
ALTER TABLE [dbo].[NhanVien5] CHECK CONSTRAINT [FK_NhanVien5_ChucVu5]
GO
ALTER TABLE [dbo].[PhieuMuon5]  WITH CHECK ADD  CONSTRAINT [FK_PhieuMuon5_DocGia5] FOREIGN KEY([MaDGia])
REFERENCES [dbo].[DocGia5] ([MaDGia])
GO
ALTER TABLE [dbo].[PhieuMuon5] CHECK CONSTRAINT [FK_PhieuMuon5_DocGia5]
GO
ALTER TABLE [dbo].[PhieuMuon5]  WITH CHECK ADD  CONSTRAINT [FK_PhieuMuon5_NhanVien5] FOREIGN KEY([MaNVien])
REFERENCES [dbo].[NhanVien5] ([MaNVien])
GO
ALTER TABLE [dbo].[PhieuMuon5] CHECK CONSTRAINT [FK_PhieuMuon5_NhanVien5]
GO
ALTER TABLE [dbo].[PhieuMuonChiTiet5]  WITH CHECK ADD  CONSTRAINT [FK_PhieuMuon5_PhieuMuonChiTiet5] FOREIGN KEY([MaPMuon])
REFERENCES [dbo].[PhieuMuon5] ([MaPMuon])
GO
ALTER TABLE [dbo].[PhieuMuonChiTiet5] CHECK CONSTRAINT [FK_PhieuMuon5_PhieuMuonChiTiet5]
GO
ALTER TABLE [dbo].[PhieuMuonChiTiet5]  WITH CHECK ADD  CONSTRAINT [FK_PhieuMuonChiTiet5_TaiLieu5] FOREIGN KEY([MaS])
REFERENCES [dbo].[TaiLieu5] ([MaTLieu])
GO
ALTER TABLE [dbo].[PhieuMuonChiTiet5] CHECK CONSTRAINT [FK_PhieuMuonChiTiet5_TaiLieu5]
GO
ALTER TABLE [dbo].[TaiLieu5]  WITH CHECK ADD  CONSTRAINT [FK_TaiLieu5_DocGia5] FOREIGN KEY([MaTLoai])
REFERENCES [dbo].[TheLoai5] ([MaTLoai])
GO
ALTER TABLE [dbo].[TaiLieu5] CHECK CONSTRAINT [FK_TaiLieu5_DocGia5]
GO
/****** Object:  StoredProcedure [dbo].[MUON_QUA_HAN]    Script Date: 12/12/2020 10:20:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[MUON_QUA_HAN]
AS
BEGIN
	select DocGia5.MaDGia as 'a' , 
		DocGia5.Hten as 'b' ,
		TaiLieu5.MaTLieu as 'c' ,
		TaiLieu5.TenTLieu as 'd',
		PhieuMuon5.NgayMuon as 'e',
		(DATEDIFF(day, PhieuMuon5.NgayMuon,getdate() )-30) AS 'f' 
		from PhieuMuonChiTiet5 inner join TaiLieu5 
		on PhieuMuonChiTiet5.MaS=TaiLieu5.MaTLieu inner join PhieuMuon5
		on PhieuMuonChiTiet5.MaPMuon=PhieuMuon5.MaPMuon inner join DocGia5 
		on PhieuMuon5.MaDGia=DocGia5.MaDGia 
		where (DATEDIFF(day, PhieuMuon5.NgayMuon, getdate() )-30) >0 and TrangThai = N'Đang mượn'
END 
GO
/****** Object:  StoredProcedure [dbo].[PROC_TOP10]    Script Date: 12/12/2020 10:20:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PROC_TOP10]
AS
 BEGIN
	SELECT TOP(10) TenTLieu,TenTLoai,SLuong,GhiChu 
	FROM dbo.TheLoai5 INNER JOIN dbo.TaiLieu5 ON TaiLieu5.MaTLoai = TheLoai5.MaTLoai 
	INNER JOIN dbo.PhieuMuonChiTiet5 ON PhieuMuonChiTiet5.MaS = TaiLieu5.MaTLieu
	 WHERE NgayTra BETWEEN'1990-02-02' AND GETDATE()
	 GROUP BY TenTLieu,TenTLoai,SLuong,GhiChu 
	ORDER BY SLuong DESC
 END
GO
/****** Object:  StoredProcedure [dbo].[PROC_TOP10TL]    Script Date: 12/12/2020 10:20:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PROC_TOP10TL] (@START DATE, @END DATE)
  AS
  BEGIN
	SELECT TOP(10) TenTLieu,TenTLoai,SLuong,GhiChu 
	FROM dbo.TheLoai5 INNER JOIN dbo.TaiLieu5 ON TaiLieu5.MaTLoai = TheLoai5.MaTLoai 
	INNER JOIN dbo.PhieuMuonChiTiet5 ON PhieuMuonChiTiet5.MaS = TaiLieu5.MaTLieu
	
	 WHERE NgayTra BETWEEN @START AND @END
	 GROUP BY TenTLieu,TenTLoai,SLuong,GhiChu 
	ORDER BY SLuong DESC
  END
GO
/****** Object:  StoredProcedure [dbo].[TK_MUON_THEO_TL]    Script Date: 12/12/2020 10:20:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[TK_MUON_THEO_TL] (@ngay1 date, @ngay2 date)
as
begin
	SELECT TaiLieu5.MaTLoai, 
		TheLoai5.TenTLoai, 
		COUNT(MaS)as 'SoLanMuon',
		 TheLoai5.GhiChu 
		 From TheLoai5 inner join TaiLieu5 on TaiLieu5.MaTLoai = TheLoai5.MaTLoai
			inner join PhieuMuonChiTiet5 on TaiLieu5.MaTLieu = PhieuMuonChiTiet5.MaS
			 inner join PhieuMuon5 on PhieuMuonChiTiet5.MaPMuon = PhieuMuon5.MaPMuon
			  WHERE NgayMuon BETWEEN @ngay1 AND @ngay2
			  GROUP BY  TaiLieu5.MaTLoai, TheLoai5.TenTLoai,TheLoai5.GhiChu
end
GO
/****** Object:  StoredProcedure [dbo].[TK_MUON_THEO_TL_ALL]    Script Date: 12/12/2020 10:20:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[TK_MUON_THEO_TL_ALL] @ngay1 date
as
begin
	SELECT TaiLieu5.MaTLoai, 
		TheLoai5.TenTLoai, 
		COUNT(MaS)as 'SoLanMuon',
		 TheLoai5.GhiChu 
		 From TheLoai5 inner join TaiLieu5 on TaiLieu5.MaTLoai = TheLoai5.MaTLoai
			inner join PhieuMuonChiTiet5 on TaiLieu5.MaTLieu = PhieuMuonChiTiet5.MaS
			 inner join PhieuMuon5 on PhieuMuonChiTiet5.MaPMuon = PhieuMuon5.MaPMuon
			  WHERE NgayMuon BETWEEN '1/1/1000' AND @ngay1
			  GROUP BY  TaiLieu5.MaTLoai, TheLoai5.TenTLoai,TheLoai5.GhiChu
end
GO
