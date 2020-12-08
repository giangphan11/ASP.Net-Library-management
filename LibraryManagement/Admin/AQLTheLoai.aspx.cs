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
    public partial class AQLTheLoai : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                loadData();
        }


        private void loadData()
        {
            TheLoaiBLL chucVuBLL = new TheLoaiBLL();
            List<TheLoai> list = chucVuBLL.getListCategory();
            grd.DataSource = list;
            DataBind();
        }
        private void clear()
        {
            txtMa.Text = "";
            txtTen.Text = "";
            txtGhiChu.Text = "";
        }
        protected void delete(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "delete")
            {
                try
                {
                    string ma = (e.CommandArgument).ToString();
                    TheLoaiBLL theloaiBLL = new TheLoaiBLL();
                    theloaiBLL.delete(ma);
                    loadData();
                    messenger.Text = "Category deleted !@";
                }
                catch(Exception ex)
                {
                    messenger.Text = "Err: " + ex.Message;
                }
            }
        }
        protected void update(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "update")
            {
                messenger.Text = "vao";
                string ma = e.CommandArgument.ToString();
                TheLoaiBLL chucVuBLL = new TheLoaiBLL();
                Session["theloai"] = chucVuBLL.findById(ma);
                Response.Redirect("/Admin/Edit/SuaChucVu.aspx");
            }
        }
        protected void btnThem_Click(object sender, EventArgs e)
        {
            try
            {
                TheLoaiBLL theLoaiBLL = new TheLoaiBLL();
                TheLoai category = new TheLoai();
                category.MaTLoai = txtMa.Text;
                category.TenTLoai = txtTen.Text;
                category.GhiChu = txtGhiChu.Text;
                theLoaiBLL.create(category);
                messenger.Text = theLoaiBLL.create(category);
                loadData();
                clear();
                messenger.Text = "Category Inserted !";
            }
            catch(Exception ex)
            {
                messenger.Text = ex.Message;
            }
            

        }

        protected void grd_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}