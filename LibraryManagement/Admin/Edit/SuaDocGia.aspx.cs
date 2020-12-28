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
    public partial class SuaDocGia : System.Web.UI.Page
    {
        const string srcImage = "~/images/docgia/";
        protected void Page_Load(object sender, EventArgs e)
        {
            DocGia docGia = (DocGia)Session["docgia"];
            if (!IsPostBack)
            {
                
                loadDropDoiTuong();
                if (docGia != null)
                {
                    txtMaDG.Text = docGia.MaDG;
                    txtTen.Text = docGia.TenDG;
                    imgDocGia.ImageUrl = srcImage+docGia.Anh;
                    dropDownDoiTuong.SelectedValue = docGia.MaDT;
                    radGT.SelectedValue = docGia.GT;
                    txtNgayCap.Text = docGia.NgayCap;
                    txtNgayHetHan.Text = docGia.NgayGiaHan;
                    txtNgaySinh.Text = docGia.NgaySinh;
                }
            }
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

        protected void btnQuayLai_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Admin/AQLDocGia.aspx");
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


        protected void btnSua_Click(object sender, EventArgs e)
        {
            string path = Server.MapPath(srcImage);
            DocGia docGia = new DocGia();
            docGia.MaDG = txtMaDG.Text;
            docGia.TenDG = txtTen.Text;
            docGia.GT = radGT.SelectedValue;
            docGia.NgaySinh = txtNgaySinh.Text;
            docGia.NgayCap = txtNgayCap.Text;
            docGia.NgayGiaHan = txtNgayHetHan.Text;
            docGia.MaDT = dropDownDoiTuong.SelectedValue;
            if (fileAnhUpload.HasFile)
            {
                fileAnhUpload.PostedFile.SaveAs(path + fileAnhUpload.FileName);
                docGia.Anh = fileAnhUpload.FileName;
                
            }
            lblThongbao.Text = new DocGiaBLL().suaDocGia(docGia);
        }
    }
}