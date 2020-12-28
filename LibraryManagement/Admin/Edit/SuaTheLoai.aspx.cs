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
    public partial class SuaTheLoai : System.Web.UI.Page
    {
        private TheLoai theLoai = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            theLoai = (TheLoai) Session["theloai"];
            if(theLoai != null)
            {
                txtMa.Text = theLoai.MaTLoai;
                txtTen.Text = theLoai.TenTLoai;
                txtGhiChu.Text = theLoai.GhiChu;
            }
        }

        protected void btnHuy_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Admin/AQLTheLoai.aspx");
        }

        protected void btnSua_Click(object sender, EventArgs e)
        {
            lb1.Text = "";
            TheLoaiBLL theLoaiBLL = new TheLoaiBLL();
            TheLoai category = new TheLoai();
            category.MaTLoai = txtMa.Text;
            category.TenTLoai = txtTen.Text;
            category.GhiChu = txtGhiChu.Text;
            lb1.Text = theLoaiBLL.suaTheLoai(category);
        }
    }
}