using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;

namespace DAL
{
    public class ConnectionAccess
    {
        public SqlConnection getConnect()
        {
            //return new SqlConnection(@"Data Source=GIANGPHAN;Initial Catalog=CSDL_QuanLyThuVien;Integrated Security=True");
            return new SqlConnection(@"Data Source=GIANGPHAN;Initial Catalog=QuanLyTV4;Integrated Security=True");
        }

        protected SqlConnection conn = null;
        private string strConnection = "Data Source=GIANGPHAN;Initial Catalog=QuanLyTV4;Integrated Security=True";
        public void openConnection()
        {
            if (conn == null)
            {
                conn = new SqlConnection(strConnection);
            }
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }    
        }
        public void closeConnection()
        {
            if (conn.State == ConnectionState.Open)
                conn.Close();
        }
        public SqlCommand truyVan1(string sql)
        {
            SqlCommand command = new SqlCommand();
            openConnection();
            command.CommandType = CommandType.Text;
            command.CommandText = sql;
            command.Connection = conn;
            return command;
        }
        public SqlCommand truyVan2(string sql)
        {
            SqlCommand command = new SqlCommand();
            openConnection();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = sql;
            command.Connection = conn;
            return command;
        }


        public void ExecuteNonQuery(string sql)
        {
            SqlConnection conn = getConnect();
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            cmd.Clone();
        }

        public string[] getPhieu2(string maPhieu)
        {
            SqlConnection conn = getConnect();
            conn.Open();

            string sql = "select PhieuMuon5.MaDGia, DocGia5.Hten, NgayMuon, NhanVien5.MaNVien, NhanVien5.Hten from PhieuMuon5 inner join DocGia5 on PhieuMuon5.MaDGia = DocGia5.MaDGia inner join NhanVien5 on NhanVien5.MaNVien = PhieuMuon5.MaNVien where MaPMuon = '" + maPhieu + "' ";
            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlDataReader reader = cmd.ExecuteReader();

            string[] param = new string[5];
            while (reader.Read())
            {
                param[0] = reader.GetString(0);
                param[1] = reader.GetString(1);
                param[2] = reader.GetDateTime(2).ToString("yyyy-MM-dd");
                param[3] = reader.GetString(3);
                param[4] = reader.GetString(4);
            }
            return param;
        }



        //lay thong tin phieu 2
        public string[] getPhieu3(string maDgia)
        {
            SqlConnection conn = getConnect();
            conn.Open();

            string sql = "select PhieuMuon5.MaDGia, DocGia5.Hten," +
                " NgayMuon, NhanVien5.MaNVien, NhanVien5.Hten from PhieuMuon5 " +
                "inner join DocGia5 on PhieuMuon5.MaDGia = DocGia5.MaDGia " +
                "inner join NhanVien5 on NhanVien5.MaNVien = PhieuMuon5.MaNVien " +
                "where MaPMuon = '" + maDgia + "' ";
            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlDataReader reader = cmd.ExecuteReader();

            string[] param = new string[5];
            while (reader.Read())
            {
                param[0] = reader.GetString(0);
                param[1] = reader.GetString(1);
                param[2] = reader.GetDateTime(2) + "";
                param[3] = reader.GetString(3);
                param[4] = reader.GetString(4);
            }
            return param;
        }





        public DataTable getChiTietPhieu(string sql)
        {
            SqlConnection conn = getConnect();
            conn.Open();
            SqlDataAdapter adt = new SqlDataAdapter(sql, conn);
            DataTable dtb = new DataTable();
            adt.Fill(dtb);

            return dtb;
        }

        //lấy tên đối tượng khi thay đổi text <dùng scalar>
        public string getTenDocGia(string ma)
        {
            string ten = "";//nếu như null thì không tìm thấy
            SqlConnection conn = getConnect();
            conn.Open();
            string sql = "select HTen from DocGia5 where MaDGia = '" + ma + "' ";
            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                ten = reader.GetString(0);
            }
            reader.Close();

            return ten;
        }


        //lấy tên nhân viên khi thay đổi text
        public object getTenNhanVien(string ma)
        {
            object HoTen = null; //nếu như null thì không tìm thấy
            SqlConnection conn = getConnect();
            conn.Open();
            string sql = "select HTen from NhanVien5 where MaNVien = '" + ma + "' ";
            SqlCommand cmd = new SqlCommand(sql, conn);
            HoTen = cmd.ExecuteScalar();

            return HoTen;
        }


        //lấy tên nhân viên khi thay đổi text
        public object getTaiLieu(string ma)
        {
            object tenTL = null; //nếu như null thì không tìm thấy
            SqlConnection conn = getConnect();
            conn.Open();
            string sql = "select TenTLieu from TaiLieu5 where MaTLieu = '" + ma + "' ";
            SqlCommand cmd = new SqlCommand(sql, conn);
            tenTL = cmd.ExecuteScalar();

            return tenTL;
        }

        //lenh tra ve mot bang
        public DataTable GetTable(string sql)
        {
            SqlConnection conn = getConnect();
            conn.Open();
            SqlDataAdapter ad = new SqlDataAdapter(sql, conn);
            DataTable dt = new DataTable();
            ad.Fill(dt);
            return dt;
        }


        //lấy số lượng hiện tại của tài liệu
        public object getSoLuongTaiLieu(string ma)
        {
            SqlConnection conn = getConnect();
            conn.Open();

            string sql = "select Sluong from TaiLieu5 where MaTLieu = '" + ma + "' ";
            SqlCommand cmd = new SqlCommand(sql, conn);
            object soluong = cmd.ExecuteScalar();

            return soluong;
        }


        //hàm lấy số lượng mượn hiện tại trong phieumuonchitiet5
        public object getSoLuongMuon(string maP, string maS)
        {
            SqlConnection conn = getConnect();
            conn.Open();

            string sql = "select SLMuon from PhieuMuonChiTiet5 where MaPMuon = '" + maP + "' and MaS = '" + maS + "' ";
            SqlCommand cmd = new SqlCommand(sql, conn);
            object soluong = cmd.ExecuteScalar();

            return soluong;
        }

    }
}
