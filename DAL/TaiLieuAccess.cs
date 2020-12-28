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
                tl.Anh =(string)rd["anh"];
                tl.MaTG = (string)rd["matg"];
                list.Add(tl);
            }
            rd.Close();
            return list;
        }


        public List<TaiLieu> getListDocument(string ten)
        {
            List<TaiLieu> list = new List<TaiLieu>();
            openConnection();
            string sql = "SELECT *FROM TaiLieu5 WHERE TenTLieu like @ten";
            SqlCommand cmd = truyVan1(sql);
            cmd.Parameters.Add("@ten", SqlDbType.NVarChar).Value = ten;
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
                tl.Anh = (string)rd["anh"];
                tl.MaTG = (string)rd["matg"];
                list.Add(tl);
            }
            rd.Close();
            return list;
        }


        public TaiLieu getTaiLieuTheoMa(string ma)
        {
            try
            {
                TaiLieu taiLieu = new TaiLieu();
                SqlCommand command = truyVan1("select * from TaiLieu5 where MaTLieu = @ma");
                command.Parameters.Add("@ma", SqlDbType.NVarChar).Value = ma;
                SqlDataReader reader = command.ExecuteReader();
                if (reader.Read())
                {
                    taiLieu.MaTLieu = reader.GetString(0);
                    taiLieu.TenTLieu = reader.GetString(1);
                    taiLieu.MaTLoai = reader.GetString(2);
                    taiLieu.SLuong = reader.GetInt32(3);
                    taiLieu.NXB = reader.GetString(4);
                    taiLieu.NamXB = reader.GetInt32(5);
                    taiLieu.Anh = reader.GetString(6);
                    taiLieu.MaTG = reader.GetString(7);
                }
                reader.Close();
                return taiLieu;
            }
            catch(Exception exx)
            {
                return null;
            }
        }

        public string suaTaiLieu(TaiLieu taiLieu)
        {
            try
            {

                SqlCommand command = truyVan1("update TaiLieu5 set TenTLieu=@ten,MaTLoai=@maTLoai,SLuong=@sl,NXB=@nxb,NamXB=@namXB, Anh = @anh, MaTG=@tg where MaTLieu=@ma");
                command.Parameters.Add("@ma", SqlDbType.NVarChar).Value = taiLieu.MaTLieu;
                command.Parameters.Add("@ten", SqlDbType.NVarChar).Value = taiLieu.TenTLieu;
                command.Parameters.Add("@maTLoai", SqlDbType.NVarChar).Value = taiLieu.MaTLoai;
                command.Parameters.Add("@nxb", SqlDbType.NVarChar).Value = taiLieu.NXB;
                command.Parameters.Add("@tg", SqlDbType.NVarChar).Value = taiLieu.MaTG;
                command.Parameters.Add("@anh", SqlDbType.NVarChar).Value = taiLieu.Anh;
                command.Parameters.Add("@sl", SqlDbType.Int).Value = taiLieu.SLuong;
                command.Parameters.Add("@namXB", SqlDbType.Int).Value = taiLieu.NamXB;
                command.Connection = conn;
                command.ExecuteNonQuery();
                return "Sửa tài liệu thành công !";
            }
            catch(Exception ex)
            {
                return "ERR: "+ex.Message;
            }
        }



        public string deleteDoc(string ma)
        {
            try
            {

                SqlCommand command = truyVan1("delete from TaiLieu5 where MaTLieu = @ma");
                command.Parameters.Add("@ma", SqlDbType.NVarChar).Value = ma;
                command.ExecuteNonQuery();
                return "Document deleted !";
            }
            catch(Exception ex)
            {
                return ex.Message;
            }
        }
        public string updateDocument(TaiLieu taiLieu)
        {
            try
            {
                SqlCommand command = truyVan1("update TaiLieu5 set TenTLieu=@ten,MaTLoai=@maTLoai,SLuong=@sl,NXB=@nxb,NamXB=@namXB,Anh = @anh,TG=@tg where MaTLieu=@ma");
                command.Parameters.Add("@ma", SqlDbType.NVarChar).Value = taiLieu.MaTLieu;
                command.Parameters.Add("@ten", SqlDbType.NVarChar).Value = taiLieu.TenTLieu;
                command.Parameters.Add("@maTLoai", SqlDbType.NVarChar).Value = taiLieu.MaTLoai;
                command.Parameters.Add("@nxb", SqlDbType.NVarChar).Value = taiLieu.NXB;
                command.Parameters.Add("@tg", SqlDbType.NVarChar).Value = taiLieu.MaTG;
                command.Parameters.Add("@anh", SqlDbType.NVarChar).Value = taiLieu.Anh;
                command.Parameters.Add("@sl", SqlDbType.Int).Value = taiLieu.SLuong;
                command.Parameters.Add("@namXB", SqlDbType.Int).Value = taiLieu.NamXB;
                command.ExecuteNonQuery();
                return "Document Updated !";
            }
            catch(Exception ex)
            {
                return ex.Message;
            }
        }
        public void createDocument(TaiLieu tl)
        {
            string sql = "INSERT INTO TaiLieu5 VALUES(@ma,@tenTL,@maTL,@sl,@nhaXB,@namXB,@anh,@tacgia)";
           // string sql1 = "INSERT INTO TaiLieu5 VALUES(N'TL09',N'ABC',N'L07',12,N'ABC',2000,N'shj')";
            SqlCommand cmd = truyVan1(sql);

            cmd.Parameters.Add("@ma", SqlDbType.NVarChar).Value = tl.MaTLieu;
            cmd.Parameters.Add("@tenTL", SqlDbType.NVarChar).Value = tl.TenTLieu;
            cmd.Parameters.Add("@maTL", SqlDbType.NVarChar).Value = tl.MaTLoai;
            cmd.Parameters.Add("@sl", SqlDbType.Int).Value = tl.SLuong;
            cmd.Parameters.Add("@nhaXB", SqlDbType.NVarChar).Value = tl.NXB;
            cmd.Parameters.Add("@namXB", SqlDbType.Int).Value = tl.NamXB;
            cmd.Parameters.Add("@anh", SqlDbType.NVarChar).Value = tl.Anh;
            cmd.Parameters.Add("@tacgia", SqlDbType.NVarChar).Value = tl.MaTG;
            cmd.ExecuteNonQuery();
        }
    }
}
