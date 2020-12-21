using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTO;
namespace LibraryManagement.Admin
{
    public partial class DashBoadAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            NhanVien nv = (NhanVien)Application["nhanvien"];
            if (nv == null)
            {
                Server.Transfer("/Login/LoginForm.aspx");
            }
            else
            {
                txtTen.Text = nv.TenNV;
            }
        }
    }
}