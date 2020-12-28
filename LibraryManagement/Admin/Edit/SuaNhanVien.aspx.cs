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
    public partial class SuaNhanVien : System.Web.UI.Page
    {
        private NhanVien nv = null;
        const string srcImage = "~/images/";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                nv = (NhanVien)Session["nhanv"];
                loadDropListCV();
                txtMaNV.Text = nv.MaNV;
                txtTen.Text = nv.TenNV;
                txtPass.Text = nv.PassWord;
                txtUsername.Text = nv.Username;
                imgHead.ImageUrl = srcImage + nv.Anh;
                dropDownListCV.SelectedValue = nv.MaCV;
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


        protected void btnQuayLai_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Admin/AQLNhanVien.aspx");
        }

        protected void btnSua_Click(object sender, EventArgs e)
        {
            lblThongBao.Text = "";
            NhanVien nv = new NhanVien();
            nv.MaCV = dropDownListCV.SelectedValue;
            nv.MaNV = txtMaNV.Text;
            nv.TenNV = txtTen.Text;
            nv.Username = txtUsername.Text;
            nv.PassWord = txtPass.Text;
            string path = Server.MapPath(srcImage);
            fileUploadAnh.PostedFile.SaveAs(path + fileUploadAnh.FileName);
            nv.Anh = fileUploadAnh.FileName;

            lblThongBao.Text = new NhanVienBLL().suaNhanVien(nv);
            Session["nhanv"] = nv;
        }
    }
}