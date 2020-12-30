using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTO;
using BLL;
namespace LibraryManagement.Admin.Edit
{
    public partial class SuaTaiLieu : System.Web.UI.Page
    {

        private TaiLieu taiLieu =null;
        const string srcImage = "~/images/tailieu/";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadDropTheLoai();
                loadDroTacGia();
            }

            taiLieu = (TaiLieu)Session["tailieu"];

            if (taiLieu != null)
            {
                txtMaTLieu.Text = taiLieu.MaTLieu;
                txtTenTLieu.Text = taiLieu.TenTLieu;
                txtSoLuong.Text = taiLieu.SLuong.ToString();
                txtNamXB.Text = taiLieu.NamXB.ToString();
                txtNXB.Text = taiLieu.NXB;
                imgAnhTL.ImageUrl = srcImage + taiLieu.Anh;
                dropTheLoai.SelectedValue = taiLieu.MaTLoai;
            }
        }



        private void loadDroTacGia()
        {
            List<TacGia> dsTg = new TacGiaBLL().getTacGias();
            drTacGia.DataSource = dsTg;
            drTacGia.DataValueField = "MaTG";
            drTacGia.DataTextField = "TenTG";
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

        protected void btnHuyBo_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Admin/AQLTaiLieu.aspx");
        }

        protected void btnSua_Click(object sender, EventArgs e)
        {
            lbl1.Text = "";
            string path = Server.MapPath(srcImage);
            fileAnh.PostedFile.SaveAs(path + fileAnh.FileName);
            TaiLieu taiLieu = new TaiLieu();
            taiLieu.MaTLieu = txtMaTLieu.Text;
            taiLieu.MaTLoai = dropTheLoai.SelectedValue;
            taiLieu.TenTLieu = txtTenTLieu.Text;
            taiLieu.SLuong = Int32.Parse(txtSoLuong.Text);
            taiLieu.NXB = txtNXB.Text;
            taiLieu.NamXB = Int32.Parse(txtNamXB.Text);
            taiLieu.MaTG = drTacGia.SelectedValue;
            taiLieu.Anh = fileAnh.FileName;
            lbl1.Text = new TaiLieuBLL().suaTaiLieu(taiLieu);
        }
    }
}