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
        const string srcImage = "~/images/";
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
            foreach(NhanVien nv in dsNv)
            {
                nv.Anh = ResolveUrl(srcImage + nv.Anh);
            }
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

        protected void xu_ly_sua(object o, CommandEventArgs e)
        {
            if (e.CommandName == "suanv")
            {
                string ma = e.CommandArgument.ToString();
                NhanVien nv = new NhanVienBLL().getNhanVienByMa(ma);
                Session["nhanv"] = nv;
                Response.Redirect("/Admin/Edit/SuaNhanVien.aspx");
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

        protected void btnTimKiem_Click(object sender, EventArgs e)
        {
            lbTK.Text = "";
            string ten = txtTimKiem.Text;
            if (ten.Length > 0)
            {
                NhanVienBLL nhanVienBLL = new NhanVienBLL();
                List<NhanVien> dsNv = nhanVienBLL.getAllNhanVien("%"+ten+"%");
                lbTK.Text = "Kết quả tìm kiếm: " + dsNv.Count;
                foreach (NhanVien nv in dsNv)
                {
                    nv.Anh = ResolveUrl(srcImage + nv.Anh);
                }
                gvNhanVien_ad.DataSource = dsNv;
                DataBind();
            }
            else
            {
                loadData();
            }
        }
    }
}