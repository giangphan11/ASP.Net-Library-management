
/* Mượn quá hạn */ 

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
GO
CREATE PROC MUON_QUA_HAN
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
EXEC MUON_QUA_HAN
go
/*MƯỢN THEO THỂ LOẠI*/
SELECT TaiLieu5.MaTLoai, 
		TheLoai5.TenTLoai, 
		COUNT(MaS)as 'SoLanMuon',
		 TheLoai5.GhiChu 
		 From TheLoai5 inner join TaiLieu5 on TaiLieu5.MaTLoai = TheLoai5.MaTLoai
			inner join PhieuMuonChiTiet5 on TaiLieu5.MaTLieu = PhieuMuonChiTiet5.MaS
			 inner join PhieuMuon5 on PhieuMuonChiTiet5.MaPMuon = PhieuMuon5.MaPMuon
			  WHERE NgayMuon BETWEEN '2/2/1990' AND '3/3/2020'
			  GROUP BY  TaiLieu5.MaTLoai, TheLoai5.TenTLoai,TheLoai5.GhiChu
go
create proc TK_MUON_THEO_TL_ALL @ngay1 date
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
go
exec TK_MUON_THEO_TL_ALL '12/8/2020 10:59:47 PM'
go
create proc TK_MUON_THEO_TL (@ngay1 date, @ngay2 date)
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
go
exec TK_MUON_THEO_TL '12/23/2020', '12/30/2020'
go
/* TOP 10 TÀI LIỆU MƯỢN NHIỀU NHẤT*/
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
EXEC PROC_TOP10
GO
/* TOP 10 TÀI LIỆU MƯỢN NHIỀU NHẤT THEO DATE*/
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
EXEC PROC_TOP10TL '01/01/1999', '01/01/2020'