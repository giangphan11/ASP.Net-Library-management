using DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryManagement
{
    public partial class ControlForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            NhanVien nv = (NhanVien)Session["nhanvien"];
            if (nv.Quyen == 0)
            {
                Response.Redirect("/Admin/Admin0.aspx");
            }
            else
            {
                Response.Redirect("/Admin/Admin1.aspx");
            }
        }
    }
}