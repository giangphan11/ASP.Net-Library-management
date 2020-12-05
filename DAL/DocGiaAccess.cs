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
                dg.NgaySinh = reader.GetDateTime(3);
                dg.MaDT = reader.GetString(4);
                dg.NgayCap = reader.GetDateTime(5);
                dg.NgayGiaHan = reader.GetDateTime(6);
                dsDocGia.Add(dg);
            }
            reader.Close();
            return dsDocGia;
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
