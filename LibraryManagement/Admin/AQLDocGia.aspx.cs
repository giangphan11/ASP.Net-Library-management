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
    }
}