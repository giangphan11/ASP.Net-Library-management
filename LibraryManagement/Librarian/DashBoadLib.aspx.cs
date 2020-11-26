using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTO;
namespace LibraryManagement.Librarian
{
    public partial class DashBoadLib : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            NhanVien nv = (NhanVien)Session["nhanvien"];
            if (nv == null)
            {
                Server.Transfer("/Login/LoginForm.aspx");
            }
            else
            {
                txtTenThuThu.Text = nv.TenNV;
            }
        }
    }
}