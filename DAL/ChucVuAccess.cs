using DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class ChucVuAccess :ConnectionAccess
    {
        public List<ChucVu> getListChucVu()
        {
            List<ChucVu> dsChucVu = new List<ChucVu>();
            openConnection();
            SqlCommand sqlCommand = truyVan1("select * from ChucVu5");
            SqlDataReader reader = sqlCommand.ExecuteReader();
            while (reader.Read())
            {
                ChucVu cv = new ChucVu();
                cv.MaChucVu = reader.GetString(0);
                cv.TenChucVu = reader.GetString(1);
                dsChucVu.Add(cv);
            }
            return dsChucVu;
        }
        public ChucVu cv(string ma)
        {
            ChucVu cv = new ChucVu();
            SqlCommand command = truyVan1("select * from ChucVu5 where MaCVu =@ma");
            command.Parameters.Add("@ma", SqlDbType.NVarChar).Value = ma;
            SqlDataReader reader = command.ExecuteReader();
            if (reader.Read())
            {
                cv.MaChucVu = reader.GetString(0);
                cv.TenChucVu = reader.GetString(1);
            }
            reader.Close();
            return cv;
        }
        public string xoaChucVu(string ma)
        {
            try
            {
                SqlCommand command = truyVan1("delete from ChucVu5 where MaCVu =@ma");
                command.Parameters.Add("@ma", SqlDbType.NVarChar).Value = ma;
                command.ExecuteNonQuery();
                return "Xoá thành công !";
            }
            catch(Exception ex)
            {
                return "Err: " + ex.Message;
            }
        }
        public string themChucVu(ChucVu cv)
        {
            try
            {
                SqlCommand command = truyVan1("insert into ChucVu5 values(@ma, @ten)");
                command.Parameters.Add("@ma", SqlDbType.NVarChar).Value = cv.MaChucVu;
                command.Parameters.Add("@ten", SqlDbType.NVarChar).Value = cv.TenChucVu;
                command.ExecuteNonQuery();
                return "Thêm thành công !";
            }
            catch (Exception ex)
            {
                return "Err: " + ex.Message;
            }
        }
    }
}
