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
    public class DoiTuongAccess:ConnectionAccess
    {
        public List<DoiTuong> dsDoiTuong()
        {
            List<DoiTuong> dsDt = new List<DoiTuong>();
            SqlCommand command = truyVan1("select * from DoiTuong5");
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                DoiTuong dt = new DoiTuong();
                dt.MaDT = reader.GetString(0);
                dt.TenDT = reader.GetString(1);
                dsDt.Add(dt);
            }
            reader.Close();
            return dsDt;
        }
    }
}
