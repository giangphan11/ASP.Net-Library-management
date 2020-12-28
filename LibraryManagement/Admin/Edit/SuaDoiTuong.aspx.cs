using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTO;
using BLL;

namespace LibraryManagement.Admin.Edit
{
    public partial class SuaDoiTuong : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DoiTuong dt = (DoiTuong)Session["doituong"];
                txtMaDT.Text = dt.MaDT;
                txtTenDT.Text = dt.TenDT;
            }
        }

        protected void btnQuayLai_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Admin/AQLDoiTuong.aspx");
        }

        protected void btnSua_Click(object sender, EventArgs e)
        {
            lbThongBao.Text = "";
            DoiTuong dt = new DoiTuong();
            dt.MaDT = txtMaDT.Text;
            dt.TenDT = txtTenDT.Text;
            lbThongBao.Text = new DoiTuongBLL().suaDoiTuong(dt);
        }
    }
}