using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTO;
namespace LibraryManagement.Admin
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            NhanVien nv = (NhanVien)Session["nhanvien"];
            img_Anh.ImageUrl = "~/images/"+nv.Anh;
        }
        
    }
}