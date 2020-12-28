using DTO;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
namespace DAL
{
    public class DocGiaAccess:ConnectionAccess
    {
        public List<DocGia> layDanhSachDocGia()
        {
            List<DocGia> dsDocGia = new List<DocGia>();
            SqlCommand command = truyVan1("select * from DocGia5");
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                DocGia dg = new DocGia();
                dg.MaDG = reader.GetString(0);
                dg.TenDG = reader.GetString(1);
                dg.GT = reader.GetString(2);
                dg.NgaySinh = reader.GetDateTime(3).ToString("dd/MM/yyyy");
                dg.MaDT = reader.GetString(4);
                dg.NgayCap = reader.GetDateTime(5).ToString("dd/MM/yyyy");
                dg.NgayGiaHan = reader.GetDateTime(6).ToString("dd/MM/yyyy");
                dg.Anh = reader.GetString(7);
                dsDocGia.Add(dg);
            }
            reader.Close();
            return dsDocGia;
        }



        public List<DocGia> layDanhSachDocGia(string ten)
        {
            List<DocGia> dsDocGia = new List<DocGia>();
            SqlCommand command = truyVan1("select * from DocGia5 Where Hten like @ten");
            command.Parameters.Add("@ten", SqlDbType.NVarChar).Value = ten;
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                DocGia dg = new DocGia();
                dg.MaDG = reader.GetString(0);
                dg.TenDG = reader.GetString(1);
                dg.GT = reader.GetString(2);
                dg.NgaySinh = reader.GetDateTime(3).ToString("dd/MM/yyyy");
                dg.MaDT = reader.GetString(4);
                dg.NgayCap = reader.GetDateTime(5).ToString("dd/MM/yyyy");
                dg.NgayGiaHan = reader.GetDateTime(6).ToString("dd/MM/yyyy");
                dg.Anh = reader.GetString(7);
                dsDocGia.Add(dg);
            }
            reader.Close();
            return dsDocGia;
        }



        public DocGia layDocGiaTheoMa(string ma)
        {
            try
            {
                DocGia dg = new DocGia();
                SqlCommand command = truyVan1("SELECT * FROM DocGia5 WHERE MaDGia = @ma");
                command.Parameters.Add("@ma", SqlDbType.NVarChar).Value = ma;
                SqlDataReader reader = command.ExecuteReader();
                if (reader.Read())
                {
                    dg.MaDG = reader.GetString(0);
                    dg.TenDG = reader.GetString(1);
                    dg.GT = reader.GetString(2);
                    dg.NgaySinh = reader.GetDateTime(3).ToString("dd/MM/yyyy");
                    dg.MaDT = reader.GetString(4);
                    dg.NgayCap = reader.GetDateTime(5).ToString("dd/MM/yyyy");
                    dg.NgayGiaHan = reader.GetDateTime(6).ToString("dd/MM/yyyy");
                    dg.Anh = reader.GetString(7);
                }
                reader.Close();
                return dg;
            }
            catch { }
            return null;
        }

        public string themDocGia(DocGia docGia)
        {
            try
            {
                SqlCommand command = truyVan1("insert into DocGia5 values(@maDG, @tenDG, @gt, @ngaySinh, @maDT, @ngayCap, @ngayHetHan, @anh)");
                command.Parameters.Add("@maDG", SqlDbType.NVarChar).Value = docGia.MaDG;
                command.Parameters.Add("@tenDG", SqlDbType.NVarChar).Value = docGia.TenDG;
                command.Parameters.Add("@gt", SqlDbType.NVarChar).Value = docGia.GT;
                string[] s = docGia.NgaySinh.Split('/');
                DateTime d1 = DateTime.Parse(s[1] + "/" + s[0] +"/"+s[2]);
                command.Parameters.Add("@ngaySinh", SqlDbType.DateTime).Value = d1;
                command.Parameters.Add("@maDT", SqlDbType.NVarChar).Value = docGia.MaDT;
                string[] s2 = docGia.NgayCap.Split('/');
                DateTime d2 = DateTime.Parse(s2[1] + "/" + s2[0] + "/" + s2[2]);
                command.Parameters.Add("@ngayCap", SqlDbType.DateTime).Value = d2;

                string[] s3 = docGia.NgayGiaHan.Split('/');
                DateTime d3 = DateTime.Parse(s3[1] + "/" + s3[0] + "/" + s3[2]);

                command.Parameters.Add("@ngayHetHan", SqlDbType.DateTime).Value = d3;
                command.Parameters.Add("@anh", SqlDbType.NVarChar).Value = docGia.Anh;
                command.ExecuteNonQuery();

                return "Thêm độc giả thành công !";
            }
            catch(Exception ex)
            {
                return "ERR: " + ex.Message;
            }
        }
        public string suaDocGia(DocGia docGia)
        {
            try
            {
                SqlCommand command = truyVan1("update DocGia5 set Hten=@ten, GTinh = @gt, NSinh= @ngSinh, MaDTuong= @maDT, NgayCap= @ngayCap, NgayGHan= @ngayGiaHan, Anh = @anh Where MaDGia= @ma");
                command.Parameters.Add("@ten", SqlDbType.NVarChar).Value = docGia.TenDG;
                command.Parameters.Add("@gt", SqlDbType.NVarChar).Value = docGia.GT;
                string[] s = docGia.NgaySinh.Split('/');
                DateTime d1 = DateTime.Parse(s[1] + "/" + s[0] + "/" + s[2]);
                command.Parameters.Add("@ngSinh", SqlDbType.DateTime).Value = d1;
                command.Parameters.Add("@maDT", SqlDbType.NVarChar).Value = docGia.MaDT;

                string[] s2 = docGia.NgayCap.Split('/');
                DateTime d2 = DateTime.Parse(s2[1] + "/" + s2[0] + "/" + s2[2]);
                command.Parameters.Add("@ngayCap", SqlDbType.DateTime).Value = d2;

                string[] s3 = docGia.NgayGiaHan.Split('/');
                DateTime d3 = DateTime.Parse(s3[1] + "/" + s3[0] + "/" + s3[2]);
                command.Parameters.Add("@ngayGiaHan", SqlDbType.DateTime).Value = d3;
                command.Parameters.Add("@anh", SqlDbType.NVarChar).Value = docGia.Anh;
                command.Parameters.Add("@ma", SqlDbType.NVarChar).Value = docGia.MaDG;
                command.ExecuteNonQuery();
                return "Sửa độc giả thành công !";
            }
            catch(Exception ex)
            {
                return "ERR: "+ ex.Message;
            }
        }

        public string xoaDocGia(string ma)
        {
            try
            {
                SqlCommand command= truyVan1("delete from DocGia5 where MaDGia = @ma");
                command.Parameters.Add("@ma", SqlDbType.NVarChar).Value = ma;
                command.ExecuteNonQuery();
                return "Xoá thành công mã " + ma;
            }
            catch(Exception ex)
            {
                return ex.Message;
            }
        }
    }
}
