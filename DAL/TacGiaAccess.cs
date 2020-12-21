using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;
using System.Data;
using System.Data.SqlClient;
namespace DAL
{
    public class TacGiaAccess :ConnectionAccess
    {
        public List<TacGia> getAllTacGia()
        {
            List<TacGia> dsTg = new List<TacGia>();
            SqlCommand command = truyVan1("select * from TacGia6");
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                TacGia tg = new TacGia();
                tg.MaTG = reader.GetString(0);
                tg.TenTG = reader.GetString(1);
                tg.Anh = reader.GetString(2);
                dsTg.Add(tg);
                }
            reader.Close();
            return dsTg;
        }
        public int themTacGia(TacGia tg)
        {
            
                SqlCommand command = truyVan1("insert into TacGia6 values(@ma, @ten, @anh)");
                command.Parameters.Add("@ma", SqlDbType.NVarChar).Value = tg.MaTG;
                command.Parameters.Add("@ten", SqlDbType.NVarChar).Value = tg.TenTG;
                command.Parameters.Add("@anh", SqlDbType.NVarChar).Value = tg.Anh;
            return command.ExecuteNonQuery();

        }
    }
}
