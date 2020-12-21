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
    public partial class ATop10TL : System.Web.UI.Page
    {
        private bool flag = false;
        private bool flag2 = false;
        protected void Page_Load(object sender, EventArgs e)
        {
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
            if (!IsPostBack)
            {
                loadData();
            }
        }
        private void loadData2(DateTime d1, DateTime d2)
        {
            List<TopSach> dsM = new TopSachBLL().dsTopSach(d1, d2);
            gridView1.DataSource = dsM;
            DataBind();
        }

        private void loadData()
        {
            List<TopSach> topSaches = new TopSachBLL().dsTopSach();
            gridView1.DataSource = topSaches;
            DataBind();
        }

        protected void btnXem_Click(object sender, EventArgs e)
        {
            if (flag && flag2)
            {
                DateTime date1 = DateTime.Parse(txtDate1.Text);
                DateTime date2 = DateTime.Parse(txtDate2.Text);
                loadData2(date1, date2);
            }
            else return;
            
        }

        protected void txtDate1_TextChanged(object sender, EventArgs e)
        {
            flag = true;
        }

        protected void txtDate2_TextChanged(object sender, EventArgs e)
        {
            flag2 = true;
        }
    }
}