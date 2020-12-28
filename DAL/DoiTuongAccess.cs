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
        public string themDoiTuong(DoiTuong dt)
        {
            try
            {
                SqlCommand command = truyVan1("insert into DoiTuong5 values(@ma, @ten)");
                command.Parameters.Add("@ma", SqlDbType.NVarChar).Value = dt.MaDT;
                command.Parameters.Add("@ten", SqlDbType.NVarChar).Value = dt.TenDT;
                command.ExecuteNonQuery();
                return "Thêm thành công !";
            }
            catch(Exception ex)
            {
                return "Lỗi: "+ex.Message;
            }
        }

        public DoiTuong layDoiTuongTheoMa(string ma)
        {
            DoiTuong doiTuong = new DoiTuong();
            try
            {
                SqlCommand command = truyVan1("SELECT * FROM DoiTuong5 WHERE MaDTuong =@ma");
                command.Parameters.Add("@ma", SqlDbType.NVarChar).Value = ma;
                SqlDataReader reader = command.ExecuteReader();
                if (reader.Read())
                {
                    doiTuong.MaDT = reader.GetString(0);
                    doiTuong.TenDT = reader.GetString(1);
                }
                reader.Close();
                return doiTuong;
            }
            catch { }
            return null;
        }
        public string suaDoiTuong(DoiTuong dt)
        {
            try
            {
                SqlCommand command = truyVan1("UPDATE DoiTuong5 set TenDTuong = @ten WHERE MaDTuong = @ma");
                command.Parameters.Add("@ten", SqlDbType.NVarChar).Value = dt.TenDT;
                command.Parameters.Add("@ma", SqlDbType.NVarChar).Value = dt.MaDT;
                command.ExecuteNonQuery();
                return "Sửa đối tượng thành công !";
            }
            catch(Exception ex)
            {
                return "ERR: " + ex.Message;
            }
        }
        public string xoaDT(string ma)
        {
            try
            {
                SqlCommand command = truyVan1("delete from DoiTuong5 where MaDTuong = @ma");
                command.Parameters.Add("@ma", SqlDbType.NVarChar).Value = ma;
                command.ExecuteNonQuery();
                return ma + " deleted !";
            }
            catch(Exception ex)
            {
                return ex.Message;
            }
        }
    }
}
