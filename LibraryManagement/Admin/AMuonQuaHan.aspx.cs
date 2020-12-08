using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTO;
namespace LibraryManagement.Admin
{
    public partial class AMuonQuaHan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            loadData();
            if (Session["nhanvien"] == null)
            {
                Server.Transfer("/Login/LoginForm.aspx");
            }
            else
            {
                DateTime dt = DateTime.Now;
                txtNgayLap.Text = dt.ToString("dd/MM/yyyy");
                NhanVien nv = (NhanVien)Session["nhanvien"];
                txtNguoiLap.Text = nv.TenNV;
            }
        }
       private void loadData()
        {

        }
    }
}