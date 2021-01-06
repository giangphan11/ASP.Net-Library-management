using BLL;
using DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryManagement.Admin
{
    public partial class AQLDocGia : System.Web.UI.Page
    {
        const string srcImage = "~/images/docgia/";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadGridView();
                loadDropDoiTuong();
                CalendarExtender2.SelectedDate = DateTime.Today;
            }
        }
        private void loadGridView()
        {
            DocGiaBLL docGiaBLL = new DocGiaBLL();
            List<DocGia> dsDocGia = docGiaBLL.dsDocGia();
            gvDocGia_a.DataSource = dsDocGia;
            foreach(DocGia docGia in dsDocGia)
            {
                docGia.Anh = ResolveUrl(srcImage + docGia.Anh);
            }
            DataBind();
        }
        private void loadDropDoiTuong()
        {
            DoiTuongBLL doiTuongBLL = new DoiTuongBLL();
            List<DoiTuong> dsDT = doiTuongBLL.dsDoiTuong();
            dropDownDoiTuong.DataSource = dsDT;
            dropDownDoiTuong.DataValueField = "MaDT";
            dropDownDoiTuong.DataTextField = "TenDT";
            DataBind();
        }
        protected void xuLyXoa(object o, CommandEventArgs e)
        {
            if(e.CommandName == "xoa")
            {
                string ma = e.CommandArgument.ToString();
                DocGiaBLL docGiaBLL = new DocGiaBLL();
                lblNo.Text = docGiaBLL.xoaDocGia(ma);
                loadGridView();
            }
        }
        protected void xuLySua(object o, CommandEventArgs e)
        {
            if (e.CommandName == "sua")
            {
                string ma = e.CommandArgument.ToString();
                DocGia docGia = new DocGiaBLL().layDocGia(ma);
                Session["docgia"] = docGia;
                Response.Redirect("/Admin/Edit/SuaDocGia.aspx");
            }
        }

        protected void ibtCal_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void ibtCal2_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void ibtCal3_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            DocGia docGia = new DocGia();
            string path = Server.MapPath(srcImage);
            docGia.MaDG = txtMaDG.Text;
            docGia.TenDG = txtTen.Text;
            docGia.MaDT = dropDownDoiTuong.SelectedValue;
            docGia.GT = radGT.SelectedValue;
            docGia.NgayCap = txtNgayCap.Text;
            docGia.NgaySinh = txtNgaySinh.Text;
            docGia.NgayGiaHan = txtNgayHetHan.Text;
            if (fileAnhUpload.HasFile)
            {
                fileAnhUpload.PostedFile.SaveAs(path + fileAnhUpload.FileName);
                docGia.Anh = fileAnhUpload.FileName;
            }
            lblKetQua.Text = new DocGiaBLL().themDocGia(docGia);
            loadGridView();
        }

        protected void btnTimKiem_Click(object sender, EventArgs e)
        {
            lblTK.Text = "";
            string ten = txtTimKiem.Text;
            if (ten.Length > 0)
            {
                DocGiaBLL docGiaBLL = new DocGiaBLL();
                List<DocGia> dsDocGia = docGiaBLL.dsDocGia("%"+ten.Trim()+"%");
                lblTK.Text = "Kết quả tìm kiếm: " + dsDocGia.Count;
                gvDocGia_a.DataSource = dsDocGia;
                foreach (DocGia docGia in dsDocGia)
                {
                    docGia.Anh = ResolveUrl(srcImage + docGia.Anh);
                }
                DataBind();
            }
            else
            {
                loadGridView();
            }
        }
    }
}