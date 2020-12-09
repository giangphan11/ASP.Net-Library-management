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
    public class MuonTheoTheLoaiAccess:ConnectionAccess
    {

        public List<MuonTheoTheLoai> muonTheoTheLoaisALL(DateTime date1)
        {
            List<MuonTheoTheLoai> dsM = new List<MuonTheoTheLoai>();
            SqlCommand command = truyVan2("TK_MUON_THEO_TL_ALL");
            command.Parameters.Add("@ngay1", SqlDbType.Date).Value = date1;
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                MuonTheoTheLoai m = new MuonTheoTheLoai();
                m.MaTL = reader.GetString(0);
                m.TenTL = reader.GetString(1);
                m.SoLanMuon = reader.GetInt32(2);
                m.GhiChu = reader.GetString(3);
                dsM.Add(m);
            }
            reader.Close();
            return dsM;
        }


        public List<MuonTheoTheLoai> muonTheoTheLoaisDate(DateTime date1, DateTime date2)
        {
            List<MuonTheoTheLoai> dsM = new List<MuonTheoTheLoai>();
            SqlCommand command = truyVan2("TK_MUON_THEO_TL");
            command.Parameters.Add("@ngay1", SqlDbType.Date).Value = date1;
            command.Parameters.Add("@ngay2", SqlDbType.Date).Value = date2;
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                MuonTheoTheLoai m = new MuonTheoTheLoai();
                m.MaTL = reader.GetString(0);
                m.TenTL = reader.GetString(1);
                m.SoLanMuon = reader.GetInt32(2);
                m.GhiChu = reader.GetString(3);
                dsM.Add(m);
            }
            reader.Close();
            return dsM;
        }

    }
}
