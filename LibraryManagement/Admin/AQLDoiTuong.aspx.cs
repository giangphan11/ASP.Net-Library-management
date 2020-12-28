using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTO;
using BLL;

namespace LibraryManagement.Admin
{
    public partial class AQLDoiTuong : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                loadData();
            }
        }
        private void loadData()
        {
            DoiTuongBLL doiTuongBLL = new DoiTuongBLL();
            List<DoiTuong> dsDT = doiTuongBLL.dsDoiTuong();
            gvDoiTuong.DataSource = dsDT;
            DataBind();
        }
        protected void xuLyXoa(object o, CommandEventArgs e)
        {
            if (e.CommandName == "xoaDt")
            {
                string ma = e.CommandArgument.ToString();
                lblThongBao.Text = new DoiTuongBLL().xoaDT(ma);
                loadData();
            }
        }

        protected void xuLySua(object o, CommandEventArgs e)
        {
            if (e.CommandName == "suaDt")
            {
                string ma = e.CommandArgument.ToString();
                DoiTuong doiTuong = new DoiTuongBLL().layDoiTuong(ma);
                Session["doituong"] = doiTuong;
                Response.Redirect("/Admin/Edit/SuaDoiTuong.aspx");
            }
        }


        protected void btnThem_Click(object sender, EventArgs e)
        {
            string ma = txtMaDT.Text;
            string ten = txtTenDT.Text;
            DoiTuong dt = new DoiTuong();
            dt.MaDT = ma;
            dt.TenDT = ten;
            lblThongBao.Text = "";
            lblThongBao.Text = new DoiTuongBLL().themDoiTuong(dt);
            loadData();
        }
    }
}