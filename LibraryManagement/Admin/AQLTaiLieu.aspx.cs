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
            if (!IsPostBack)
            {
                LoadData();
                loadDropTheLoai();
            }
                
        }
        protected void LoadData()
        {
            taiLieuBLL= new TaiLieuBLL();
            List<TaiLieu> ds = taiLieuBLL.getListDocument();
            grTaiLieu.DataSource = ds;
            DataBind();
        }
        private void loadDropTheLoai()
        {
            List<TheLoai> dsTL = new TheLoaiBLL().getListCategory();
            dropTheLoai.DataSource = dsTL;
            dropTheLoai.DataValueField = "MaTLoai";
            dropTheLoai.DataTextField = "TenTLoai";
            DataBind();
        }
        protected void quanLyXoa(object o, CommandEventArgs e)
        {
            if(e.CommandName == "xoaTaiLieu")
            {
                string ma = e.CommandArgument.ToString();
                taiLieuBLL = new TaiLieuBLL();
                messenger.Text = taiLieuBLL.deleteDoc(ma);
                LoadData();
            }
        }
        protected void btnThem_Click(object sender, EventArgs e)
        {
            try
            {
                taiLieuBLL = new TaiLieuBLL();
                TaiLieu taiLieu = new TaiLieu();
                taiLieu.MaTLieu = txtMaTLieu.Text;
                taiLieu.MaTLoai = dropTheLoai.SelectedValue;
                taiLieu.TenTLieu = txtTenTLieu.Text;
                taiLieu.SLuong = Int32.Parse(txtSoLuong.Text);
                taiLieu.NXB = txtNXB.Text;
                taiLieu.NamXB = Int32.Parse(txtNamXB.Text);
                taiLieu.TG = txtTG.Text;
                taiLieuBLL.addDocument(taiLieu);
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