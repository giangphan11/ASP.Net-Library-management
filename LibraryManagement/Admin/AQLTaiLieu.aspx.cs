using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using DTO;
using System.Data;
using System.Data.SqlClient;
namespace LibraryManagement.Admin
{
    public partial class AQLTaiLieu : System.Web.UI.Page
    {
        TaiLieuBLL taiLieuBLL;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
                loadDropTheLoai();
                loadDroTacGia();
            }
                
        }
        protected void LoadData()
        {
            List<TaiLieu> dsTl = new List<TaiLieu>();
            SqlConnection conn = new SqlConnection(@"Data Source=GIANGPHAN;Initial Catalog=QuanLyTV4;Integrated Security=True");
            conn.Open();
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = "SELECT *FROM TaiLieu5";
            command.Connection = conn;
            SqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                TaiLieu tl = new TaiLieu();
                tl.MaTLieu = (string)reader["matlieu"];
                tl.TenTLieu = (string)reader["tentlieu"];
                tl.MaTLoai = (string)reader["matloai"];
                tl.SLuong = (int)reader["sluong"];
                tl.NXB = (string)reader["nxb"];
                tl.NamXB = (int)reader["namxb"];
                tl.Anh = ResolveUrl("~/images/tailieu/"+ (string)reader["anh"]); 
                tl.MaTG = (string)reader["matg"];
                dsTl.Add(tl);
            }
            reader.Close();
            grTaiLieu.DataSource = dsTl;
            DataBind();
        }
        private void loadDropTheLoai()
        {
            List<TheLoai> dsTL = new TheLoaiBLL().getListCategory();
            dropTheLoai.DataSource = dsTL;
            dropTheLoai.DataValueField = "MaTLoai";
            dropTheLoai.DataTextField = "TenTLoai";
            DataBind();
        }
        protected void quanLyXoa(object o, CommandEventArgs e)
        {
            if(e.CommandName == "xoaTaiLieu")
            {
                string ma = e.CommandArgument.ToString();
                taiLieuBLL = new TaiLieuBLL();
                messenger.Text = taiLieuBLL.deleteDoc(ma);
                LoadData();
            }
        }


        private void loadDroTacGia()
        {
            List<TacGia> dsTg = new TacGiaBLL().getTacGias();
            drTacGia.DataSource = dsTg;
            drTacGia.DataValueField = "MaTG";
            drTacGia.DataTextField = "TenTG";
            DataBind();
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            try
            {
                taiLieuBLL = new TaiLieuBLL();
                TaiLieu taiLieu = new TaiLieu();
                taiLieu.MaTLieu = txtMaTLieu.Text;
                taiLieu.MaTLoai = dropTheLoai.SelectedValue;
                taiLieu.TenTLieu = txtTenTLieu.Text;
                taiLieu.SLuong = Int32.Parse(txtSoLuong.Text);
                taiLieu.NXB = txtNXB.Text;
                taiLieu.NamXB = Int32.Parse(txtNamXB.Text);
                taiLieu.MaTG = drTacGia.SelectedValue;
                taiLieuBLL.addDocument(taiLieu);
                LoadData();
                messenger.Text = "Thêm thành công tài liệu.";
            }
            catch (Exception e1)
            {
                messenger.Text = "Thêm tài liệu thất bại" + e1.Message;
            }
        }

        protected void btnQuanLyTacGia_Click(object sender, EventArgs e)
        {
            Server.Transfer("/Admin/AQLTacGia.aspx");
        }
    }
}