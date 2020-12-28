using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;
using System.Data;
namespace DAL
{
    public class NhanVienAccess :ConnectionAccess
    {
        public List<NhanVien> layDanhSachNhanVien()
        {
            List<NhanVien> dsNhanVien = new List<NhanVien>();
            SqlCommand command = truyVan1("select * from NhanVien5");
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                NhanVien nv = new NhanVien();
                nv.MaNV = reader.GetString(0);
                nv.TenNV = reader.GetString(1);
                nv.MaCV = reader.GetString(2);
                nv.Username = reader.GetString(3);
                nv.PassWord = reader.GetString(4);
                nv.Anh = reader.GetString(5);
                dsNhanVien.Add(nv);
            }
            reader.Close();
            return dsNhanVien;
        }

        public List<NhanVien> layDanhSachNhanVien(string ten)
        {
            List<NhanVien> dsNhanVien = new List<NhanVien>();
            SqlCommand command = truyVan1("select * from NhanVien5 WHERE Hten like @ten");
            command.Parameters.Add("@ten", SqlDbType.NVarChar).Value = ten;
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                NhanVien nv = new NhanVien();
                nv.MaNV = reader.GetString(0);
                nv.TenNV = reader.GetString(1);
                nv.MaCV = reader.GetString(2);
                nv.Username = reader.GetString(3);
                nv.PassWord = reader.GetString(4);
                nv.Anh = reader.GetString(5);
                dsNhanVien.Add(nv);
            }
            reader.Close();
            return dsNhanVien;
        }


        public string xoaNhanVien(string ma)
        {
            try
            {
                SqlCommand command = truyVan1("delete from NhanVien5 where MaNVien = @ma");
                command.Parameters.Add("@ma", SqlDbType.NVarChar).Value = ma;
                command.ExecuteNonQuery();
                return "Xoá thành công !";
            }
            catch(Exception ex)
            {
                return ex.Message;
            }
        }

        // get NhanVien by MaNV
        public NhanVien getNhanVien(string ma)
        {
            NhanVien nhanVien = new NhanVien();
            try
            {
                SqlCommand command = truyVan1("SELECT * FROM NhanVien5 WHERE MaNVien = @ma");
                command.Parameters.Add("ma", SqlDbType.NVarChar).Value = ma;
                SqlDataReader reader = command.ExecuteReader();
                if (reader.Read())
                {
                    nhanVien.MaNV = reader.GetString(0);
                    nhanVien.TenNV = reader.GetString(1);
                    nhanVien.MaCV = reader.GetString(2);
                    nhanVien.Username = reader.GetString(3);
                    nhanVien.PassWord = reader.GetString(4);
                    nhanVien.Anh = reader.GetString(5);
                }
                reader.Close();
                return nhanVien;
            }
            catch(Exception ex)
            {
                return null;
            }
        }

        public string suaNhanVien(NhanVien nv)
        {
            try
            {
                SqlCommand command = truyVan1("UPDATE NhanVien5 set Hten = @ten, MaCVu = @maCV, TKhoan = @tk, MKhau = @mk, Anh = @anh WHERE MaNVien = @ma");
                command.Parameters.Add("@ten", SqlDbType.NVarChar).Value = nv.TenNV;
                command.Parameters.Add("@maCV", SqlDbType.NVarChar).Value = nv.MaCV;
                command.Parameters.Add("@tk", SqlDbType.NVarChar).Value = nv.Username;
                command.Parameters.Add("@mk", SqlDbType.NVarChar).Value = nv.PassWord;
                command.Parameters.Add("@anh", SqlDbType.NVarChar).Value = nv.Anh;
                command.Parameters.Add("@ma", SqlDbType.NVarChar).Value = nv.MaNV;
                command.ExecuteNonQuery();
                return "Sửa nhân viên thành công !";
            }
            catch(Exception ex)
            {
                return "ERR: " + ex.Message;
            }
        }
        public string themNhanVien(NhanVien nv)
        {
            try
            {
                SqlCommand command = truyVan1("insert into NhanVien5 values(@ma, @ten, @mCV, @tk, @mk, @anh)");
                command.Parameters.Add("@ma", SqlDbType.NVarChar).Value = nv.MaNV;
                command.Parameters.Add("@ten", SqlDbType.NVarChar).Value = nv.TenNV;
                command.Parameters.Add("@mCV", SqlDbType.NVarChar).Value = nv.MaCV;
                command.Parameters.Add("@tk", SqlDbType.NVarChar).Value = nv.Username;
                command.Parameters.Add("@mk", SqlDbType.NVarChar).Value = nv.PassWord;
                command.Parameters.Add("@anh", SqlDbType.NVarChar).Value = nv.Anh;
                command.ExecuteNonQuery();
                return "Add Nhanvien successfully !";
            }catch(Exception ex)
            {
                return ex.Message;
            }
        }
    }
}
