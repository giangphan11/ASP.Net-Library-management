using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;

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
    }
}
