using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using DTO;
using System.Data;
using System.Data.SqlClient;
namespace LibraryManagement.Admin
{
    public partial class AQLTaiLieu : System.Web.UI.Page
    {
        TaiLieuBLL taiLieuBLL;
        const string srcImage = "~/images/tailieu/";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
                loadDropTheLoai();
                loadDroTacGia();
            }
                
        }
        protected void LoadData()
        {
            List<TaiLieu> dsTl = new TaiLieuBLL().getListDocument();
            foreach(TaiLieu tl in dsTl)
            {
                tl.Anh = ResolveUrl(srcImage + tl.Anh);
            } 
            grTaiLieu.DataSource = dsTl;
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

        protected void quanLySua(object o, CommandEventArgs e)
        {
            if(e.CommandName == "suaTaiLieu")
            {
                string ma = e.CommandArgument.ToString();
                TaiLieu taiLieu = new TaiLieuBLL().GetTaiLieuTheoMa(ma);
                Session["tailieu"] = taiLieu;
                Response.Redirect("/Admin/Edit/SuaTaiLieu.aspx");
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

        protected void btnThem_Click(object sender, EventArgs e)
        {
            messenger.Text = "";
            try
            {
                
                string path = Server.MapPath(srcImage);
                fileAnh.PostedFile.SaveAs(path + fileAnh.FileName);
                taiLieuBLL = new TaiLieuBLL();
                TaiLieu taiLieu = new TaiLieu();
                taiLieu.MaTLieu = txtMaTLieu.Text;
                taiLieu.MaTLoai = dropTheLoai.SelectedValue;
                taiLieu.TenTLieu = txtTenTLieu.Text;
                taiLieu.SLuong = Int32.Parse(txtSoLuong.Text);
                taiLieu.NXB = txtNXB.Text;
                taiLieu.NamXB = Int32.Parse(txtNamXB.Text);
                taiLieu.MaTG = drTacGia.SelectedValue;
                if (fileAnh.HasFile)
                {
                    taiLieu.Anh = fileAnh.FileName;
                }

                taiLieuBLL.addDocument(taiLieu);
                LoadData();
                messenger.Text = "Thêm thành công tài liệu.";
            }
            catch (Exception e1)
            {
                messenger.Text = "Thêm tài liệu thất bại" + e1.Message;
            }
        }

        protected void btnQuanLyTacGia_Click(object sender, EventArgs e)
        {
            Server.Transfer("/Admin/AQLTacGia.aspx");
        }

        protected void btnTimKiem_Click(object sender, EventArgs e)
        {
            lblTK.Text = "";
            string ten = txtTimKiem.Text;
            if (ten.Length > 0)
            {
                List<TaiLieu> dsTl = new TaiLieuBLL().getListDocument("%"+ten+"%");
                lblTK.Text = "Kết quả tìm kiếm: " + dsTl.Count;
                foreach (TaiLieu tl in dsTl)
                {
                    tl.Anh = ResolveUrl(srcImage + tl.Anh);
                }
                grTaiLieu.DataSource = dsTl;
                DataBind();
            }
            else
            {
                LoadData();
            }
        }
    }
}