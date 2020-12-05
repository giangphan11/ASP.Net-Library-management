using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using DTO;

namespace LibraryManagement.Admin
{
    public partial class AQLTaiLieu : System.Web.UI.Page
    {
        TaiLieuBLL taiLieuBLL;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
                LoadData();
        }
        protected void LoadData()
        {
            taiLieuBLL= new TaiLieuBLL();
            List<TaiLieu> ds = taiLieuBLL.getListDocument();
            grTaiLieu.DataSource = ds;
            DataBind();
        }
        protected void btnThem_Click(object sender, EventArgs e)
        {
            try
            {
                taiLieuBLL = new TaiLieuBLL();
                TaiLieu tl = new TaiLieu();
                tl.MaTLieu = txtMaTLieu.Text;
                tl.TenTLieu = txtTenTLieu.Text;
                tl.MaTLoai = dropTLoai.Text;
                tl.SLuong = int.Parse(txtSoLuong.Text);
                tl.NXB = txtNXB.Text;
                tl.NamXB = int.Parse(txtNamXB.Text);
                taiLieuBLL.addDocument(tl);
                LoadData();
                messenger.Text = "Thêm thành công tài liệu.";
            }
            catch (Exception e1)
            {
                messenger.Text = "Thêm tài liệu thất bại" + e1.Message;
            }
        }
    }
}