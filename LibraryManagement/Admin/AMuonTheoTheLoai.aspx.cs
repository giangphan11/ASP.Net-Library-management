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
    public partial class AMuonTheoTheLoai : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            loadDataAll();
            if (Application["nhanvien"] == null)
            {
                Server.Transfer("/Login/LoginForm.aspx");
            }
            else
            {
                DateTime dt = DateTime.Now;
                txtNgayLap.Text = dt.ToString("dd/MM/yyyy");
                NhanVien nv = (NhanVien)Application["nhanvien"];
                txtNguoiLap.Text = nv.TenNV;
            }
        }

        private void loadDataAll()
        {
            DateTime dNow = DateTime.Now;
            List<MuonTheoTheLoai> dsM = new MuonTheoTheLoaiBLL().muonTheoTheLoaisAll(dNow);
            GridView1.DataSource = dsM;
            DataBind();
        }
        private void loadData2(DateTime d1, DateTime d2)
        {
            List<MuonTheoTheLoai> dsM = new MuonTheoTheLoaiBLL().muonTheoTheLoaisDate(d1, d2);
            GridView1.DataSource = dsM;
            DataBind();
        }

        protected void btnXem_Click(object sender, EventArgs e)
        {
            DateTime date1 = DateTime.Parse(txtDate1.Text);
            DateTime date2 = DateTime.Parse(txtDate2.Text);
            loadData2(date1, date2);
        }
    }
}