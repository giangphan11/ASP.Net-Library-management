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
                MuonQuaHan muonQuaHan = new MuonQuaHan();
                muonQuaHan.MaDocGia = reader.GetString(0);
                muonQuaHan.TenDocGia = reader.GetString(1);
                muonQuaHan.MaTL = reader.GetString(2);
                muonQuaHan.TenTL = reader.GetString(3);
                DateTime dt = reader.GetDateTime(4);
                muonQuaHan.NgayMuon = dt.ToString("dd/MM/yyyy");
                muonQuaHan.SoNgayMuonQH = reader.GetInt32(5);
                ds.Add(muonQuaHan);
            }
            reader.Close();

            return ds;
        }

    }
}
