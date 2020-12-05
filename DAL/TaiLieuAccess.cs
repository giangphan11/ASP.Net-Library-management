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
    public class TaiLieuAccess : ConnectionAccess
    {

        public List<TaiLieu> getListDocument()
        {
            List<TaiLieu> list = new List<TaiLieu>();
            openConnection();
            string sql = "SELECT *FROM TaiLieu5";
            SqlCommand cmd = truyVan1(sql);
            SqlDataReader rd = cmd.ExecuteReader();

            while (rd.Read())
            {
                TaiLieu tl = new TaiLieu();
                tl.MaTLieu = (string)rd["matlieu"];
                tl.TenTLieu = (string)rd["tentlieu"];
                tl.MaTLoai = (string)rd["matloai"];
                tl.SLuong = (int)rd["sluong"];
                tl.NXB = (string)rd["nxb"];
                tl.NamXB = (int)rd["namxb"];
                tl.TG = (string)rd["tg"];
                list.Add(tl);
            }
            return list;
        }
        public void createDocument(TaiLieu tl)
        {
            //openConnection();
            string sql = "INSERT INTO TaiLieu5 VALUES(@MaTLieu,@TenTLieu,@MaTLoai,@SLuong,@NXB,@NamXB,@TG)";
           // string sql1 = "INSERT INTO TaiLieu5 VALUES(N'TL09',N'ABC',N'L07',12,N'ABC',2000,N'shj')";
            SqlCommand cmd = truyVan1(sql);

            //cmd.Parameters.AddWithValue("MaTLieu", tl.MaTLieu);
            //cmd.Parameters.AddWithValue("TenTLieu", tl.TenTLieu);
            //cmd.Parameters.AddWithValue("MaTLoai", tl.MaTLoai);
            //cmd.Parameters.AddWithValue("SLuong", tl.SLuong);
            //cmd.Parameters.AddWithValue("NXB", tl.NXB);
            //cmd.Parameters.AddWithValue("NamXB", tl.NamXB);
            //cmd.Parameters.AddWithValue("TG", tl.TG);

            cmd.Parameters.Add("@MaTLieu", SqlDbType.NVarChar).Value = tl.MaTLoai;
            cmd.Parameters.Add("@TenTLieu", SqlDbType.NVarChar).Value = tl.TenTLieu;
            cmd.Parameters.Add("@MaTLoai", SqlDbType.NVarChar).Value = tl.MaTLoai;
            cmd.Parameters.Add("@SLuong", SqlDbType.Int).Value = tl.SLuong;
            cmd.Parameters.Add("@NXB", SqlDbType.NVarChar).Value = tl.NXB;
            cmd.Parameters.Add("@NamXB", SqlDbType.Int).Value = tl.NamXB;
            cmd.Parameters.Add("@TG", SqlDbType.NVarChar).Value = tl.TG;

            cmd.ExecuteNonQuery();
        }
    }
}
