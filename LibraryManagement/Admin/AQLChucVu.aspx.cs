using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTO;
using BLL;
using System.Text;

namespace LibraryManagement.Admin
{
    public partial class AQLChucVu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                loadData();
        }


        private void loadData()
        {
            ChucVuBLL chucVuBLL = new ChucVuBLL();
            List<ChucVu> dsChucVu = chucVuBLL.getChucVu();
            gvChucVu_ad.DataSource = dsChucVu;
            DataBind();
        }
        protected void quanLyXoa(object sender, CommandEventArgs e)
        {
            if(e.CommandName== "xoaChucVu")
            {
                string ma = e.CommandArgument.ToString();
                ChucVuBLL chucVuBLL = new ChucVuBLL();
                lblThongBao.Text = chucVuBLL.xoaCV(ma);
                loadData();
            }
        }
        protected void suaChucVu(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "suaChucVu")
            {
                string ma = e.CommandArgument.ToString();
                ChucVuBLL chucVuBLL = new ChucVuBLL();
                Session["chucvu"] =chucVuBLL.getChucVuTheoMa(ma);
                Response.Redirect("/Admin/Edit/SuaChucVu.aspx");
            }
        }
        protected void btnThem_Click(object sender, EventArgs e)
        {
            ChucVuBLL chucVuBLL = new ChucVuBLL();
            ChucVu cv = new ChucVu();
            cv.MaChucVu = txtMa.Text;
            cv.TenChucVu = txtTen.Text;
            lblThongBao.Text = chucVuBLL.themCV(cv);
            loadData();
        }

        protected void btnTimKiem_Click(object sender, EventArgs e)
        {
            lblTK.Text = "";
            string ten = txtTimKiem.Text;
            if (ten.Length > 0)
            {
                ChucVuBLL chucVuBLL = new ChucVuBLL();
                List<ChucVu> dsChucVu = chucVuBLL.getChucVu("%"+ten+"%");
                lblTK.Text = "Kết quả tìm kiếm: " + dsChucVu.Count;
                gvChucVu_ad.DataSource = dsChucVu;
                DataBind();
            }
            else
            {
                loadData();
            }
        }
    }
}