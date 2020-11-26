using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryManagement.Admin
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void xuLyThoat(object sender, EventArgs e)
        {
            Session["nhanvien"] = null;
            Response.Redirect("/Login/LoginForm.aspx");
        }
    }
}