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
        //public string truyVan2(string name,string sql)
        //{
        //    try
        //    {
        //        openConnection();
        //        SqlCommand
        //        return name + " thành công !";
        //    }
        //    catch(Exception ex)
        //    {
        //        return "Lỗi: " + ex.Message;
        //    }
        //}
    }
}
