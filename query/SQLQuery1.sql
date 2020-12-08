
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
/* TOP 10 TÀI LIỆU MƯỢN NHIỀU NHẤT*/
