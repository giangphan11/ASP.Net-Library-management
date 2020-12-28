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
    public partial class SuaChucVu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ChucVu chucVu = (ChucVu)Session["chucvu"];
                if (chucVu != null)
                {
                    txtMa.Text = chucVu.MaChucVu;
                    txtTen.Text = chucVu.TenChucVu;
                }
            }
            
        }

        protected void btnHuy_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Admin/AQLChucVu.aspx");
        }

        protected void btnSua_Click(object sender, EventArgs e)
        {
            lbThongBao.Text = "";
            ChucVu chucVu = new ChucVu();
            chucVu.MaChucVu = txtMa.Text;
            chucVu.TenChucVu = txtTen.Text;
            lbThongBao.Text = new ChucVuBLL().suaChucVu(chucVu);
            Session["chucvu"] = chucVu;
        }
    }
}