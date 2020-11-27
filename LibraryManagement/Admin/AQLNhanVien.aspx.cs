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
    public partial class AQLNhanVien : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadData();
                loadDropListCV();

            }

        }
        private void loadDropListCV()
        {
            ChucVuBLL chucVuBLL = new ChucVuBLL();
            List<ChucVu> dsChucVu = chucVuBLL.getChucVu();
            dropDownListCV.DataSource = dsChucVu;
            dropDownListCV.DataTextField = "TenChucVu";
            dropDownListCV.DataValueField = "MaChucVu";
  
            DataBind();
        }
        private void loadData()
        {
            NhanVienBLL nhanVienBLL = new NhanVienBLL();
            List<NhanVien> dsNv = nhanVienBLL.getAllNhanVien();
            gvNhanVien_ad.DataSource = dsNv;
            DataBind();
        }
        protected void xu_ly_XoaNV(object o, CommandEventArgs e)
        {
            if (e.CommandName == "xoanv")
            {
                string ma = e.CommandArgument.ToString();
                NhanVienBLL nhanVienBLL = new NhanVienBLL();
                lblThongBao.Text = nhanVienBLL.xoaNhanVien(ma);
                loadData();
            }
            else return;
        }

        protected void xuLyThem(object sender, EventArgs e)
        {
            string path = Server.MapPath("~/images/");
            if (fileUploadAnh.HasFile)
            {
                fileUploadAnh.PostedFile.SaveAs(path + fileUploadAnh.FileName);
                NhanVien nv = new NhanVien();
                nv.MaNV = txtMaNV.Text;
                nv.TenNV = txtTen.Text;
                nv.MaCV = dropDownListCV.SelectedValue;
                nv.Username = txtUsername.Text;
                nv.PassWord = txtPass.Text;
                nv.Anh = fileUploadAnh.FileName;
                NhanVienBLL nhanVienBLL = new NhanVienBLL();
                lblThongBao.Text = nhanVienBLL.themNhanVien(nv);
                loadData();
            }
            else
            {
                lblThongBao.Text = "No file seleted!!";
                return;
            }
        }
    }
}