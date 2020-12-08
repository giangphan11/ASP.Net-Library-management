using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using DTO;
namespace DAL
{
    public class MuonQuaHanAccess:ConnectionAccess
    {
        public List<MuonQuaHan> listMuonQUaHan()
        {
            List<MuonQuaHan> ds = new List<MuonQuaHan>();
            openConnection();
            SqlCommand command = truyVan2("MUON_QUA_HAN");
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {

            }
            reader.Close();

            return ds;
        }

    }
}
