using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Data;

namespace DAL
{
    public class TheLoaiAccess:ConnectionAccess
    {
        public List<TheLoai> getListCategory()
        {
            List<TheLoai> list = new List<TheLoai>();
            openConnection();
            SqlCommand sqlCommand = truyVan1("select * from TheLoai5");
            SqlDataReader rd = sqlCommand.ExecuteReader();
            while (rd.Read())
            {
                TheLoai category = new TheLoai();
                category.MaTLoai = rd.GetString(0);
                category.TenTLoai = rd.GetString(1);
                category.GhiChu = rd.GetString(2);

                list.Add(category);
            }
            return list;
        }
        public TheLoai findByID(string MaTLoai)
        {
            TheLoai category = new TheLoai();
            SqlCommand command = truyVan1("select * from TheLoai5 where MaTLoai =@MaTLoai");
            command.Parameters.Add("@MaTLoai", SqlDbType.NVarChar).Value = MaTLoai;
            SqlDataReader reader = command.ExecuteReader();
            if (reader.Read())
            {
                category.MaTLoai = reader.GetString(0);
                category.TenTLoai = reader.GetString(1);
                category.GhiChu = reader.GetString(2);
            }
            reader.Close();
            return category;
        }
        public string delete(string MaTLoai)
        {
            try
            {
                SqlCommand command = truyVan1("delete from TheLoai5 where MaTLoai =@MaTLoai");
                command.Parameters.Add("@MaTLoai", SqlDbType.NVarChar).Value = MaTLoai;
                command.ExecuteNonQuery();
                return "Xoá thành công !";
            }
            catch (Exception e1)
            {
                return "Err: " + e1.Message;
            }
        }
        public string createCategory(TheLoai c)
        {
            try
            {
                SqlCommand command = truyVan1("insert into TheLoai5 values(@MaTLoai, @TenTLoai,@GhiChu)");
                command.Parameters.Add("@MaTLoai", SqlDbType.NVarChar).Value = c.MaTLoai;
                command.Parameters.Add("@TenTLoai", SqlDbType.NVarChar).Value = c.TenTLoai;
                command.Parameters.Add("@GhiChu", SqlDbType.NVarChar).Value = c.GhiChu;
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
