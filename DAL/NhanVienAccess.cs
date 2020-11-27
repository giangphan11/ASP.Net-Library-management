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
